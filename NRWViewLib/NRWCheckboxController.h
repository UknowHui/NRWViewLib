//
//  NRWCheckboxController.h
//  New_Runway
//
//  Created by uknow on 2018/8/24.
//  Copyright © 2018年 uknow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectBlock_t)(NSMutableArray *indexArray);

@interface NRWCheckboxController : UIViewController

+ (instancetype)checkboxControllerWithNavTitle:(NSString *)navTitle titleArray:(NSMutableArray *)titleArray indexArray:(NSMutableArray *)indexArray selectBlock:(selectBlock_t)selectBlock;

@end
