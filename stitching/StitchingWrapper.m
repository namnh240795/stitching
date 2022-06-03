//
//  StitchingWrapper.m
//  stitching
//
//  Created by Admin on 03/06/2022.
//

#import <Foundation/Foundation.h>

#import "StitchingWrapper.h"
#import "Stitching.hpp"

@implementation StitchingWrapper
- (NSString *) sayHello {
    HelloWorld helloWorld;
    std::string helloWorldMessage = helloWorld.sayHello();
    return [NSString
            stringWithCString:helloWorldMessage.c_str()
            encoding:NSUTF8StringEncoding];
}
@end
