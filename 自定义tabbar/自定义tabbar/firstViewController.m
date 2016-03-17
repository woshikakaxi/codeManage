//
//  firstViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "firstViewController.h"
#import "AppDelegate.h"
@interface firstViewController ()

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"我有";
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bar_btn_icon_collect"] style:UIBarButtonItemStyleDone target:self action:@selector(DrawLeft:)];
      // Do any additional setup after loading the view.
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
