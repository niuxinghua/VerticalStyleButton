//
//  HJHomeBannTableViewCell.h
//  MusicLove
//
//  Created by niuxinghua on 16/3/11.
//  Copyright © 2016年 Hjojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGBannerView.h"
@interface HJHomeBannTableViewCell : UITableViewCell<GGBannerViewDelegate>
@property (nonatomic, strong) GGBannerView *banner;
@property (nonatomic, strong) NSMutableArray *datalist;
@end
