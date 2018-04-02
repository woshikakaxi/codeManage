//
//  ManagerCoreBluetooth.h
//  自定义tabbar
//
//  Created by 王晓冬 on 2018/3/26.
//  Copyright © 2018年 王晓东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagerCoreBluetooth : NSObject
+(instancetype)BlueToothInstance;

//启动蓝牙搜索设备
-(void)startScan;

@end
