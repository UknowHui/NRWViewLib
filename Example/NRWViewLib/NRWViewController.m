//
//  NRWViewController.m
//  NRWViewLib
//
//  Created by uknow on 08/30/2018.
//  Copyright (c) 2018 uknow. All rights reserved.
//

#import "NRWViewController.h"

@interface NRWViewController ()

@property (weak, nonatomic) IBOutlet UIButton *checkboxBtn;

@property (nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation NRWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"就业", @"求学", @"学龄前", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)checkboxClick:(id)sender {
    
    NRWCheckboxController *checkboxVC = [NRWCheckboxController checkboxControllerWithNavTitle:@"请选择子女现状" titleArray:self.titleArray indexArray:nil max:0 selectBlock:^(NSMutableArray *indexArray) {
        
        NSMutableString *mutableStr = [NSMutableString string];
        for (int i = 0; i < indexArray.count; i++) {
            if ([indexArray[i] intValue] == 1) {
                [mutableStr appendFormat:@"%@ ", self.titleArray[i]];
            }
        }
        NSLog(@"%@", mutableStr);
        
    }];
    [self.navigationController pushViewController:checkboxVC animated:YES];
}
- (IBAction)radioBtnClick:(id)sender {
    
    NRWCheckboxController *checkboxVC = [NRWCheckboxController checkboxControllerWithNavTitle:@"请选择子女现状" titleArray:self.titleArray indexArray:nil max:1 selectBlock:^(NSMutableArray *indexArray) {
        [indexArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj intValue] == 1) {
                NSLog(@"%@", self.titleArray[idx]);
                *stop = YES;
            }
        }];
        
    }];
    [self.navigationController pushViewController:checkboxVC animated:YES];
}

@end
