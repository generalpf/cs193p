
//
//  BezierPathView.m
//  DropIt
//
//  Created by Ryan Walberg on 2015-06-09.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView


- (void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}

@end
