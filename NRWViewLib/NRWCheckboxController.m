//
//  NRWCheckboxController.m
//  New_Runway
//
//  Created by uknow on 2018/8/24.
//  Copyright © 2018年 uknow. All rights reserved.
//

#import "NRWCheckboxController.h"

#import "NRWCheckboxCell.h"

@interface NRWCheckboxController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, copy) NSString *navTitle;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) NSMutableArray *indexArray;

@property (nonatomic, copy) void(^selectBlock)(NSMutableArray *);

@end

@implementation NRWCheckboxController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTableview];
}

-(void)initTableview{
    
    self.tableview = [[UITableView alloc] init];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.backgroundColor = [UIColor whiteColor];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableview];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NRWCheckboxCell *cell = [NRWCheckboxCell cellWithTableView:tableView];
    
    cell.titleLabel.text = _titleArray[indexPath.row];
    int index = [_indexArray[indexPath.row] intValue];
    if (index == 1) {
        cell.titleLabel.textColor = [UIColor redColor];
        cell.selectImageView.image = [UIImage imageNamed:@"finance_selected"];
    }else{
        cell.titleLabel.textColor = [UIColor blackColor];
        cell.selectImageView.image = [UIImage imageNamed:@""];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = [_indexArray[indexPath.row] intValue];
    index = 1 - index;
    [self.indexArray replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"%d", index]];
    
    [self.tableview reloadData];
}

- (void)rightItemClick {
    
    if (self.selectBlock) {
        self.selectBlock(self.indexArray);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

+ (instancetype)checkboxControllerWithNavTitle:(NSString *)navTitle titleArray:(NSMutableArray *)titleArray indexArray:(NSMutableArray *)indexArray selectBlock:(selectBlock_t)selectBlock{
    
    NRWCheckboxController *checkboxVC = [[NRWCheckboxController alloc] init];
    checkboxVC.navTitle = navTitle;
    checkboxVC.titleArray = titleArray;
    if (indexArray.count > 0) {
        checkboxVC.indexArray = [indexArray mutableCopy];
    }else{
        checkboxVC.indexArray = [NSMutableArray array];
        for (int i = 0; i < titleArray.count; i++) {
            [checkboxVC.indexArray addObject:@"0"];
        };
    }
    
    [checkboxVC setSelectBlock:^(NSMutableArray *selectArray ) {
        if (selectBlock) {
            selectBlock(selectArray);
        };
    }];
    
    return checkboxVC;
}

@end
