//
//  HFViewController.m
//  HeartFill
//
//  Created by pierre larochelle on 4/11/12.
//  Copyright (c) 2012 Georgia Institue of Technology. All rights reserved.
//

#import "HFViewController.h"
#import "FillView.h"

@interface HFViewController ()

@end

@implementation HFViewController
@synthesize heart;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (!heart) {
        UIImage *heartImage = [UIImage imageNamed:@"heart.png"];
        FillView *fill = [[FillView alloc] initWithFrame:self.view.frame 
                                               withImage:heartImage 
                                          withPercentage:90];
        [self.view addSubview:fill];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
