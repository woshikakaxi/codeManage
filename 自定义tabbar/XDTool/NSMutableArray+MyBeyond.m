//
//  NSMutableArray+MyBeyond.m
//  自定义tabbar
//
//  Created by 王晓冬 on 2018/3/30.
//  Copyright © 2018年 王晓东. All rights reserved.
//

#import "NSMutableArray+MyBeyond.h"
#import <objc/runtime.h>
@implementation NSMutableArray (MyBeyond)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /**
         *objectAtIndexedSubscript:的方法替换soure[i]
         **/
        Method indexSystem = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(objectAtIndexedSubscript:));
        Method NewReplaceSystem = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(MutablePreventBeyondObjectAtIndexSubscript:));
        method_exchangeImplementations(indexSystem, NewReplaceSystem);
        /**
         *objectAtIndex:的方法替换{source objectAtIndex:i}
         **/
        Method ObjectIndexSystem = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(objectAtIndex:));
        Method NewObjecIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(MutablePreventBeyondObjectAtIndex:));
        method_exchangeImplementations(ObjectIndexSystem,NewObjecIndex);
    });
   
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
-(id)MutablePreventBeyondObjectAtIndex:(NSUInteger)index{
    
    if (self.count>0&&index<self.count) {
        return [self MutablePreventBeyondObjectAtIndex:index];
    }else if(self.count>0&&index>=self.count){
        return [self MutablePreventBeyondObjectAtIndexSubscript:self.count-1];
    }else{
        return nil;
    }
}
@end
