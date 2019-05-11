#include "imageprocess.h"

#include <stdlib.h>

using namespace cv;
using namespace std;

constexpr int SCALE = 20;
RNG rng(12345);

Mat ImageProcessing::inv_persp(const Mat& src)
{
    // Inverse Perspective Mapping

    // Decompose the projection matrix into:
    // intrinsic parameter matrix
    Mat K = (Mat_<double>(3, 3) <<
        3100.884521484375,0.00000,1024.00000,
        0.00000,3100.884521484375,768.00000,
        0.00000,      0.00000,    1.00000);

    // distortion coefficients vector
    Mat distCoeff = (Mat_<double>(5, 1) <<
        0.0, 0.0, 0.0, 0.0, 0.0);

    // extrinsic parameter matrix
    // rotation vector
    Mat rvec = (Mat_<double>(3, 1) <<
        0.15610699, 0.03508545, 0.00604089);

    // translation vector
    Mat tvec = (Mat_<double>(3, 1) <<
        -0.01607784, 4.92202892, -1.91157204);

    const int roi_left = -10;
    const int roi_right = 10;
    const float roi_near = 14.0;
    const int length = 100;

    // массив точек объекта objectPoints 3D
    vector<Point3f> objectPoints;
    objectPoints.push_back(Point3f(roi_left, 0, roi_near));
    objectPoints.push_back(Point3f(roi_right, 0, roi_near));
    objectPoints.push_back(Point3f(roi_left, 0, roi_near + length));
    objectPoints.push_back(Point3f(roi_right, 0, roi_near + length));

    // cv::projectPoints -> массив точек на изображении imgPoints 2D
    vector<Point2f> imgPoints;

    projectPoints(objectPoints, rvec, tvec, K, distCoeff, imgPoints);

    // The 4 points where the mapping is to be done
    const int out_width = SCALE * fabs(roi_left) + SCALE * roi_right;
    const int out_height = SCALE * length;

    vector<Point2f> pts2;
    pts2.push_back(Point2f(0, out_height));
    pts2.push_back(Point2f(out_width, out_height));
    pts2.push_back(Point2f(0, 0));
    pts2.push_back(Point2f(out_width,0));

    // Get the Perspective Transform Matrix
    Mat M(Size(2, 4), CV_32FC1);
    M = getPerspectiveTransform(imgPoints, pts2);

    // Apply the Perspective Transform just found to the src image
    Mat out(Size(out_width, out_height), CV_8UC1);
    warpPerspective(src, out, M, out.size());

    // *tm = M;             // матрица преобразования исходного изображения в обратную перспективу
    return out;          // изображение в обратной перспективе
}

Mat ImageProcessing::otsuEgBinarize(const Mat& iRevPerspView)
{
    /* Theory
     * Step 1: Get each channel component from BGR Image.
     * Step 2: Calculate Excess Green like:
     *         E*G = 2*G-R-B.
     * Step 3: Threshold E*G (Excess Green) image using Otsu method.
     * Result: E*G+Otsu Binary Image.
     */

    // Initialize arrays.
    Mat BGR_channels[3];
    Mat EG;
    Mat B, G, R;
    Mat oEgThreshOtsu;

    // Separate reverse perspective view image (iRevPerspView)
    // on B,G,R component channels.
    split(iRevPerspView, BGR_channels);

    // Get B,G,R component channels.
    B = BGR_channels[0];
    G = BGR_channels[1];
    R = BGR_channels[2];

    // Calculate 2*G.
    multiply(G, 2, EG);

    //Calculate 2*G-R.
    subtract(EG, R, EG);

    //Calculate 2*G-R-B.
    subtract(EG, B, EG);

    // Binarize Excess Green image using Otsu threshold method.
    threshold(EG, oEgThreshOtsu, 0, 255, CV_THRESH_OTSU);

    return oEgThreshOtsu;
}

Mat ImageProcessing::setColorContour(const Mat& iBinImg)
{
    vector<vector<Point>> contours;
    vector<Vec4i> hierarchi;

    findContours(iBinImg, contours, hierarchi,
                 CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, Point(0, 0) );

    Mat oDrawing = Mat::zeros(iBinImg.size(), CV_8UC3);
    for (unsigned int i = 0; i < contours.size(); i++)
    {
        Scalar color = Scalar(rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255));
        drawContours(oDrawing, contours, i, color, 2, 8, hierarchi, 0, Point());
    }

    return oDrawing;
}

