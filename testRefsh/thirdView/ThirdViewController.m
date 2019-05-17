//
//  ThirdViewController.m
//  testRefsh
//
//  Created by weiguang on 2019/5/8.
//  Copyright © 2019 duia. All rights reserved.
//

#import "ThirdViewController.h"
#import "MDServiceTableHeaderViw.h"


@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)UITableView *tableV;
@property (nonatomic, strong) UIView *navView; /**<假导航栏*/
@property (nonatomic, strong) UILabel *titleLabel;/**<标题*/

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.view addSubview:self.navView];
    

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
   // [self resetNav];
}


- (void)setupNav {
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.translucent = YES;
    //设置导航为透明色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)resetNav {
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //把导航回复到原状，去除背景图片
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
    
}


- (void)creatTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    
    MDServiceTableHeaderViw *headerView = [[MDServiceTableHeaderViw alloc] initHeaderViewWithFrame:CGRectMake(0, 0, SCREEN_W, 288)];
    self.tableV.tableHeaderView = headerView;
    [self.view addSubview:_tableV];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell = @"cell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (!myCell) {
        myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell];
    }
    myCell.textLabel.text = [NSString stringWithFormat:@"我是 cell: %ld",(long)indexPath.row];
    return myCell;
}


/*
 *
 隐藏实际的导航栏，建一个自己的导航栏
 */

- (UIView *)navView {
    if (!_navView) {
        
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kNavigationBarHeight)];
        _navView.backgroundColor = [UIColor clearColor];
        
        self.titleLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0, kStatusBarHeight, [UIScreen mainScreen].bounds.size.width, 44)];
        self.titleLabel.text = @"特权服务";
        self.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:18];
        self.titleLabel.textColor = UIColorFromHex(0xffe5c6);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.alpha = 0;
        [_navView addSubview:self.titleLabel];
        
    }
    return _navView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat y = scrollView.contentOffset.y - kNavigationBarHeight+64;
    
    //NSLog(@"Offset : %f",y);
    CGFloat height = kNavigationBarHeight;
    CGFloat alpha = y/height;
    //NSLog(@"alpha : %f",alpha);
    if (alpha < 0) {
        alpha = 0;
    }else if (alpha > 1) {
        alpha = 1;
    }
    if (alpha == 1) {
        self.titleLabel.hidden = NO;
        self.navView.alpha = 1.0;
        self.titleLabel.alpha = 1.0;
        self.navView.backgroundColor = UIColorFromHex(0x313944);
    }else {
        
        self.navView.alpha = alpha;
        self.titleLabel.alpha = alpha;
        self.navView.backgroundColor = UIColorFromHexA(0x313944, alpha);
    }
    
}


@end
