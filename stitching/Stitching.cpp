//
//  stitching.cpp
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#include "stitching.h"
#include <iostream>
#include <fstream>

//#include "opencv2/stitching.hpp"
#include <string>

//
//using namespace std;
//using namespace cv;
//
//bool try_use_gpu = false;
//vector<Mat> imgs;
//string result_name = "result.jpg";
//
//void printUsage();
//int parseCmdArgs(int argc, char** argv);

std::string sayHelloCpp() {
    return "Hello from CPP";
}

//cv::Mat stitch (vector<Mat>& images)
//{
//    imgs = images;
//    Mat pano;
//    Ptr<Stitcher> stitcher = Stitcher::create();
//    Stitcher::Status status = stitcher->stitch(imgs, pano);
//
//    std::string errorString = "";
//    switch (status) {
//        case cv::Stitcher::OK:
//            break;
//        case cv::Stitcher::ERR_NEED_MORE_IMGS:
//            errorString += "need more images";
//            break;
//        case cv::Stitcher::ERR_HOMOGRAPHY_EST_FAIL:
//            errorString += "homography failed";
//            break;
//        case cv::Stitcher::ERR_CAMERA_PARAMS_ADJUST_FAIL:
//            errorString += "camera params adjust failed";
//            break;
//    }
//    if (errorString.length() > 0) {
//        throw invalid_argument(errorString);
//    } else {
//        return pano;
//    }
//}
