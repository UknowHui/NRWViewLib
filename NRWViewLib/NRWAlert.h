//
//  NRWAlert.h
//  New_Runway
//
//  Created by uknow on 2018/9/6.
//  Copyright © 2018年 uknow. All rights reserved.
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
              leftName:(NSString *)leftName
             rightName:(NSString *)rightName
        viewController:(UIViewController *)viewController
            leftAction:(void (^)(void))leftAction
           rightAction:(void (^)(void))rightAction;

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
                     leftName:(NSString *)leftName
                    rightName:(NSString *)rightName
                  placeholder:(NSString *)placeholder
                    textField:(NSString *)text
               viewController:(UIViewController *)viewController
                   leftAction:(void (^)(NSString *text))leftAction
                  rightAction:(void (^)(NSString *text))rightAction;
/**
 * 有输入框 密文输入
 */
+ (void)addSecureTextFieldWithTitle:(NSString *)title
                            message:(NSString *)message
                           leftName:(NSString *)leftName
                          rightName:(NSString *)rightName
                        placeholder:(NSString *)placeholder
                     viewController:(UIViewController *)viewController
                         leftAction:(void (^)(NSString *text))leftAction
                        rightAction:(void (^)(NSString *text))rightAction;



@end
