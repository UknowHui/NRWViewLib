//
//  NRWAlert.m
//  New_Runway
//
//  Created by uknow on 2018/9/6.
//  Copyright © 2018年 uknow. All rights reserved.
//

#import "NRWAlert.h"

@implementation NRWAlert

/**
 * 一个Action
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
            actionName:(NSString *)actionName
        viewController:(UIViewController *)viewController
                action:(void(^)(void))oneAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if (oneAction) {
            oneAction();
        }
    }];
    
    
    [alertController addAction:action];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

/**
 * 两个Action
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
             rightName:(NSString *)rightName
              leftName:(NSString *)leftName
        viewController:(UIViewController *)viewController
           rightAction:(void (^)(void))rightAction
            leftAction:(void (^)(void))leftAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *right=[UIAlertAction actionWithTitle:rightName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if (rightAction) {
            rightAction();
        }
    }];
    UIAlertAction *left=[UIAlertAction actionWithTitle:leftName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if (leftAction) {
            leftAction();
        }
    }];
    
    [alertController addAction:right];
    [alertController addAction:left];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

/**
 * sheet，有提醒
 */
+ (void)sheetAlertWithTitle:(NSString *)title
                    message:(NSString *)message
                        one:(NSString *)one
                        two:(NSString *)two
             viewController:(UIViewController *)viewController
                  oneAction:(void(^)(void))oneAction
                  twoAction:(void(^)(void))twoAction
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:one style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
        
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:two style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (twoAction) {
            twoAction();
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

/**
 * sheet，无提醒
 */
+ (void)sheetAlertWithOne:(NSString *)one
                      two:(NSString *)two
           viewController:(UIViewController *)viewController
                oneAction:(void(^)(void))oneAction
                twoAction:(void(^)(void))twoAction
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:one style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:two style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (twoAction) {
            twoAction();
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

/**
 * 有输入框
 */
+ (void)addTextFieldWithTitle:(NSString *)title
                      message:(NSString *)message
                    rightName:(NSString *)rightName
                     leftName:(NSString *)leftName
                  placeholder:(NSString *)placeholder
               viewController:(UIViewController *)viewController
                  rightAction:(void (^)(NSString *))rightAction
                   leftAction:(void (^)(NSString *))leftAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    
    UIAlertAction *right=[UIAlertAction actionWithTitle:rightName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (rightAction) {
            rightAction(textField.text);
        }
    }];
    
    UIAlertAction *left=[UIAlertAction actionWithTitle:leftName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (leftAction) {
            leftAction(textField.text);
        }
    }];
    
    [alertController addAction:right];
    [alertController addAction:left];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

/**
 * 有输入框 密文输入
 */
+ (void)addSecureTextFieldWithTitle:(NSString *)title
                            message:(NSString *)message
                          rightName:(NSString *)rightName
                           leftName:(NSString *)leftName
                        placeholder:(NSString *)placeholder
                     viewController:(UIViewController *)viewController
                        rightAction:(void (^)(NSString *))rightAction
                         leftAction:(void (^)(NSString *))leftAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction *right=[UIAlertAction actionWithTitle:rightName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (rightAction) {
            rightAction(textField.text);
        }
    }];
    
    UIAlertAction *left=[UIAlertAction actionWithTitle:leftName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (leftAction) {
            leftAction(textField.text);
        }
    }];
    
    [alertController addAction:right];
    [alertController addAction:left];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
