//
//  ManagerVideoTool.m
//  自定义tabbar
//
//  Created by 王晓冬 on 2018/3/22.
//  Copyright © 2018年 王晓东. All rights reserved.
//

#import "ManagerVideoTool.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ManagerVideoTool()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong) UIImagePickerController *MyVideoPicker;
@property (nonatomic,strong) UIViewController *Controller;
@end

@implementation ManagerVideoTool
+(instancetype)ManagerInstance{
    static ManagerVideoTool *VideoTool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        VideoTool = [[ManagerVideoTool alloc]init];
    });
    return VideoTool;
}
+(void)load{
    //编译器中存在此文件的情况下调用了该方法
}
+(void)initialize{
    //第一次使用该类的时候调用了该方法
}
-(void)showManagerPicker:(UIViewController *)ViewController Finshed:(void(^)(NSString *ViedoFilePath))finshed{
    self.Controller = ViewController;
    if (!TARGET_IPHONE_SIMULATOR) {
        [ViewController presentViewController:self.MyVideoPicker animated:YES completion:nil];
    }else{
    }
}
-(UIImagePickerController *)MyVideoPicker{
    if (_MyVideoPicker == nil){
  
        _MyVideoPicker = [[UIImagePickerController alloc]init];
        _MyVideoPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSArray *Types = [UIImagePickerController
                          availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        _MyVideoPicker.mediaTypes = [NSArray arrayWithObjects:Types[1], nil];
        _MyVideoPicker.allowsEditing = YES;
        _MyVideoPicker.videoQuality = 0;
        _MyVideoPicker.delegate = self;
    }
    return _MyVideoPicker;
}
//视频的回调
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    DebugLog(@"查看返回的数据是什么%@",info);
    [self.Controller dismissViewControllerAnimated:YES completion:nil];
    NSURL *urlPath = [info objectForKey:UIImagePickerControllerMediaURL];
    [self ConvertVideoFormAndVideoContent:urlPath];
}
//进行视频的转MP4和压缩
-(void)ConvertVideoFormAndVideoContent:(NSURL *)filePath{
    AVURLAsset *avAseet = [AVURLAsset URLAssetWithURL:filePath options:nil];
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAseet presetName:AVAssetExportPresetMediumQuality];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSString *videoPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/output-%@.mp4",currentTimeString];
    NSURL*outUrl = [NSURL fileURLWithPath:videoPath];
    exportSession.outputURL = outUrl;
    exportSession.outputFileType = AVFileTypeMPEG4;
    exportSession.shouldOptimizeForNetworkUse  =  YES;
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        switch (exportSession.status) {
            case AVAssetExportSessionStatusCompleted:
                DebugLog(@"查看返回的数据是什么%@",videoPath);
                [self requestVideoContentSize:videoPath];

                break;
                
            default:
                DebugLog(@"查看返回的数据是什么%@",exportSession.error);
                break;
        }
    }];
}
//获取文件内容的大小单位是
-(CGFloat)requestVideoContentSize:(NSString *)filePath{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        DebugLog(@"查看返回的视频的大小是多少%llu",[[manager attributesOfItemAtPath:filePath error:nil]fileSize]);
        return [[manager attributesOfItemAtPath:filePath error:nil]fileSize];
    }
    return 0;
}

@end
