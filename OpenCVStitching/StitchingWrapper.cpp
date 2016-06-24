//
//  StitchingWrapper.cpp
//  OpenCVStitching
//
//  Created by Zhongtian Chen on 6/23/16.
//
//

#include "StitchingWrapper.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/stitching/stitcher.hpp"

using namespace cv;

bool stitch (const cv::vector <cv::Mat> & images, cv::Mat &result) {
    Stitcher stitcher = Stitcher::createDefault(false);
    Stitcher::Status status = stitcher.stitch(images, result);
    
    if (status != Stitcher::OK) {
        return false;
    }
    return true;
}