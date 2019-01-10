//
//  UIColor+Hex.h
//  NRWViewLib
//
//  Created by uknow on 2018/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

+ (instancetype)colorFromHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
