//
//  QYTabBarController.m
//  03-CustomTabBarDemo
//
//  Created by qingyun on 16/4/6.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabBarController.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define BGViewH     49.0
@interface QYTabBarController ()
@property (nonatomic, strong) UIView *underView;
@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置平级的视图控制器
    //[self setViewControllers];
    //自定义tabBar
    [self setCustomTabBar];
    // Do any additional setup after loading the view.
}

//绑定视图控制器
-(void)setViewControllers {
    //创建tabBarController中平级的视图控制器
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor cyanColor];
    
    //把平级的控制器添加在数组中
    NSArray *vcs = @[vc1,vc2,vc3,vc4];
    //把vcs赋值给tabBarController的viewControllers
    self.viewControllers = vcs;
}

//自定义tabBar
-(void)setCustomTabBar {
    
    //1、添加自定义tabBar背景
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, QYScreenH - BGViewH, QYScreenW, BGViewH)];
    [self.view addSubview:bgView];
    //拉伸背景图片
    UIImage *image= [[UIImage imageNamed:@"tabButtonBackground"] resizableImageWithCapInsets:UIEdgeInsetsMake(21, 1, 21, 1) resizingMode:UIImageResizingModeStretch];
    bgView.image = image;
    //必须设置bgView可以与用户交互（barItem是bgView的子视图）
    bgView.userInteractionEnabled = YES;
    //2、添加每个视图控制器对应的tabBarItem (宽：48 高：38)
    //左边第一个barItem距离屏幕左边的间距
    CGFloat baseSpace = 20;
    //宽高
    CGFloat barItemW = 48;
    CGFloat barItemH = 38;
    //计算两个相邻的barItem间距
    CGFloat itemSpace = (QYScreenW - 4 * barItemW - 2 * baseSpace) / 3;
    for (int i = 0; i < 4; i++) {
        //计算每个barItem的位置
        CGFloat barItemX = baseSpace + (barItemW + itemSpace) * i;
        CGFloat barItemY = (CGRectGetHeight(bgView.frame) - barItemH) / 2.0;
        
        UIButton *barItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgView addSubview:barItem];
        
        //设置frame
        barItem.frame = CGRectMake(barItemX, barItemY, barItemW, barItemH);
        
        //图片名称
        NSString *imageName = [NSString stringWithFormat:@"%d",i + 1];
        [barItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        //添加事件监听(touchUpInside)
        [barItem addTarget:self action:@selector(barItemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置tag
        barItem.tag = 100 + i;
    }
    
    //3、在选中的tabBarItem下插入一个underView
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 52, 42)];
    [bgView insertSubview:underView atIndex:0];
    //设置中心点
    UIButton *leftBtn = [bgView viewWithTag:100];
    underView.center = leftBtn.center;
    //设置背景颜色
    underView.backgroundColor = [UIColor purpleColor];
    
    _underView = underView;
    
}

-(void)barItemClick:(UIButton *)barItem {
    self.selectedIndex = barItem.tag - 100;
    [UIView animateWithDuration:.5 animations:^{
        _underView.center = barItem.center;
    }];
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
