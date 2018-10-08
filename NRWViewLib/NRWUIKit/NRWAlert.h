//
//  NRWAlert.h
//  New_Runway
//
//  Created by uknow on 2018/9/6.
//  Copyright © 2018年 NelsonJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRWAlert : NSObject

/**
 * 一个Action
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
            actionName:(NSString *)actionName
        viewController:(UIViewController *)viewController
                action:(void(^)(void))oneAction;

/**
 * 两个Action
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
             rightName:(NSString *)rightName
              leftName:(NSString *)leftName
        viewController:(UIViewController *)viewController
           rightAction:(void (^)(void))rightAction
            leftAction:(void (^)(void))leftAction;

/**
 * sheet，有提醒
 */
+ (void)sheetAlertWithTitle:(NSString *)title
                    message:(NSString *)message
                        one:(NSString *)one
                        two:(NSString *)two
             viewController:(UIViewController *)viewController
                  oneAction:(void(^)(void))oneAction
                  twoAction:(void(^)(void))twoAction;

/**
 * sheet，无提醒
 */
+ (void)sheetAlertWithOne:(NSString *)one
                      two:(NSString *)two
           viewController:(UIViewController *)viewController
                oneAction:(void(^)(void))oneAction
                twoAction:(void(^)(void))twoAction;

/**
 * 有输入框
 */
+ (void)addTextFieldWithTitle:(NSString *)title
                      message:(NSString *)message
                    rightName:(NSString *)rightName
                     leftName:(NSString *)leftName
                  placeholder:(NSString *)placeholder
               viewController:(UIViewController *)viewController
                  rightAction:(void (^)(NSString *text))rightAction
                   leftAction:(void (^)(NSString *text))leftAction;
/**
 * 有输入框 密文输入
 */
+ (void)addSecureTextFieldWithTitle:(NSString *)title
                            message:(NSString *)message
                          rightName:(NSString *)rightName
                           leftName:(NSString *)leftName
                        placeholder:(NSString *)placeholder
                     viewController:(UIViewController *)viewController
                        rightAction:(void (^)(NSString *text))rightAction
                         leftAction:(void (^)(NSString *text))leftAction;



@end
