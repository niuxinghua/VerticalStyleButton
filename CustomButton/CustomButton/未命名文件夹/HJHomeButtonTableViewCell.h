//
//  HJHomeButtonTableViewCell.h
//  MusicLoveTeacher
//
//  Created by niuxinghua on 16/3/29.
//  Copyright © 2016年 Hjojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJHomeButton.h"
typedef void (^didselectmanage)();
typedef void (^didselectorder)();
typedef void (^didselectnews)();
typedef void (^didselecttime)();
@interface HJHomeButtonTableViewCell : UITableViewCell
@property (nonatomic, strong) HJHomeButton *studyManage;
@property (nonatomic, strong) HJHomeButton *order;
@property (nonatomic, strong) HJHomeButton *time;
@property (nonatomic, strong) HJHomeButton *musicNews;
@property (nonatomic, strong) UIView *top1;
@property (nonatomic, strong) UIView *top2;
@property (nonatomic, strong) UIView *vertical;
@property (nonatomic, copy) didselectnews newsblock;
@property (nonatomic, copy) didselecttime timeblock;
@property (nonatomic, copy) didselectorder orderblock;
@property (nonatomic, copy) didselectmanage manageblock;
@end
