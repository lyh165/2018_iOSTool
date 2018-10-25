//
//  JFTB_AVPlayer.m
//  MHDMX
//
//  Created by lee on 2018/10/24.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "JFTB_AVPlayer.h"
// systemFoundation
// 音频
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
@interface JFTB_AVPlayer()
@property (nonatomic,strong)AVPlayerItem *avPlayerItem;
//@property (nonatomic,strong)AVPlayer *avPlayer;

@end
@implementation JFTB_AVPlayer
- (instancetype)init
{
    if (self = [super init]) {
        NSLog(@"%s",__func__);
    }
    return self;
}


- (instancetype)initWithNetworkAudioUrlStr:(NSString *)audioUrlStr isPlay:(BOOL)play isCycle:(BOOL)cycle
{
    self = [super init];
    self.avPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",audioUrlStr]]];
    self.avPlayer = [[AVPlayer alloc]initWithPlayerItem:self.avPlayerItem];
    
  
    
   // 1、首次进入是否播放
    if (play) {
        [self.avPlayer play];
    }
    else
    {
        NSLog(@"只是简简单单创建出来 不操作事情");
    }
    
    // 是否循环播放该音频
    if (cycle) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playerItemDidPlayToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    else
    {
        
    }
    
    
    return self;
}

- (void)jftb_audioPlay
{
    [self.avPlayer play];
}
- (void)jftb_audioPause
{
    [self.avPlayer pause];
}
- (void)cyclePlayAduio
{
    NSLog(@"重新播放");
    if (!self.avPlayer) {
        return;
    }
    CGFloat a = 0;
    NSInteger dragedSeconds = floor(a);
    CMTime dragedCMTime = CMTimeMake(dragedSeconds, 1);
    [self.avPlayer seekToTime:dragedCMTime];
    [self.avPlayer play];
}


- (void)playerItemDidPlayToEnd:(NSNotification *)notification{
    NSLog(@"重播网络音频");
    [self cyclePlayAduio];
}
@end
