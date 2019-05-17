//
//  ViewController.m
//  testRefsh
//
//  Created by weiguang on 2019/5/7.
//  Copyright © 2019 duia. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+ZSDRefresh.h"
#import "SecondViewController.h"
#import "thirdView/ThirdViewController.h"
#import "FourthViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50) style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    
    __weak UITableView *weakTable = table;
    
    [table addHeadWithCallback:^{
        
        NSLog(@"refresh.....");
        
        double delayInSeconds = 2.f;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakTable headEndRefreshing];
        });
        
    }];
    
}

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"---------%ld",indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            SecondViewController *secondVC = [[SecondViewController alloc] init];
            [self.navigationController pushViewController:secondVC animated:YES];
        }
            break;
        case 1:
        {
            ThirdViewController *secondVC = [[ThirdViewController alloc] init];
            [self.navigationController pushViewController:secondVC animated:YES];
        }
            break;
        case 2:
        {
            FourthViewController *secondVC = [[FourthViewController alloc] init];
            [self.navigationController pushViewController:secondVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}




@end
