//
//  HJHomeBannTableViewCell.m
//  MusicLove
//
//  Created by niuxinghua on 16/3/11.
//  Copyright © 2016年 Hjojo. All rights reserved.
//

#import "HJHomeBannTableViewCell.h"
#import "AFNetworking.h"
@implementation HJHomeBannTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _banner=[[GGBannerView alloc]init];
        _banner.delegate=self;
        [self loadBannerData];
        NSUserDefaults* defalt=[NSUserDefaults standardUserDefaults];
        NSArray* images=[defalt objectForKey:@"images"];
        if (images) {
            [_banner configBanner:images];
        }
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:_banner];
    }
    return self;
    
}
-(void)layoutSubviews{
    _banner.frame=self.frame;
}
-(void)loadBannerData{
    __block NSMutableArray* images;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    NSDictionary* dic=[NSDictionary dictionaryWithObjectsAndKeys:@"20000000002",@"positionId", nil];
    [manager GET:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray* data=[responseObject valueForKey:@"data"];
        if (data==nil) {
            return ;
        }
        if ([data isKindOfClass:[NSNull class]]) {
            return ;
        }
        NSArray*  bannerdata=[NSMutableArray arrayWithArray:data];
        images=[NSMutableArray new];
        if (!_datalist) {
            _datalist=[NSMutableArray new];
        }
        if ([data isKindOfClass:[NSNull class]]) {
            return ;
        }
        
        for (int i=0;i<[bannerdata count];i++) {
            
            NSDictionary* dic=[bannerdata objectAtIndex:i];
            [images addObject:[dic objectForKey:@"ImageUrl"]];
            [_datalist addObject:dic];
        }
        
        NSUserDefaults* defalt=[NSUserDefaults standardUserDefaults];
        [defalt setObject:images forKey:@"images"];
        [defalt synchronize];
        [_banner configBanner:images];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
}
-(void)bannerView:(GGBannerView *)bannerView didSelectAtIndex:(NSUInteger)index{
    
}
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
