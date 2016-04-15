//
//  FourthViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "FourthViewController.h"
#import "ThereViewController.h"
@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Block" style:UIBarButtonItemStyleDone target:self action:@selector(XDPressThere)];

}
-(void)XDPressThere{
    ThereViewController *new = [[ThereViewController alloc]init];
//    [new setReturnrefreshColorBlock:^{
//        self.view.backgroundColor = [UIColor whiteColor];
//    }];
    [new setRefreshShakeMygoldClikBlock:^(UIColor *color) {
        self.view.backgroundColor = color;
    }];
      [self.navigationController pushViewController:new
                                         animated:YES];
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
