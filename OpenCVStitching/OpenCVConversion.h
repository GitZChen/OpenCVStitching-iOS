//
//  OpenCVConversion.h
//  OpenCVStitching
//
//  Created by Zhongtian Chen on 6/23/16.
//
//

#ifndef OpenCVConversion_h
#define OpenCVConversion_h

@interface OpenCVConversion : NSObject

+ (cv::Mat)cvMatFromUIImage:(UIImage *)image;//convert UIImage to cv::Mat
+ (cv::Mat)cvMatGrayFromUIImage:(UIImage *)image;//convert UIImage to gray cv::Mat
+ (cv::Mat)cvMat3FromUIImage:(UIImage *)image; //convert UIImage to cv::Mat without alpha channel
+(UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;//convert cv::Mat to UIImage

@end


#endif /* OpenCVConversion_h */
