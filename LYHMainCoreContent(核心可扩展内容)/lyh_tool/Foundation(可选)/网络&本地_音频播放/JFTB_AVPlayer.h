//
//  JFTB_AVPlayer.h
//  MHDMX
//
//  Created by lee on 2018/10/24.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AVPlayer;
@interface JFTB_AVPlayer : NSObject
@property (nonatomic,strong)AVPlayer *avPlayer;
- (instancetype)initWithNetworkAudioUrlStr:(NSString *)audioUrlStr isPlay:(BOOL)play isCycle:(BOOL)cycle;
- (void)jftb_audioPlay;
- (void)jftb_audioPause;

@end
