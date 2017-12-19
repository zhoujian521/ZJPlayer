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

// 继续
- (IBAction)play:(UIButton *)sender {
     [[ZJPlayer shareManager] resume];
}

// 暂停
- (IBAction)pause:(UIButton *)sender {
     [[ZJPlayer shareManager] pause];
}

// 停止
- (IBAction)stop:(UIButton *)sender {
    [[ZJPlayer shareManager] stop];
}

// 2倍速播放
- (IBAction)playingWith2Rate:(UIButton *)sender {
    [ZJPlayer shareManager].rate = 2.0f;
}

// 静音
- (IBAction)muted:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    [ZJPlayer shareManager].muted = sender.isSelected;
}

// 快进xs
- (IBAction)seekTimexs:(UIButton *)sender {
    [[ZJPlayer shareManager] seekWithTimeInterval:15.0f];
}

- (IBAction)volume:(UISlider *)sender {
     [ZJPlayer shareManager].volume = sender.value;
    
}

- (IBAction)progress:(UISlider *)sender {
   [[ZJPlayer shareManager] seekToProgress:sender.value];
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
