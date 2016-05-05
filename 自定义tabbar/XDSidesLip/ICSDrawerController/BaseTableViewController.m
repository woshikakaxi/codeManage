//
//  BaseTableViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/5/5.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NSMutableArray alloc]init];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)] == YES)
        self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.MyTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEGIHT-49) style:UITableViewStylePlain];
    self.MyTabView.delegate = self;
    self.MyTabView.dataSource = self;
    [self.view addSubview:self.MyTabView];
    if ([_MyTabView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_MyTabView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    //[self.searchController.searchBar sizeToFit];
    if ([_MyTabView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [_MyTabView setLayoutMargins:UIEdgeInsetsZero];
    }

    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
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
