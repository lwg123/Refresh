//
//  FourthViewController.m
//  testRefsh
//
//  Created by weiguang on 2019/5/15.
//  Copyright © 2019 duia. All rights reserved.
//

#import "FourthViewController.h"


@interface FourthViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat last;
}
@property (nonatomic,strong)UITableView *tableV;
@property (nonatomic,strong) UIView *refreshBgV;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupNav];
}


- (void)setupNav {
    self.navigationController.navigationBar.hidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.translucent = YES;
    //设置导航为透明色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}


- (void)creatTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
    
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.view addSubview:_tableV];
    
    self.refreshBgV = [[UIView alloc] initWithFrame:CGRectMake(0, -SCREEN_H, SCREEN_W, SCREEN_H)];
    self.refreshBgV.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.refreshBgV];
    // [self.view sendSubviewToBack:self.refreshBgV];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = self.refreshBgV.frame;
    frame.origin.y = frame.origin.y - (scrollView.contentOffset.y - last);
    self.refreshBgV.frame = frame;
    last = scrollView.contentOffset.y;
    [self.view setNeedsLayout];
    
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
    myCell.textLabel.text = [NSString stringWithFormat:@"我是 cell: %ld",indexPath.row];
    return myCell;
}

@end
