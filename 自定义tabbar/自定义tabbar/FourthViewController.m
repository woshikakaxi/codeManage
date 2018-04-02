//
//  FourthViewController.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "FourthViewController.h"
#import "ThereViewController.h"
#import "LeftViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
//#import "UIViewController+Category.h"
@interface FourthViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *Mytabview;
@end

@implementation FourthViewController

static char asscoiateObjectkey;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Block" style:UIBarButtonItemStyleDone target:self action:@selector(XDPressThere)];
    unsigned int count;
//    //获取属性列表
//    objc_property_t *propertyList = class_copyPropertyList([self class],&count);
//    for (unsigned int i = 0; i < count; i++) {
//        const char *propertyName = property_getName(propertyList[i]);
//        DebugLog(@"查看声明的属性都有哪些%s",propertyName);
//    }
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method selector = methodList[i];
    }
//    //获取成员变量列表
//    Ivar *ivarList = class_copyIvarList([self class],&count);
//    for (unsigned int i = 0; i < count ; i++) {
//        const char * ivarName = ivar_getName(ivarList[i]);
//        DebugLog(@"查看成员变量都有哪些%s",ivarName);
//    }
//    //获取协议列表
//    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
//    for (unsigned int i = 0 ; i < count; i++) {
//        Protocol *myProtocal = protocolList[i];
//        const char *protocalName = protocol_getName(myProtocal);
//        DebugLog(@"查看返回的代理协议是什么%s",protocalName);
//    }
    //iOS动态添加方法
    [self performSelector:@selector(addTag:) withObject:@"study" afterDelay:0];
    [[self class] performSelectorOnMainThread:@selector(testClass:) withObject:@"study" waitUntilDone:NO];
    //iOS开发关联对想继承用来添加属性有时候不太方便动态添加属性
    objc_setAssociatedObject(self,&asscoiateObjectkey,@"wegiht", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSString *string = objc_getAssociatedObject(self, &asscoiateObjectkey);
}

//-(void)confiNavController{
//
//}
//当有方法未实现的话会调用一下两个方法可以用来防止有方法未实现而出现的崩溃
+(BOOL)resolveInstanceMethod:(SEL)sel{
    if([NSStringFromSelector(sel) isEqualToString:@"addTag:"]) {
        class_addMethod(self, sel,(IMP)runAddMethod,"v@:*");
    }
    return YES;
}
+(BOOL)resolveClassMethod:(SEL)sel{
    return YES;
    
}

void runAddMethod(id self, SEL _cmd, NSString *string){
    //添加一个方法也需要实现这个方法
    DebugLog(@"查看这个参数的值是什么%@",string);
}
void runAddClassMethod(id self,SEL _cmd,NSString *contetString){
    
}
+(void)testClass:(id)sender{
    
}

-(void)UpdateSexContent{
    
}
-(UITableView *)Mytabview{
    if (_Mytabview == nil) {
        _Mytabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,WIDTH,HEGIHT/3) style:UITableViewStylePlain];
        _Mytabview.delegate = self;
        _Mytabview.dataSource = self;
        _Mytabview.showsVerticalScrollIndicator = NO;
        _Mytabview.showsHorizontalScrollIndicator = NO;
        [_Mytabview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _Mytabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _Mytabview;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = @"检测代理协议的问题";
    cell.textLabel.font = [UIFont systemFontOfSize:kScaleFrom_iPhone6_Desgin(15)];
    return cell;
}
-(void)XDPressThere{
    ThereViewController *new = [[ThereViewController alloc]init];
    __weak typeof(self) weakSelf = self;
    [new setRefreshShakeMygoldClikBlock:^(UIColor *color) {
        weakSelf.view.backgroundColor = color;
    }];
      [weakSelf.navigationController pushViewController:new
                                         animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
