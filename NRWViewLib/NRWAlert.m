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
              leftName:(NSString *)leftName
             rightName:(NSString *)rightName
        viewController:(UIViewController *)viewController
            leftAction:(void (^)(void))leftAction
           rightAction:(void (^)(void))rightAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *left=[UIAlertAction actionWithTitle:leftName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if (leftAction) {
            leftAction();
        }
    }];
    
    UIAlertAction *right=[UIAlertAction actionWithTitle:rightName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if (rightAction) {
            rightAction();
        }
    }];
    
    [alertController addAction:left];
    [alertController addAction:right];
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
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:one style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
        
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:two style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
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
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:one style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:two style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
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
                     leftName:(NSString *)leftName
                    rightName:(NSString *)rightName
                  placeholder:(NSString *)placeholder
                    textField:(NSString *)text
               viewController:(UIViewController *)viewController
                   leftAction:(void (^)(NSString *text))leftAction
                  rightAction:(void (^)(NSString *text))rightAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
        textField.text = text;
    }];
    UIAlertAction *left=[UIAlertAction actionWithTitle:leftName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (leftAction) {
            leftAction(textField.text);
        }
    }];
    
    UIAlertAction *right=[UIAlertAction actionWithTitle:rightName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (rightAction) {
            rightAction(textField.text);
        }
    }];
    [alertController addAction:left];
    [alertController addAction:right];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

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
                        rightAction:(void (^)(NSString *text))rightAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
        textField.secureTextEntry = YES;
    }];
    UIAlertAction *left=[UIAlertAction actionWithTitle:leftName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (leftAction) {
            leftAction(textField.text);
        }
    }];
    UIAlertAction *right=[UIAlertAction actionWithTitle:rightName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *textField = alertController.textFields.firstObject;
        if (rightAction) {
            rightAction(textField.text);
        }
    }];
    [alertController addAction:left];
    [alertController addAction:right];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
