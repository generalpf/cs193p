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
    dispatch_queue_t backgroundQueue = dispatch_queue_create("Flickr fetcher queue", NULL);
    if (backgroundQueue) {
        dispatch_async(backgroundQueue, ^{
            NSArray *photos = [FlickrFetcher latestGeoreferencedPhotos];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.photos = photos;
            });
        });
    }
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
