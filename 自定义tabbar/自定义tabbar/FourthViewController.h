//
//  FourthViewController.h
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController
//描述类中的一个方法
typedef struct objc_method *Method;
//实例变量
typedef struct objc_ivar *Ivar;
//类别category
typedef struct objc_category *Category;
//类中声明的属性
typedef struct objc_property *property;

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *sex;
@property (nonatomic,strong) NSString *age;
-(void)UpdateSexContent;
@end
