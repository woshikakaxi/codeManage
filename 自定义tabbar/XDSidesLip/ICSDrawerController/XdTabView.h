//
//  XdTabView.h
//  自定义tabbar
//
//  Created by 杨超 on 16/5/4.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XdTabView : UITableView<UITableViewDelegate>
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style tabview:(XdTabView*)tabView;
@end
