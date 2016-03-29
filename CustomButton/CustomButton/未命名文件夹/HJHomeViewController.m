//
//  HJHomeViewController.m
//  MusicLoveTeacher
//
//  Created by niuxinghua on 15/4/25.
//  Copyright (c) 2015年 Hjojo. All rights reserved.
//
#define myscreenwith   [UIScreen mainScreen].bounds.size.width
#define myscreenheight   [UIScreen mainScreen].bounds.size.height

#import "HJHomeViewController.h"

#import "HJHomeBannTableViewCell.h"
#import "HJHomeButtonTableViewCell.h"
@interface HJHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HJHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem]setHidesBackButton:YES];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"音乐恋";
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self setupUI];
    
}
-(void)setupUI{
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, myscreenwith, myscreenheight-64) style:UITableViewStylePlain];
    //_table=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, myscreenwith, myscreenheight-64)];
    [self.view addSubview:_table];
    _table.showsVerticalScrollIndicator=NO;
    _table.delegate=self;
    _table.dataSource=self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_table registerClass:[HJHomeBannTableViewCell class] forCellReuseIdentifier:@"banner"];
    [_table registerClass:[HJHomeButtonTableViewCell class] forCellReuseIdentifier:@"button"];
    [self.view addSubview:_table];
    UIImage *img = [UIImage imageNamed:@"user"];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem* right=[[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(gotoMine)];
    self.navigationItem.rightBarButtonItem=right;
    
}

#pragma mark-tableview delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([indexPath row]==0) {
        return 120;
    }
    return 250;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView* back=[[UIView alloc]init];
    UILabel* lable=[[UILabel alloc]initWithFrame:CGRectMake(15, 72, myscreenwith-30, 39)];
    // lable.backgroundColor=UIColorFromRGB(0x01b7c8);
    lable.text=@"欢迎登陆音乐恋";
    lable.textAlignment=NSTextAlignmentCenter;
    lable.layer.cornerRadius=39/2.0;
    lable.layer.masksToBounds=YES;
    [back addSubview:lable];
    lable.textColor=[UIColor whiteColor];
    return back;
}
#pragma mark-datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HJHomeBannTableViewCell* bannercell;
    HJHomeButtonTableViewCell* cell;
    
    if (!bannercell) {
        bannercell=[[HJHomeBannTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"banner"];
    }
    cell=[[UITableViewCell alloc]init];
    if ([indexPath row]==0) {
        return bannercell;
    }else{
        __weak id weakself=self;
        cell=[[HJHomeButtonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"button"];
        cell.manageblock=^(){
            [weakself gotoqinba];
        };
        cell.newsblock=^(){
            [weakself gotoNotice];
        };
        cell.timeblock=^(){
            [weakself setTime];
        };
        cell.orderblock=^(){
            [weakself dingdan];
        };
        return cell;
    }
    
}
-(void)gotoqinba{
}
-(void)dingdan{
}
-(void)setTime{
    
}
-(void)gotoNotice{
}
-(void)gotoMine{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
