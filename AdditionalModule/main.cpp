/* TODO:
 * 1. Change from settable custom threshold value clipLimit of
 *    clahe->setClipLimit to autocalculated value for contrast
 *    limiting in claheOperation() function.
 * 2. Try to use Skeleton Morphological Operation to delete
 *    auxiliary lines.
 * 3. If need try to fill binary image by specific blob
 *    threshold value (current = 20).
 * 4. Try to select and put specific algorithm to any branch
 *    of Adaptive Gamma Correction method.
 */

#include <QApplication>
#include <QDebug>

#include <cmath>
#include <iostream>

#include "opencv2/core.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/calib3d/calib3d.hpp"

#include "imageprocess.h"

using namespace std;
using namespace cv;

//=======================================================================================
static constexpr auto test_video = "/data/Videos/20181026_333.avi";         // winter
//static constexpr auto test_video = "/data/Videos/20180810_2.avi";         // summer
//static constexpr auto test_video = "/data/Videos/20180821_1.avi";
//static constexpr auto test_video = "/data/Videos/20181026_333.avi";
//=======================================================================================

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    cv::VideoCapture cap( test_video );

    if(!cap.isOpened())
    {
       cout << "Error can't find the file" << endl;
    }

    Mat frame;
    Mat dilated;
    Mat kernel = Mat::ones(3, 3, CV_8U);

    for(;;)
    {
        if (!cap.read(frame))
            break;

        // Преобразуем изображение в вид обратной перспективы.
        auto ipm = ImageProcessing::inv_persp( frame );
/*
        // Apply adaptive gamma correction method for
        // enhancement of image brightness and intensity.
        auto adaptGCIpm = ImageProcessing::adaptiveGammaCorrection(ipm);

        // применение алгоритма CLAHE и увеличение резкости изображения
        auto clahedIpm = ImageProcessing::claheOperation(adaptGCIpm);
*/
        // Получение бинаризованного изображения используя
        // Excess Green (избыток зеленого) и пороговый метод Отсу.
        auto egClahedThreshOtsu = ImageProcessing::otsuEgBinarize(ipm);

        // Нахождение контуров на бинаризованном изображении.
        //auto drawing = ImageProcessing::setColorContour(egClahedThreshOtsu);

        // Наращивание, слияние и нахождение каркаса блобов контуров рельс, используя ядро.
        dilate(egClahedThreshOtsu, dilated, kernel, Point(-1, -1), 1, 1, 1);

        //auto skeleton = ImageProcessing::skeletonMorphOperation(dilated);

        auto probabilHough = ImageProcessing::probablisticHoughTransform(dilated, 1.0);

        //auto standartHough = ImageProcessing::standartHoughTransformation(skeleton, 1.0);
        //auto standartHough = imageProcessing.standartHoughTransformation(dilated, 1.0);

        // применение морфологических операций для фильтрации шумов

        //erode(dilated, eroded, Mat(), Point(-1, -1), 2, 1, 1);

        //-----------------Display--------------------------------------------------------
        namedWindow(test_video, CV_WINDOW_FULLSCREEN);
        resize(frame, frame, Size(), 0.4, 0.4);
        imshow(test_video, frame);

        pyrDown(ipm, ipm);
        resize(ipm, ipm, Size(), 0.8, 0.8);
        imshow("Inverse", ipm);
        moveWindow("Inverse", 0, 0);
/*
        pyrDown(adaptGCIpm, adaptGCIpm);
        resize(adaptGCIpm, adaptGCIpm, Size(), 0.4, 0.4);
        imshow("Adapt Gamma Corrected Image", adaptGCIpm);
        moveWindow("Adapt Gamma Corrected Image", 300, 0);

        pyrDown(clahedIpm, clahedIpm);
        resize(clahedIpm, clahedIpm, Size(), 0.4, 0.4);
        imshow("Clahed Image", clahedIpm);
        moveWindow("Clahed Image", 600, 0);
*/
        pyrDown(egClahedThreshOtsu, egClahedThreshOtsu);
        resize(egClahedThreshOtsu, egClahedThreshOtsu, Size(), 0.8, 0.8);
        imshow("E*G+Otsu Binary Image", egClahedThreshOtsu);
        moveWindow("E*G+Otsu Binary Image", 200, 0);

        pyrDown(dilated, dilated);
        resize(dilated, dilated, Size(), 0.8, 0.8);
        imshow("Dilated Image", dilated);
        moveWindow("Dilated Image", 400, 0);

        /*
        pyrDown(skeleton, skeleton);
        imshow("Skeleted Image", skeleton);
        moveWindow("Skeleted Image", 1200, 0);

        pyrDown(standartHough, standartHough);
        imshow("Standart Hough Transformation", standartHough);
        moveWindow("Standart Hough Transformation", 1500, 0);
        */

        pyrDown(probabilHough, probabilHough);
        resize(probabilHough, probabilHough, Size(), 0.8, 0.8);
        imshow("Hough Transformation", probabilHough);
        moveWindow("Hough Transformation", 600, 0);

        char key = cvWaitKey(200);
        if (key == 27)
        {
            exit(0);
            destroyAllWindows();
        }
        else if (key == 'p')
            waitKey();

        ipm.release();
        egClahedThreshOtsu.release();
        //adaptGCIpm.release();
        frame.release();
        //-----------------Display--------------------------------------------------------
    }

    exit(1);
    return a.exec();
}
