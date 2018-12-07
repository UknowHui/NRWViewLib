//
//  NRWCheckboxController.m
//  New_Runway
//
//  Created by uknow on 2018/8/24.
//  Copyright © 2018年 uknow. All rights reserved.
//

#import "NRWCheckboxController.h"

#import "UIView+NRWFrame.h"

#import "UIImage+ClearImage.h"

#import "NRWCheckboxCell.h"

@interface NRWCheckboxController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, copy) NSString *navTitle;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) NSMutableArray *indexArray;

@property (nonatomic, strong) UIImage *selectImage;

@property (nonatomic, assign) NSUInteger max;

@property (nonatomic, copy) void(^selectBlock)(NSMutableArray *);

@end

@implementation NRWCheckboxController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.navTitle;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    NSBundle *bundle = [NSBundle bundleForClass:[NRWCheckboxController class]];
    NSURL *url = [bundle URLForResource:@"NRWViewLib" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    
    self.selectImage = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"nrw_selected" ofType:@"png"]];
    
    [self initTableview];
}

-(void)initTableview{
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.nrw_width, self.view.nrw_height) style:UITableViewStylePlain];
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
        cell.selectImageView.image = self.selectImage;
    }else{
        cell.titleLabel.textColor = [UIColor blackColor];
        cell.selectImageView.image = [UIImage clearImage];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = [_indexArray[indexPath.row] intValue];
    index = 1 - index;
    
    if (self.max > 0) {
        
        [self.indexArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (indexPath.row == idx && [obj isEqualToString:@"0"]) {
                [self.indexArray replaceObjectAtIndex:idx withObject:@"1"];
            }else{
                [self.indexArray replaceObjectAtIndex:idx withObject:@"0"];
            }
        }];
    }else{
        [self.indexArray replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"%d", index]];
    }
    
    
    
    [self.tableview reloadData];
}

- (void)rightItemClick {
    
    if (self.selectBlock) {
        self.selectBlock(self.indexArray);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

+ (instancetype)checkboxControllerWithNavTitle:(NSString *)navTitle titleArray:(NSMutableArray *)titleArray indexArray:(NSMutableArray *)indexArray max:(NSUInteger)max selectBlock:(selectBlock_t)selectBlock{
    
    NRWCheckboxController *checkboxVC = [[NRWCheckboxController alloc] init];
    checkboxVC.navTitle = navTitle;
    checkboxVC.titleArray = titleArray;
    checkboxVC.max = max;
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
