//
//  stitching.cpp
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#include "opencv2/stitching.hpp"
#include "stitching.h"
#include <iostream>
#include <fstream>
#include <string>


//
using namespace std;
using namespace cv;

vector<Mat> imgs;

string sayHelloCpp() {
    return "Hello from CPP";
}

Mat stitch (vector<Mat>& images) {
    Mat pano;
    imgs = images;
    
    Ptr<Stitcher> stitcher = Stitcher::create();
    Stitcher::Status status = stitcher->stitch(imgs, pano);
    
    string errorString = "";
        switch (status) {
            case cv::Stitcher::OK:
                break;
            case cv::Stitcher::ERR_NEED_MORE_IMGS:
                errorString += "need more images";
                break;
            case cv::Stitcher::ERR_HOMOGRAPHY_EST_FAIL:
                errorString += "homography failed";
                break;
            case cv::Stitcher::ERR_CAMERA_PARAMS_ADJUST_FAIL:
                errorString += "camera params adjust failed";
                break;
        }
        if (errorString.length() > 0) {
            throw invalid_argument(errorString);
        } else {
            return pano;
        }
}
