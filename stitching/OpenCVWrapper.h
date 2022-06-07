//
//  OpenCVWrapper.h
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#ifndef OpenCVWrapper_h
#define OpenCVWrapper_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#endif /* OpenCVWrapper_h */

NS_ASSUME_NONNULL_BEGIN
@interface OpenCVWrapper : NSObject
- (NSString *) sayHello;
+ (nullable UIImage*) stitchingImagesCPP:(NSArray<UIImage*>*)images error:(NSError**)error;

@end
NS_ASSUME_NONNULL_END
