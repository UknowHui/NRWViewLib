//
//  UIButton+NRWImageTitle.h
//  New_Runway
//
//  Created by uknow on 2018/8/23.
//  Copyright © 2018年 NelsonJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NRWButtonEdgeInsetsStyle) {
    NRWButtonEdgeInsetsStyleTop, // image在上，label在下
    NRWButtonEdgeInsetsStyleLeft, // image在左，label在右
    NRWButtonEdgeInsetsStyleBottom, // image在下，label在上
    NRWButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (NRWImageTitle)

- (void)layoutButtonWithEdgeInsetsStyle:(NRWButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
