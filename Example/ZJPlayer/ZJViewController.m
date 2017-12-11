//
//  ZJViewController.m
//  ZJPlayer
//
//  Created by shuaijianjian on 12/11/2017.
//  Copyright (c) 2017 shuaijianjian. All rights reserved.
//
/**
 ZJPlayer 测试 Url
 http://101.200.216.120/g1/M00/5E/9F/Ciy1JFkmfKWAcRTVAACGnenYDYk007.mp3?fileName=6582334644715396302.mp3
 */

#import "ZJViewController.h"
#import "ZJPlayer.h"

@interface ZJViewController ()<ZJPlayerDelegate>

@end

@implementation ZJViewController

- (void)viewDidLoad {
    [ZJPlayer shareManager].delegate = self;
}

// 远程
- (IBAction)remote:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://101.200.216.120/g1/M00/5E/9F/Ciy1JFkmfKWAcRTVAACGnenYDYk007.mp3?fileName=6582334644715396302.mp3"];
    [[ZJPlayer shareManager] playingWithResource:ZJPlayerResourceRemote url:url isCache:NO];
}

// 本地
- (IBAction)local:(UIButton *)sender {
   NSURL *url = [NSURL fileURLWithPath:@"/Users/bjqingniujj/Desktop/ZJPlayer/ZJPlayer/Example/ZJPlayer/6582334644715396302.mp3"];
    [[ZJPlayer shareManager] playingWithResource:ZJPlayerResourceLocal url:url isCache:NO];
}

// 播放
- (IBAction)play:(UIButton *)sender {
     [[ZJPlayer shareManager] play];
}

// 暂停
- (IBAction)pause:(UIButton *)sender {
     [[ZJPlayer shareManager] pause];
}

// 停止
- (IBAction)stop:(UIButton *)sender {
    [[ZJPlayer shareManager] stop];
}

- (void)audioPlayer:(ZJPlayer *)player playStateChanged:(ZJPlayerState)state{
    switch (state) {
        case ZJPlayerStatusUnknown:
            NSLog(@"未知状态");
            break;
        case ZJPlayerStatusFailed:
            NSLog(@"播放失败");
            break;
        case ZJPlayerStatusBuffering:
            NSLog(@"正在缓存");
            break;
        case ZJPlayerStatusReadyToPlay:
            NSLog(@"加载完成可以播放");
            break;
        case ZJPlayerStatusPlaying:
            NSLog(@"正在播放");
            break;
        case ZJPlayerStatusStopped:
            NSLog(@"暂停播放");
            break;
            
        default:
            break;
    }
}





@end
