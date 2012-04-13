//
//  FillView.m
//  HeartFill
//
//  Created by pierre larochelle on 4/11/12.
//  Copyright (c) 2012 Georgia Institue of Technology. All rights reserved.
//

#import "FillView.h"

@implementation FillView
@synthesize imageToFill, color;

- (id)initWithFrame:(CGRect)frame andImage:(UIImage*)image {
    if (self = [self initWithFrame:frame]) {
        self.imageToFill = image;
        [self getImageColor];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)getImageColor {
    NSMutableArray *colors = [NSMutableArray array];
    if (self.imageToFill) {
        NSInteger minDim = MIN(self.imageToFill.size.width, self.imageToFill.size.height);
        for (int i = 0, len = minDim; i < len; i++) {
            UIColor *tColor = [self.imageToFill getPixelColorAtLocation:CGPointMake(i, i)];
            if (![colors containsObject:tColor]) {
                [colors addObject:tColor];
            }
        }
    }
    color = [colors objectAtIndex:1]; // just grabbing the second assuming the first is blank
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIImage *heart = [UIImage imageNamed:@"heart.png"];
    UIImage *heartFilled = [UIImage imageNamed:@"heartFilled.png"];    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor darkGrayColor] setFill];
    [heartFilled drawInRect:rect];
    CGContextSaveGState(context);
    
    CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    
    [[UIColor whiteColor] setFill];
    CGContextFillRect(context, rect);
    
    CGContextSaveGState(context);
    CGContextClipToMask(context, rect, alphaMask);
    
    //[imageToFill drawInRect:rect];
    [[UIColor redColor] setFill];
    CGContextFillRect(context, CGRectMake(0, rect.size.height/2, rect.size.width, rect.size.height/2));
    CGContextRestoreGState(context);
    CGImageRelease(alphaMask);
}


@end