Mat ImageProcessing::claheOperation(const Mat &iIpm)
{
    Mat lab_img;

    // Convert from RGB to CIE L*a*b* color space.
    // исходное - в RGB.
    cvtColor(iIpm, lab_img, CV_RGB2Lab);

    // Extract the L channel.
    vector<Mat> lab_planes(3);
    // The L image is in lab_planes[0]
    split(lab_img, lab_planes);

    // apply the CLAHE algorithm to the L channel.
    Ptr<CLAHE> clahe = createCLAHE();
    clahe->setClipLimit(4);

    Mat clahe_out;
    clahe->apply(lab_planes[0], clahe_out);

    // Merge the the color planes back into an Lab image.
    clahe_out.copyTo(lab_planes[0]);
    merge(lab_planes, lab_img);

    // Convert to BGR color space.
    Mat clahe_img;
    cvtColor(lab_img, clahe_img, CV_Lab2BGR);

    Mat sharp;
    GaussianBlur(clahe_img, sharp, Size(0, 0), 3);

    Mat res;
    addWeighted(clahe_img, 2.0, sharp, -1.0, 1.5, res);

    return res;
}

Mat ImageProcessing::gauss_difference(const Mat &src, int kSize1, int kSize2)
{
    Mat dst1, dst2;

    GaussianBlur(src, dst1, Size(kSize1, kSize1), 0);

    GaussianBlur(src, dst1, Size(kSize2, kSize2), 0);

    Mat res;
    subtract(dst1, dst2, res);

    return res;
}

Mat ImageProcessing::adaptiveGammaCorrection(const Mat &Iin)
{
    Mat Iout;

    float maxIntensityValue = 255.0;

    // Convert BGR Image Iin to HSV colorspace.
    Mat converted;
    cvtColor(Iin, converted, CV_BGR2HSV);

    converted.convertTo(converted, CV_32F);

    // Extract the Value channel.
    vector<Mat> hsv_planes(3);
    // The V image is in hsv_planes[2]
    split(converted, hsv_planes);

    // Divide all values in V channel for representing in range 0..1.
    divide(hsv_planes[2], maxIntensityValue, hsv_planes[2]);

    // Set a suitable choice for characterizing
    // the contrasts of different images.
    uint tetta = 3;

    // Find mean and standart deviation.
    Scalar v_mean, v_std;
    meanStdDev(hsv_planes[2], v_mean, v_std);

    // Calculate difference between (mean+2*std) and (mean-2*std).
    // After siplifying diff = 4*std.
    float diff = 4 * v_std.val[0];

    float gamma;
    Mat sGC;

    /* Image classification
            /       \
    Low Contrast    High Contrast
        /   \           /   \
    Dark    Bright   Dark   Bright
    */

    if (islessequal(diff, (float) 1/tetta))
        // Low contrast image
    {
        // Calculate gamma param.
        gamma = - log2(v_std.val[0]);

        sGC = standartGammaCorrection(hsv_planes[2], gamma);

        if (isless(v_mean.val[0], 0.5))
            // Dark images
        {
            // If mean < 0.5.
            // c_param needn't to calc.
            // k_mat needn't to calc.
            Mat denominator;

            // Create ones matrix same size as sGC.
            Mat onesMat = Mat::ones(sGC.rows, sGC.cols, CV_32F);

            // Calculate (1 - Iin^gamma).
            subtract(onesMat, sGC, denominator);

            // Calculate (1 - Iin^gamma)*mean^gamma.
            multiply(denominator, pow(v_mean.val[0], gamma), denominator);

            // Calculate Iin^gamma+(1 - Iin^gamma)*mean^gamma.
            add(sGC, denominator, denominator);

            // Calculate (Iin^gamma)/[Iin^gamma+(1 - Iin^gamma)*mean^gamma].
            divide(sGC, denominator, Iout);
        }
        else
            // Bright images
        {
            // If mean 0.5.
            // k_mat needn't to calc.
            // c_param = 1 but not used.

            // Do nothing.
            // The image already been enhanced.

            sGC.copyTo(Iout);
        }
    }
    else
        // High contrast image
    {
        // Calculate gamma param.
        gamma = exp((1-(v_mean.val[0] + v_std.val[0]))/2);

        sGC = standartGammaCorrection(hsv_planes[2], gamma);

        if (isless(v_mean.val[0], 0.5) &&
           (islessequal(v_mean.val[0] + v_std.val[0], 1)))
            // Dark images
        {
            // Do nothing.
            // The image already been enhanced.

            sGC.copyTo(Iout);
        }
        else
            // Bright images
        {
            Mat k_mat;

            // Create ones matrix same size as sGC.
            Mat onesMat = Mat::ones(sGC.rows, sGC.cols, CV_32F);

            // Calculate (1 - Iin^gamma).
            subtract(onesMat, sGC, k_mat);

            // Calculate (1 - Iin^gamma)*mean^gamma.
            multiply(k_mat, pow(v_mean.val[0], gamma), k_mat);

            // Calculate Iin^gamma+(1 - Iin^gamma)*mean^gamma.
            add(sGC, k_mat, k_mat);

            Mat denominator;
            Mat c_param;

            // Calculate k - 1.
            subtract(k_mat, onesMat, denominator);

            // Calculate Heaviside(0.5 - mean)*(k - 1).
            multiply(denominator, heaviside(0.5 - v_mean.val[0]), denominator);

            // Calculate 1 + Heaviside(0.5-mean)*(k - 1).
            add(onesMat, denominator, denominator);

            // Calculate 1/[1 + Heaviside(0.5-mean)*(k - 1)].
            divide(onesMat, denominator, c_param);

            // Calcaulate c*Iin
            multiply(c_param, sGC, Iout);
        }
    }

    Iout.copyTo(hsv_planes[2]);

    multiply(hsv_planes[2], maxIntensityValue, hsv_planes[2]);

    Mat res;

    CV_Assert(hsv_planes.size() == 3);

    cv::merge(hsv_planes, res);

    res.convertTo(res, CV_8U);

    cvtColor(res, res, CV_HSV2BGR);

    return res;
}

