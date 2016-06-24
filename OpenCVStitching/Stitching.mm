//
//  Stitching.m
//  OpenCVStitching
//
//  Created by Zhongtian Chen on 6/23/16.
//
//

#import <Foundation/Foundation.h>
#import "Stitching.h"
#import "StitchingWrapper.hpp"
#import "OpenCVConversion.h"

#define COMPRESS_RATIO 0.9

@implementation Stitching

+ (UIImage*) stitchImageWithArray:(NSMutableArray*)imageArray {
    
    NSMutableArray* compressedImageArray =[NSMutableArray new];
    /*for(UIImage *rawImage in imageArray){
        UIImage *compressedImage=[self compressedToRatio:rawImage ratio:COMPRESS_RATIO];
        [compressedImageArray addObject:compressedImage];
    }
    [imageArray removeAllObjects];*/
    
    compressedImageArray = imageArray;
    
    if ([compressedImageArray count]==0) {
        NSLog (@"imageArray is empty");
        return nil;
    }
    cv::vector<cv::Mat> matArray;
    
    for (id image in compressedImageArray) {
        if ([image isKindOfClass: [UIImage class]]) {
            cv::Mat matImage = [OpenCVConversion cvMat3FromUIImage:image];
            matArray.push_back(matImage);
        }
    }
    NSLog(@"Stitching...");
    cv::Mat result;
    if(!stitch(matArray, result)){
        NSLog(@"Stitching Error!");
        return nil;
    }
    NSLog(@"Stitching Success!");
    return [OpenCVConversion UIImageFromCVMat:result];
}

+ (UIImage *)compressedToRatio:(UIImage *)img ratio:(float)ratio {
    CGSize compressedSize;
    compressedSize.width=img.size.width*ratio;
    compressedSize.height=img.size.height*ratio;
    UIGraphicsBeginImageContext(compressedSize);
    [img drawInRect:CGRectMake(0, 0, compressedSize.width, compressedSize.height)];
    UIImage* compressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImage;
}

@end