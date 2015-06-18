//
//  JustPostedFlickrPhotosViewController.m
//  Shutterbug
//
//  Created by Ryan Walberg on 2015-06-15.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "JustPostedFlickrPhotosViewController.h"
#import "FlickrFetcher.h"

@interface JustPostedFlickrPhotosViewController ()

@end

@implementation JustPostedFlickrPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchPhotos
{
    NSArray *photos = [FlickrFetcher latestGeoreferencedPhotos];
#warning Blocks the main thread
    NSLog(@"Flickr results = %@", photos);
    self.photos = photos;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
