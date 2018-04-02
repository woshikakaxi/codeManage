//
//  UIViewController+Category.m
//  自定义tabbar
//
//  Created by 王晓冬 on 2018/3/28.
//  Copyright © 2018年 王晓东. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>
@implementation UIViewController (Category)
//方法替换实现
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL system = @selector(viewWillAppear:);
        SEL replaceSystem = @selector(XDviewWillAppear:);
        Method SystemMethod = class_getInstanceMethod([self class],system);
        Method replaceMethod = class_getInstanceMethod([self class], replaceSystem);
        method_exchangeImplementations(SystemMethod,replaceMethod);
    });
}
-(void)XDviewWillAppear:(BOOL)animated{
    DebugLog(@"查看是否执行交换后的方法");
}
@end
