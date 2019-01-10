//
//  NRWCheckboxCell.m
//  New_Runway
//
//  Created by uknow on 2018/8/24.
//  Copyright © 2018年 uknow. All rights reserved.
//

#import "NRWCheckboxCell.h"
#import <NRWViewLib.h>

static  NSString *const identifier = @"NRWCheckboxCell";

@implementation NRWCheckboxCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    NRWCheckboxCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[NRWCheckboxCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, [UIScreen mainScreen].bounds.size.width - 30 - 18 - 5, 44)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#FF6816"];
        [self.contentView addSubview:_titleLabel];
        
        _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 15 - 18, (44 - 13) * 0.5, 18, 13)];
        [self.contentView addSubview:_selectImageView];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        
        
    }
    return self;
}
@end
