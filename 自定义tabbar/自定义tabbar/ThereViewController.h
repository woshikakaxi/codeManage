//
//  ThereViewController.h
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThereViewController : UIViewController
@property (nonatomic,copy) void(^returnrefreshColorBlock)();
@property (nonatomic,copy) void(^refreshShakeMygoldClikBlock)(UIColor *color);
@end
