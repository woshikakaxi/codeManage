//
//  XDTarBarViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "XDTarBarViewController.h"

#define BackImageView_Tag 999
#define Btn_Tag 100
@interface XDTarBarViewController ()

@end

@implementation XDTarBarViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"firstViewController",@"SecondViewController",@"ThereViewController",@"FourthViewController"];
    
    NSArray *ImageNormalArray = @[@"item01",@"item02",@"item03",@"item04"];
    
        NSArray *selectImageArray = @[@"item01_selected",@"item02_selected",@"item03_selected",@"item04_selected"];

    [self cretaViewControllers:array];
    [self creatTbbarBtnTitle:nil imageNormalArray:ImageNormalArray imageSelectArray:selectImageArray];
    // Do any additional setup after loading the view.
}
+(instancetype)initXDTabBar{
    
    return [[self alloc]init];
}
-(void)cretaViewControllers:(NSArray *)ViewControllers{
    NSArray *controllerArray = [[NSArray alloc]initWithArray:ViewControllers];

    NSMutableArray *viecontrollers = [NSMutableArray arrayWithCapacity:controllerArray.count];
    for (int i = 0; i < controllerArray.count; i++) {
        Class classNmae = NSClassFromString(controllerArray[i]);
        UIViewController *vc = [[classNmae alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.edgesForExtendedLayout = UIRectEdgeNone;
        vc.automaticallyAdjustsScrollViewInsets = NO;
        [viecontrollers addObject:nav];
    }

    //设置当前tababr上的controller
    [self setViewControllers:viecontrollers];
    
}
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEGIHT [UIScreen mainScreen].bounds.size.height
-(void)creatTbbarBtnTitle:(NSArray *)titleArray imageNormalArray:(NSArray *)imageNormalArray imageSelectArray:(NSArray *)imageSelectArray{
    /***backImageVIew做背景视图****/
    UIImageView *backImageVIew = [UIImageView new];
    backImageVIew.frame = CGRectMake(0, 0, WIDTH, 49);
    backImageVIew.tag = BackImageView_Tag;
  
    backImageVIew.userInteractionEnabled = YES;
    
    for (int i = 0; i < imageNormalArray.count; i++) {
        UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn.frame = CGRectMake(0+WIDTH/imageNormalArray.count*i, 0, WIDTH/imageNormalArray.count, backImageVIew.frame.size.height);
       
        Btn.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [Btn setImage:[UIImage imageNamed:imageNormalArray[i]] forState:UIControlStateNormal];
        Btn.tag = Btn_Tag+i;
        [Btn setImage:[UIImage imageNamed:imageSelectArray[i]] forState:UIControlStateSelected];
        [Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [backImageVIew addSubview:Btn];
        if (i== 1) {
            Btn.selected = YES;
        }
    }
    self.selectedIndex = 1;
    [self.tabBar addSubview:backImageVIew];
}
- (void)btnClick:(UIButton *)btn
{
    UIImageView *backImageView = (UIImageView *)[self.view viewWithTag:BackImageView_Tag];
    for (id obj in backImageView.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)obj;
            if (button != btn) {
                [button setSelected:NO];
            } else {
                [button setSelected:YES];
            }
        }
    }
    
    [self setSelectedIndex:btn.tag-Btn_Tag];
    
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
