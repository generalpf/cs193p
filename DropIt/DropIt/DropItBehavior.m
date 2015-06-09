//
//  DropItBehavior.m
//  DropIt
//
//  Created by Ryan Walberg on 2015-06-05.
//  Copyright (c) 2015 Ryan Walberg. All rights reserved.
//

#import "DropItBehavior.h"

@interface DropItBehavior()

@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@property (strong, nonatomic) UIDynamicItemBehavior *dynamicItem;

@end

@implementation DropItBehavior

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addChildBehavior:self.gravity];
        [self addChildBehavior:self.collider];
        [self addChildBehavior:self.dynamicItem];
    }
    return self;
}

- (UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
    }
    return _gravity;
}

- (UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collider;
}

- (UIDynamicItemBehavior *)dynamicItem
{
    if (!_dynamicItem) {
        _dynamicItem = [[UIDynamicItemBehavior alloc] init];
        _dynamicItem.allowsRotation = NO;
    }
    return _dynamicItem;
}

- (void)addItem:(id <UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
    [self.dynamicItem addItem:item];
}

- (void)removeItem:(id <UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.dynamicItem removeItem:item];
}

@end
