//
//  UIView+NRWFrame.m
//  NRWViewLib
//
//  Created by uknow on 2018/8/31.
//

#import "UIView+NRWFrame.h"

@implementation UIView (NRWFrame)

- (CGFloat)nrw_left {
    return self.frame.origin.x;
}

- (void)setNrw_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)nrw_top {
    return self.frame.origin.y;
}

- (void)setNrw_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)nrw_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setNrw_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)nrw_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setNrw_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)nrw_width {
    return self.frame.size.width;
}

- (void)setNrw_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)nrw_height {
    return self.frame.size.height;
}

- (void)setNrw_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)nrw_centerX {
    return self.center.x;
}

- (void)setNrw_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)nrw_centerY {
    return self.center.y;
}

- (void)setNrw_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)nrw_origin {
    return self.frame.origin;
}

- (void)setNrw_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)nrw_size {
    return self.frame.size;
}

- (void)setNrw_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


@end
