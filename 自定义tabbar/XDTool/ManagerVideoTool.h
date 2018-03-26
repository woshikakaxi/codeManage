//
//  ManagerVideoTool.h
//  自定义tabbar
//
//  Created by 王晓冬 on 2018/3/22.
//  Copyright © 2018年 王晓东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ManagerVideoTool : NSObject
+(instancetype)ManagerInstance;
-(void)showManagerPicker:(UIViewController *)ViewController Finshed:(void(^)(NSString *ViedoFilePath))finshed;
@end
