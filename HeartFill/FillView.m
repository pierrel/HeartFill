//
//  FillView.m
//  HeartFill
//
//  Created by pierre larochelle on 4/11/12.
//  Copyright (c) 2012 Georgia Institue of Technology. All rights reserved.
//

#import "FillView.h"

@implementation FillView
@synthesize imageToFill, color, percentage;

- (id)initWithFrame:(CGRect)frame andImage:(UIImage*)image {
    if (self = [self initWithFrame:frame]) {
        self.percentage = 0;
        self.imageToFill = image;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image withPercentage:(int)thePercentage {
    if (self = [self initWithFrame:frame andImage:image]) {
        self.percentage = thePercentage;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIImage *heart = [UIImage imageNamed:@"heart.png"];
    UIImage *heartFilled = [UIImage imageNamed:@"heartFilled.png"];    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor clearColor] setFill];
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [[UIColor clearColor] setFill];
    [heartFilled drawInRect:rect];
    CGContextRestoreGState(context);
        
    CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    
    CGContextClearRect(context, rect);
    
    CGContextSaveGState(context);
    CGContextClipToMask(context, rect, alphaMask);
    
    [[UIColor redColor] setFill];
    CGContextFillRect(context, CGRectMake(0, rect.size.height - (rect.size.height * (percentage/100.0)), rect.size.width, rect.size.height));
    CGContextRestoreGState(context);
    CGImageRelease(alphaMask);
    
    [heart drawInRect:rect];
}


@end