Mat ImageProcessing::standartGammaCorrection(const Mat &channel, float &gamma)
{
    /* Theory
     * Step 1: Get Value channel component from HSV Image.
     * Step 2: Use standart gamma correction via:
     *         I^gamma = n * (I/n)^(1/gamma).
     *         But input channel I is in range 0..1 yet.
     *         Then formula will be:
     *         I^gamma = I^(1/gamma).
     * Result: Corrected HSV Image.
     */

    Mat corrected;

    // The V image is in channel

    // Calculate (I/n)^(1/gamma).
    cv::pow(channel, 1 / gamma, corrected);

    return corrected;
}

Mat ImageProcessing::skeletonMorphOperation(const Mat &threshed)
{
    Mat skeleted;

    ThinningTypes type1 = THINNING_GUOHALL;
    //ThinningTypes type2 = THINNING_ZHANGSUEN;

    thinning(threshed, skeleted, type1);

    return skeleted;
}

Mat ImageProcessing::standartHoughTransformation(const Mat &skeleted, const float &maxAngle)
{
    Mat standartHough;

    vector<Vec2f> sLines;

    cvtColor(skeleted, standartHough, COLOR_GRAY2BGR);

    HoughLines(skeleted, sLines, 1, maxAngle*CV_PI/180, 0, 0);

    for (size_t i = 0; i < sLines.size(); i++)
    {
        float r = sLines[i][0];
        float t = sLines[i][1];

        double cos_t = cos(t);
        double sin_t = sin(t);

        double x0 = r*cos_t;
        double y0 = r*sin_t;

        double alpha = 1000;

        Point pt1(cvRound(x0 + alpha*(-sin_t)), cvRound(y0 + alpha*cos_t));
        Point pt2(cvRound(x0 - alpha*(-sin_t)), cvRound(y0 - alpha*cos_t));

        line(standartHough, pt1, pt2, Scalar(0, 0, 255), 1, LINE_4);
    }

    return standartHough;
}

Mat ImageProcessing::probablisticHoughTransform(const Mat &skeleted, const float &maxAngle)
{
    Mat probablisticHough;

    vector<Vec4i> pLines;

    cvtColor(skeleted, probablisticHough, COLOR_GRAY2BGR);

    HoughLinesP(skeleted, pLines, 1, maxAngle*CV_PI/180, 0, 50, 10);

    Vec4i l;
    float angleP = 0;
    // Maximal angle deviation in degrees.
    float maxAngleDeviation = 20.0;

    for (size_t i = 0; i < pLines.size(); i++)
    {
        l = pLines[i];

        angleP = calcAngleP(l);

        // Check angle deviation \ | / current maximum = 20 degrees.
        if ((isgreater(angleP, 90 - maxAngleDeviation)) && (isless(angleP, 90 + maxAngleDeviation)))
        {
            line(probablisticHough, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0, 0, 255), 3, LINE_AA);
        }
        else
        {
            pLines.erase(pLines.begin() + i);
        }
    }

    return probablisticHough;
}

bool ImageProcessing::heaviside(const float &x)
{
    /* Theory
     *               / 0, x <= 0
     * Heaviside(x)= |
     *               \ 1, x > 0
     */

    if (islessequal(x, 0.0))
        return 0;
    else
        return 1;
}

float ImageProcessing::calcAngleP(const Vec4i &line)
{
    Point p1, p2;

    p1 = Point(line[0], line[1]);
    p2 = Point(line[2], line[3]);

    // Calculate angle in radian
    float angle = abs(atan2(p1.y - p2.y, p1.x - p2.x));

    // Calculate angle in degrees
    angle = angle * 180 / CV_PI;

    return angle;
}
