//
//  stitching.h
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#ifndef stitching_h
#define stitching_h
#ifdef __cplusplus
#undef NO
#undef YES
#import <opencv2/opencv.hpp>
#endif
#include <string>

cv::Mat stitch (std::vector <cv::Mat> & images);
std::string sayHelloCpp();

#endif /* stitching_h */
