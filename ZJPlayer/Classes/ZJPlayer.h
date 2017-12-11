//
//  ZJPlayer.h
//  Pods-ZJPlayer_Example
//
//  Created by BJQingniuJJ on 2017/12/11.
//
/**
   ZJPlayer 测试 Url
   http://101.200.216.120/g1/M00/5E/9F/Ciy1JFkmfKWAcRTVAACGnenYDYk007.mp3?fileName=6582334644715396302.mp3
 */

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, ZJPlayerState){
    ZJPlayerStatusUnknown = 1,       //位置状态
    ZJPlayerStatusFailed,            //播放失败
    ZJPlayerStatusReadyToPlay,       //加载完成可以播放
    ZJPlayerStatusBuffering,         //正在缓存
    ZJPlayerStatusPlaying,           //正在播放
    ZJPlayerStatusStopped,           //暂停播放
};

typedef NS_ENUM (NSInteger, ZJPlayerResourceType){
    ZJPlayerResourceRemote = 1,     // 远程资源
    ZJPlayerResourceLocal,          // 本地资源
};

@class ZJPlayer;
@protocol ZJPlayerDelegate <NSObject>

-(void)audioPlayer:(ZJPlayer *)player playStateChanged:(ZJPlayerState)state;

@end


@interface ZJPlayer : NSObject

@property (nonatomic, assign) id<ZJPlayerDelegate> delegate;
//播放状态
@property (nonatomic, assign, readonly) ZJPlayerState playerState;

+ (instancetype)shareManager;

- (void)playingWithResource:(ZJPlayerResourceType )resource url:(NSURL *)url isCache:(BOOL)isCache;

- (void)pause;

- (void)play;

- (void)stop;

@end
