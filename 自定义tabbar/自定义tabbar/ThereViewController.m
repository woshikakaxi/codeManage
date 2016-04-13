//
//  ThereViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "ThereViewController.h"

@interface ThereViewController ()

@end

@implementation ThereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton new];
    
    button.frame = [UIScreen mainScreen].bounds;
    [button addTarget:self action:@selector(pressblock) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
}
-(void)pressblock{
    if (self.returnrefreshColorBlock) {
       
        self.returnrefreshColorBlock();
    }
    if (self.refreshShakeMygoldClikBlock) {
        self.refreshShakeMygoldClikBlock([UIColor blueColor]);
    }    [self.navigationController popViewControllerAnimated:YES];
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
