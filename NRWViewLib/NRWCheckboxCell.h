//
//  NRWCheckboxCell.h
//  New_Runway
//
//  Created by uknow on 2018/8/24.
//  Copyright © 2018年 uknow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NRWCheckboxCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *selectImageView;

@end
