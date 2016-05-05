//
//  XdTabView.m
//  自定义tabbar
//
//  Created by 杨超 on 16/5/4.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "XdTabView.h"
@interface XdTabView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation XdTabView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style tabview:(XdTabView*)tabView{
    if ([super initWithFrame:frame style:style]) {
           self.delegate = self;
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
            
        }
        //[self.searchController.searchBar sizeToFit];
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        
            [self setLayoutMargins:UIEdgeInsetsZero];
        }

    }
    return self;
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

@end
