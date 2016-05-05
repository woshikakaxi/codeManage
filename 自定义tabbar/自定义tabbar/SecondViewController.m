//
//  SecondViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "SecondViewController.h"
#import "ThereViewController.h"
#import "XdTabView.h"
@interface SecondViewController ()<UISearchControllerDelegate,UISearchResultsUpdating,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *visableArray;
@property (nonatomic, strong) NSMutableArray *filterArray;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSourceArray = [[NSMutableArray alloc]init];
    self.filterArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 26; i++) {
        for (int j = 0; j < 4; j++) {
            NSString *str = [NSString stringWithFormat:@"%c%d", 'A'+i, j];
            [self.dataSourceArray addObject:str];
        }
    }
    self.visableArray = self.dataSourceArray;
    self.navigationItem.title = @"添加搜索框";
    self.view.backgroundColor = [UIColor orangeColor];
 
    self.MyTabView.rowHeight = 44;
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.barTintColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0];
    self.searchController.obscuresBackgroundDuringPresentation = YES;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = YES;

    self.MyTabView.tableHeaderView = self.searchController.searchBar;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_visableArray||_visableArray.count == 0) {
        _visableArray = self.dataSourceArray;
    }
    return self.visableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    
    cell.textLabel.text = [_visableArray objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *filterString = searchController.searchBar.text;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains [c] %@", filterString];
    
    self.visableArray = [NSMutableArray arrayWithArray:[self.dataSourceArray filteredArrayUsingPredicate:predicate]];
    
    [self.MyTabView reloadData];
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
