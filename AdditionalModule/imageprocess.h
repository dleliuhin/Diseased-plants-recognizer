#ifndef IMAGEPROCESS_H
#define IMAGEPROCESS_H

#include <cmath>
#include <iostream>

#include "opencv2/core.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/ximgproc.hpp"
#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/line_descriptor.hpp"

using namespace std;
using namespace cv;
using namespace cv::ximgproc;

class ImageProcessing
{
public:

    static Mat inv_persp(const Mat &src);

    static Mat otsuEgBinarize(const Mat& iRevPerspView);

    static Mat setColorContour(const Mat& iBinImg);

    static Mat claheOperation(const Mat &iIpm);

    static Mat gauss_difference(const Mat &src, int kSize1,  int kSize2);

    static Mat adaptiveGammaCorrection(const Mat &Iin);

    static Mat skeletonMorphOperation(const Mat &threshed);

    static Mat standartHoughTransformation(const Mat &skeleted, const float &maxAngle);

    static Mat probablisticHoughTransform(const Mat &skeleted, const float &maxAngle);

private:

    enum { kSize1 = 13,
           kSize2 = 3};

    static Mat standartGammaCorrection(const Mat &channel, float &gamma);

    static bool heaviside(const float &x);

    static float calcAngleP(const Vec4i &line);
};

#endif // IMAGEPROCESS_H
