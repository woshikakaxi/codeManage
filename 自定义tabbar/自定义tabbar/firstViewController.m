//
//  firstViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "firstViewController.h"
#import "AppDelegate.h"
#import "SecondViewController.h"
#import "ThereViewController.h"
#import "FourthViewController.h"
@interface firstViewController (){
    SecondViewController *second;
    ThereViewController *there;
    FourthViewController *four;
}
@property (nonatomic,strong) UISegmentedControl *segementControl;
@property (nonatomic,strong) UIViewController *currentViewController;
@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//     self.navigationItem.title = @"我有";
//       self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bar_btn_icon_collect"] style:UIBarButtonItemStyleDone target:self action:@selector(DrawLeft:)];
      // Do any additional setup after loading the view.
    second = [[SecondViewController alloc]init];

    [self addChildViewController:second];
    there = [[ThereViewController alloc]init];
    [self addChildViewController:there];
    four = [[FourthViewController alloc]init];
    [self addChildViewController:four];
    [self.view addSubview:second.view];
    NSArray *array = @[@"好友",@"关注",@"粉丝"];
    self.segementControl = [[UISegmentedControl alloc]initWithItems:array];
    self.segementControl.frame = CGRectMake(20, 0, WIDTH-40, 30);
   // self.segementControl.tintColor = [UIColor redColor];
    [self.view addSubview:self.segementControl];
    [self.segementControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
//    [there didMoveToParentViewController:self];
    self.currentViewController= second;
    
    self.navigationItem.titleView = self.segementControl;
    ;
    [self addChildViewController:second];
}
-(void)change:(UISegmentedControl *)segement{
    
    
    switch (segement.selectedSegmentIndex) {
        case 0: {
            if (self.currentViewController == second) {
                return;
            }

            [self transitionFromViewController:self.currentViewController toViewController:second duration:1 options:UIViewAnimationOptionRepeat animations:^{
                
            } completion:^(BOOL finished) {
                if(finished) {
                    self.currentViewController = second;
                }
                else {
                    NSLog(@"%@",@"未完成");
                }
            }];
        }
            break;
        case 1: {
                      [self transitionFromViewController:self.currentViewController toViewController:there duration:1 options:
                UIViewAnimationOptionRepeat animations:^{
                
            } completion:^(BOOL finished) {
                if(finished) {
                    self.currentViewController = there;
                                   }
                else {
                   
                    NSLog(@"%@",@"未完成");
                }
            }];
        }
            break;
        case 2: {
            [self transitionFromViewController:self.currentViewController toViewController:four duration:1 options:UIViewAnimationOptionRepeat  animations:^{
//                self.view.alpha = 0.1;
            } completion:^(BOOL finished) {
                if(finished) {
                    self.currentViewController = four;
                    
    
                }
                else {
                  
                }
            }];
        }
            break;
        default:
            break;
    }
}
-(void)DrawLeft:(UIBarButtonItem *)item{
    [ApplicationDelegate.XDtababr.Drawer open];
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
