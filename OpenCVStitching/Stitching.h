//
//  Stitching.h
//  OpenCVStitching
//
//  Created by Zhongtian Chen on 6/23/16.
//
//

#ifndef Stitching_h
#define Stitching_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Stitching : NSObject
+ (UIImage *) stitchImageWithArray:(NSMutableArray*)imageArray;
@end

#endif /* Stitching_h */
