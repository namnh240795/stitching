//
//  UIImageRotate.h
//  stitching
//
//  Created by Admin on 06/06/2022.
//

#ifndef UIImageRotate_h
#define UIImageRotate_h


#endif /* UIImageRotate_h */
#import <UIKit/UIKit.h>

@interface UIImage (Rotate)

//faster, alters the exif flag but doesn't change the pixel data
- (UIImage*)rotateExifToOrientation:(UIImageOrientation)orientation;


//slower, rotates the actual pixel matrix
- (UIImage*)rotateBitmapToOrientation:(UIImageOrientation)orientation;

- (UIImage*)rotateToImageOrientation;

@end

