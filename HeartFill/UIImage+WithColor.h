//
//  UIImage+WithColor.h
//  HeartFill
//
//  Created by pierre larochelle on 4/11/12.
//  Copyright (c) 2012 Georgia Institue of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WithColor)
- (UIColor*) getPixelColorAtLocation:(CGPoint)point;

@end
