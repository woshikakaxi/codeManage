//
//  ManagerCoreBluetooth.m
//  自定义tabbar
//
//  Created by 王晓冬 on 2018/3/26.
//  Copyright © 2018年 王晓东. All rights reserved.
//

#import "ManagerCoreBluetooth.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ManagerCoreBluetooth()<CBCentralManagerDelegate>
@property(nonatomic,strong)CBCentralManager *centralManager;
@end

@implementation ManagerCoreBluetooth
+(instancetype)BlueToothInstance{
    static ManagerCoreBluetooth *coreBlue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        coreBlue = [[ManagerCoreBluetooth alloc]init];
    });
    return coreBlue;
}
-(CBCentralManager *)centralManager{
    if (_centralManager == nil) {
        _centralManager = [[CBCentralManager alloc]initWithDelegate:self queue:dispatch_get_main_queue()];
    }
    return _centralManager;
}
-(void)startScan{
    [self.centralManager state];
}
//中心设备代理方蓝牙链接状态变更
-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    if (central.state == CBManagerStatePoweredOn) {
        DebugLog(@"蓝牙可用");
    }
    if (central.state == CBCentralManagerStateUnsupported) {
        DebugLog(@"该设备不支持蓝牙");
    }
    if (central.state == CBManagerStatePoweredOff) {
        DebugLog(@"该设备蓝牙已关闭");
    }
}
//挡扫描到外设设备之后会调用一下的方法
@end
