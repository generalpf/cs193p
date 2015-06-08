//
//  CardView.h
//  Matchismo
//
//  Created by Ryan Walberg on 2015-06-08.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (nonatomic) CGFloat faceCardScaleFactor;

- (CGFloat)cornerScaleFactor;
- (CGFloat)cornerRadius;
- (CGFloat)cornerOffset;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
