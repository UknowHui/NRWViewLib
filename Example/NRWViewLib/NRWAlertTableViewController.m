//
//  NRWAlertTableViewController.m
//  NRWViewLib_Example
//
//  Created by uknow on 2018/12/7.
//  Copyright © 2018 王亚辉. All rights reserved.
//

#import "NRWAlertTableViewController.h"

@interface NRWAlertTableViewController ()

@end

@implementation NRWAlertTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"一个Action";
            break;
        case 1:
            cell.textLabel.text = @"两个Action";
            break;
        case 2:
            cell.textLabel.text = @"sheet，有提醒";
            break;
        case 3:
            cell.textLabel.text = @"sheet，无提醒";
            break;
        case 4:
            cell.textLabel.text = @"有输入框";
            break;
        case 5:
            cell.textLabel.text = @"有输入框 密文输入";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            [NRWAlert alertWithTitle:@"一个" message:@"aaa" actionName:@"bbb" viewController:self action:^{
                NSLog(@"一个");
            }];
            break;
        case 1:
            [NRWAlert alertWithTitle:@"两个" message:@"aaa" leftName:@"left" rightName:@"right" viewController:self leftAction:^{
                NSLog(@"left");
            } rightAction:^{
                NSLog(@"right");
            }];
            break;
        case 2:
            [NRWAlert sheetAlertWithTitle:@"sheet" message:@"有提醒" one:@"one" two:@"two" viewController:self oneAction:^{
                NSLog(@"one");
            } twoAction:^{
                NSLog(@"two");
            }];
            break;
        case 3:
            [NRWAlert sheetAlertWithOne:@"one" two:@"two" viewController:self oneAction:^{
                NSLog(@"one");
            } twoAction:^{
                NSLog(@"two");
            }];
            break;
        case 4:
            [NRWAlert addTextFieldWithTitle:@"title" message:@"text" leftName:@"left" rightName:@"right" placeholder:@"" textField:@"123" viewController:self leftAction:^(NSString *text) {
                NSLog(@"left");
            } rightAction:^(NSString *text) {
                NSLog(@"right");
            }];
            break;
        case 5:
            [NRWAlert addSecureTextFieldWithTitle:@"secure" message:@"" leftName:@"left" rightName:@"right" placeholder:@"" viewController:self leftAction:^(NSString *text) {
                NSLog(@"left");
            } rightAction:^(NSString *text) {
                NSLog(@"right");
            }];
            break;
        default:
            break;
    }
}

@end
