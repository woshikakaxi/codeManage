//
//  NSArray+MyBeyond.m
//  自定义tabbar
//
//  Created by 王晓冬 on 2018/3/29.
//  Copyright © 2018年 王晓东. All rights reserved.
//

#import "NSArray+MyBeyond.h"
#import <objc/runtime.h>
@implementation NSArray (MyBeyond)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oldObjectAtIndex =class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(objectAtIndex:));
        Method newObjectAtIndex =class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(PreventBeyondObjectAtIndex:));
        method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
        /**
         *objectAtIndexedSubscript:的方法替换soure[i]
         **/
        Method indexSystem = class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(objectAtIndexedSubscript:));
        Method NewReplaceSystem = class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(MutablePreventBeyondObjectAtIndexSubscript:));
        method_exchangeImplementations(indexSystem, NewReplaceSystem);
    });
}
-(id)PreventBeyondObjectAtIndex:(NSUInteger)index{
    if (self.count>0&&index < self.count) {
        return [self PreventBeyondObjectAtIndex:index];
    }else if(self.count>0&&index>=self.count){
        return [self PreventBeyondObjectAtIndex:self.count-1];
    }else{
        return nil;
    }
}
-(id)MutablePreventBeyondObjectAtIndexSubscript:(NSUInteger)index{
    if (self.count>0&&index<self.count) {
        return [self MutablePreventBeyondObjectAtIndexSubscript:index];
    }else if(self.count>0&&index>=self.count){
        return [self MutablePreventBeyondObjectAtIndexSubscript:self.count-1];
    }else{
        return nil;
    }
}
@end
