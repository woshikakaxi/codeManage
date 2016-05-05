//
//  BaseTableViewController.h
//  自定义tabbar
//
//  Created by 杨超 on 16/5/5.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController
@property(nonatomic,strong)UITableView *MyTabView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end
