//
//  SecondViewController.m
//  testRefsh
//
//  Created by weiguang on 2019/5/8.
//  Copyright © 2019 duia. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableV;
@end

@implementation SecondViewController

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
    self.tableV.contentInset = UIEdgeInsetsMake(TOP, 0, 0, 0);
    
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    
    //创建顶部图片
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -TOP, SCREEN_W, TOP)];
    imageView.tag = 1000;
    
    //更改图片显示模式 根据图片原有尺寸进行显示 将多余部分切除
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //多余部分隐藏
    imageView.clipsToBounds = YES;
    
    imageView.image = [UIImage imageNamed:@"pic"];
    
    [self.view addSubview:_tableV];
    [self.tableV addSubview:imageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offSet = scrollView.contentOffset.y;
    
    if (offSet < -200)
    {
        UIImageView * tempImageView = (UIImageView*)[self.view viewWithTag:1000];
        
        CGRect f = tempImageView.frame;
        //保持图片原点仍为屏幕左上方
        f.origin.y = offSet;
        //保证图片根据滑动高度拉伸
        f.size.height = -offSet;
        //给图片重新设置坐标
        tempImageView.frame = f;
        NSLog(@"%@",NSStringFromCGRect(f));
    }
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
