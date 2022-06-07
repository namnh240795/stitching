//
//  OpenCVWrapper.m
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#import "OpenCVWrapper.h"
#import "stitching.h"
#import "UIImageRotate.h"
#import "UIImageOpenCV.h"



@implementation OpenCVWrapper
- (NSString *) sayHello {
    std::string helloMessage = sayHelloCpp();
    return  [NSString stringWithCString:helloMessage.c_str() encoding:NSUTF8StringEncoding];
}

+ (nullable UIImage*) stitchingImagesCPP:(NSArray<UIImage*>*)images error:(NSError**)error;
{
    
    if ([images count] == 0){
        NSLog (@"imageArray is empty");
        return 0;
    }
    
    std::vector<cv::Mat> matImages;

    for (id image in images) {
        if ([image isKindOfClass: [UIImage class]]) {
            /*
             All images taken with the iPhone/iPa cameras are LANDSCAPE LEFT orientation. The  UIImage imageOrientation flag is an instruction to the OS to transform the image during display only. When we feed images into openCV, they need to be the actual orientation that we expect them to be for stitching. So we rotate the actual pixel matrix here if required.
             */
            UIImage* rotatedImage = [image rotateToImageOrientation];
            cv::Mat matImage = [rotatedImage CVMat3];
            NSLog (@"matImage: %@",image);
            matImages.push_back(matImage);
        }
    }
    NSLog (@"stitching...");
    cv::Mat stitchedMat = stitch (matImages);
    UIImage* result =  [UIImage imageWithCVMat:stitchedMat];
    NSLog (@"stitching done...");
    return result;
}

@end
