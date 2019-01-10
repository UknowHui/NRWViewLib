//
//  UIColor+NRWHex.h
//  NRWViewLib
//
//  Created by uknow on 2019/1/10.
//

#import <UIKit/UIKit.h>


@interface UIColor (NRWHex)

+ (UIColor *)colorWithHexString:(NSString *)string;

+ (UIColor *)colorWithHexString:(NSString *)string withAlpha:(CGFloat)alpha;

@end

