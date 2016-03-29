//
//  HJHomeButtonTableViewCell.m
//  MusicLoveTeacher
//
//  Created by niuxinghua on 16/3/29.
//  Copyright © 2016年 Hjojo. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define myscreenwith   [UIScreen mainScreen].bounds.size.width
#define myscreenheight   [UIScreen mainScreen].bounds.size.height
#import "HJHomeButtonTableViewCell.h"
#import "Masonry.h"
@implementation HJHomeButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _studyManage=[[HJHomeButton alloc]init];
        _order=[[HJHomeButton alloc]init];
        _time=[[HJHomeButton alloc]init];
        _musicNews=[[HJHomeButton alloc]init];
        _top1=[UIView new];
        _top2=[UIView new];
        _vertical=[UIView new];
        
        [self.contentView addSubview:_studyManage];
        [self.contentView addSubview:_order];
        [self.contentView addSubview:_time];
        [self.contentView addSubview:_musicNews];
        [self.contentView addSubview:_top1];
        [self.contentView addSubview:_top2];
        [self.contentView addSubview:_vertical];
        _studyManage.image.image=[UIImage imageNamed:@"learn"];
        _studyManage.titlelable.text=@"学习管理";
        _studyManage.detillable.text=@"学习历程,一键搞定";
        _studyManage.titlelable.textAlignment=NSTextAlignmentCenter;
        _studyManage.detillable.textAlignment=NSTextAlignmentCenter;
        [_studyManage addTarget:self action:@selector(manageclick) forControlEvents:    UIControlEventTouchUpInside ];
        
        _order.image.image=[UIImage imageNamed:@"order"];
        _order.titlelable.text=@"约课订单";
        _order.detillable.text=@"与学生一对一教学";
        _order.titlelable.textAlignment=NSTextAlignmentCenter;
        _order.detillable.textAlignment=NSTextAlignmentCenter;
        [_order addTarget:self action:@selector(orderclick) forControlEvents:    UIControlEventTouchUpInside ];
        
        
        
        _time.image.image=[UIImage imageNamed:@"time"];
        _time.titlelable.text=@"时间表";
        _time.detillable.text=@"上课时间记录表";
        _time.titlelable.textAlignment=NSTextAlignmentCenter;
        _time.detillable.textAlignment=NSTextAlignmentCenter;
        
        [_time addTarget:self action:@selector(timeclick) forControlEvents:    UIControlEventTouchUpInside ];
        
        
        
        
        
        _musicNews.image.image=[UIImage imageNamed:@"news"];
        _musicNews.titlelable.text=@"音乐资讯";
        _musicNews.detillable.text=@"当下音乐潮流事件";
        _musicNews.titlelable.textAlignment=NSTextAlignmentCenter;
        _musicNews.detillable.textAlignment=NSTextAlignmentCenter;
        [_musicNews addTarget:self action:@selector(newsclick) forControlEvents:    UIControlEventTouchUpInside ];
        
        
        _top1.backgroundColor=UIColorFromRGB(0xdddddd);
        _top2.backgroundColor=UIColorFromRGB(0xdddddd);
        _vertical.backgroundColor=UIColorFromRGB(0xdddddd);
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
-(void)manageclick{
    if (_manageblock) {
        self.manageblock();
    }
}
-(void)newsclick{
    if (_newsblock) {
        self.newsblock();
    }
}
-(void)orderclick{
    if (_orderblock) {
        self.orderblock();
    }
}
-(void)timeclick{
    if (_timeblock) {
        self.timeblock();
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_studyManage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(@(myscreenwith/2.0));
        make.height.equalTo(@(250/2.0));
    }];
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_studyManage.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(_studyManage.mas_width);
        make.height.equalTo(_studyManage.mas_height);
    }];
    [_order mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_studyManage.mas_top);
        make.left.equalTo(_studyManage.mas_right);
        make.width.equalTo(_studyManage.mas_width);
        make.height.equalTo(_studyManage.mas_height);
    }];
    [_musicNews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_studyManage.mas_bottom);
        make.left.equalTo(_studyManage.mas_right);
        make.width.equalTo(_studyManage.mas_width);
        make.height.equalTo(_studyManage.mas_height);
    }];
    [_top1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.height.equalTo(@0.3);
        make.width.equalTo(@(myscreenwith-30));
        make.top.equalTo(_musicNews.mas_top);
    }];
    [_top2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.height.equalTo(@0.3);
        make.width.equalTo(@(myscreenwith));
        make.bottom.equalTo(self.mas_bottom);
    }];
    [_vertical mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@0.5);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(self.mas_height);
        make.top.equalTo(self.mas_top);
    }];
}
@end
