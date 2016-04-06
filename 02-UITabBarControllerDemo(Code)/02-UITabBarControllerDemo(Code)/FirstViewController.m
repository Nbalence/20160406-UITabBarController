//
//  ViewController.m
//  02-UITabBarControllerDemo(Code)
//
//  Created by qingyun on 16/4/6.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "FirstViewController.h"
#import "NextPageViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

//重写指定初始化方法，设置tabBarItem
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //创建并设置tabBarItem
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:101];
        self.tabBarItem.badgeValue = @"10";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:nextBtn];
    
    nextBtn.frame = CGRectMake(100, 100, 100, 40);
    [nextBtn setTitle:@"下页" forState:UIControlStateNormal];
    
    [nextBtn addTarget:self action:@selector(nextPageVC) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)nextPageVC {
    NextPageViewController *nextPageVC = [[NextPageViewController alloc] init];
    [self.navigationController pushViewController:nextPageVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
