//
//  HJHomeButton.m
//  MusicLoveTeacher
//
//  Created by niuxinghua on 16/3/29.
//  Copyright © 2016年 Hjojo. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#import "HJHomeButton.h"
#import "Masonry.h"
@implementation HJHomeButton
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self configButton];
    }
    return self;
}
-(instancetype)init{
    if (self=[super init]) {
        [self configButton];
    }
    return self;
}
-(void)configButton{
    _titlelable=[UILabel new];
    _detillable=[UILabel new];
    _image=[UIImageView new];
    _image.layer.cornerRadius=CGRectGetWidth(_image.bounds)/2.0;
    _image.layer.masksToBounds=YES;
    _titlelable.font=[UIFont systemFontOfSize:15];
    _detillable.font=[UIFont systemFontOfSize:11];
    _titlelable.textColor=UIColorFromRGB(0x333333);
    _detillable.textColor=UIColorFromRGB(0x999999);
    [self addSubview:_titlelable];
    [self addSubview:_detillable];
    [self addSubview:_image];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.width.height.equalTo(@40);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    [_titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_image.mas_bottom).offset(15/2.0);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];
    [_detillable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_titlelable.mas_bottom).offset(2);
        make.width.equalTo(@130);
        make.height.equalTo(@20);
    }];
    
}

@end
