//
//  UIView+NRWFrame.h
//  NRWViewLib
//
//  Created by uknow on 2018/8/31.
//

#import <UIKit/UIKit.h>

@interface UIView (NRWFrame)

@property (nonatomic) CGFloat nrw_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat nrw_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat nrw_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat nrw_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat nrw_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat nrw_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat nrw_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat nrw_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint nrw_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  nrw_size;        ///< Shortcut for frame.size.

@end
