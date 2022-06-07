//
//  UIImageOpenCV.h
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#ifndef UIImageOpenCV_h
#define UIImageOpenCV_h


#endif /* UIImageOpenCV_h */

#ifdef __cplusplus
#undef NO
#undef YES
#import <opencv2/opencv.hpp>
#endif
#import <UIKit/UIKit.h>
@interface UIImage (OpenCV)

    //cv::Mat to UIImage
+ (UIImage *)imageWithCVMat:(const cv::Mat&)cvMat;
- (id)initWithCVMat:(const cv::Mat&)cvMat;

    //UIImage to cv::Mat
- (cv::Mat)CVMat;
- (cv::Mat)CVMat3;  // no alpha channel
- (cv::Mat)CVGrayscaleMat;

@end
