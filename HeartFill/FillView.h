//
//  FillView.h
//  HeartFill
//
//  Created by pierre larochelle on 4/11/12.
//  Copyright (c) 2012 Georgia Institue of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+WithColor.h"

@interface FillView : UIView {
    UIImage *imageToFill;
    UIColor *color;
}

-(id)initWithFrame:(CGRect)frame andImage:(UIImage*)image;
-(void)getImageColor;

@property (nonatomic, retain) UIImage *imageToFill;
@property (nonatomic, retain) UIColor *color;

@end
