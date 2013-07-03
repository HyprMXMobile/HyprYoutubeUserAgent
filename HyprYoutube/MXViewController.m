//
//  MXViewController.m
//  HyprYoutube
//
//  Created by Jeremy Ellison on 6/28/13.
//  Copyright (c) 2013 HyprMX. All rights reserved.
//

#import "MXViewController.h"

@interface MXViewController ()

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end

@implementation MXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"Y-MM-dd"];
    
    NSTimeInterval negative_eighteen_years_in_seconds = -1 * 60 * 60 * 24 * 365 * 18;
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:negative_eighteen_years_in_seconds];
    
    NSString *string = [NSString stringWithFormat:@"http://live.hyprmx.com/embedded_videos/catalog_frame?uid=%@&distributorid=7172365&offer=video-0369253220a291d9b28345ef4b05aa09&dob=%@", [[NSProcessInfo processInfo] globallyUniqueString], [formatter stringFromDate:date]];
    
    NSLog(@"Loading: %@", string);
    
    NSURL *url = [NSURL URLWithString:string];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
