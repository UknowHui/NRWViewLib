//
//  NRWViewController.m
//  NRWViewLib
//
//  Created by uknow on 08/30/2018.
//  Copyright (c) 2018 uknow. All rights reserved.
//

#import "NRWViewController.h"

#import <NRWViewLib/NRWCheckboxController.h>

@interface NRWViewController ()

@property (weak, nonatomic) IBOutlet UIButton *checkboxBtn;

@end

@implementation NRWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)checkboxClick:(id)sender {
    
    NRWCheckboxController *checkboxVC = [[NRWCheckboxController alloc] init];
    [self.navigationController pushViewController:checkboxVC animated:YES];
}

@end
