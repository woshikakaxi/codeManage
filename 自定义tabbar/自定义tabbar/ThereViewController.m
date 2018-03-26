//
//  ThereViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "ThereViewController.h"
#import "ManagerVideoTool.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface ThereViewController ()
@property (nonatomic,strong) UIButton *VideoBtn;
@end

@implementation ThereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.VideoBtn];
}
-(void)pressblock{
    if (self.returnrefreshColorBlock) {
        self.returnrefreshColorBlock();
    }
    if (self.refreshShakeMygoldClikBlock) {
        self.refreshShakeMygoldClikBlock([UIColor blueColor]);
    }    [self.navigationController popViewControllerAnimated:YES];
}
-(UIButton *)VideoBtn{
    if (_VideoBtn == nil) {
        _VideoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _VideoBtn.width = kScaleFrom_iPhone6_Desgin(70);
        _VideoBtn.height = kScaleFrom_iPhone6_Desgin(25);
        _VideoBtn.center = self.view.center;
        _VideoBtn.titleLabel.font = [UIFont systemFontOfSize:kScaleFrom_iPhone6_Desgin(15)];
        [_VideoBtn setTitle:@"录制视频" forState:UIControlStateNormal];
        __weak typeof(self)weakSelf = self;
        [[_VideoBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            [[ManagerVideoTool ManagerInstance]showManagerPicker:weakSelf Finshed:^(NSString *ViedoFilePath) {
                
            }];
        }];
        [_VideoBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
    return _VideoBtn;
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
