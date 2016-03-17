//
//  XDTarBarViewController.h
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
/*不使用侧滑的话无需导入#import "ICSDrawerController.h"
 1.将代理方法删除
 2.@property (nonatomic,strong) ICSDrawerController *Drawer;删除
 3.将侧滑的协议方法删除
 */
@interface XDTarBarViewController : UITabBarController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>
@property (nonatomic,strong) ICSDrawerController *Drawer;
+(instancetype)initXDTabBar;


@end
