//
//  OpenCVWrapper.m
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#import "OpenCVWrapper.h"
#import "stitching.h"

@implementation OpenCVWrapper
- (NSString *) sayHello {
    std::string helloMessage = sayHelloCpp();
    return  [NSString stringWithCString:helloMessage.c_str() encoding:NSUTF8StringEncoding];
}

@end
