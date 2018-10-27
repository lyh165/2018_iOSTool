//
//  NSString+LYH_NSString_Extension.h
//  MHDMX
//
//  Created by lee on 2018/10/27.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LYH_NSString_Extension)




#pragma mark - str to json

- (NSDictionary *)lyh_jsonStr2Dict; // 字符串json 转 字典
- (id)lyh_jsonStr2ArrOrDict;        // 字符串json 转 字典 数组
-(UIImage *)Base64StrToUIImage;     // 字符串 转 UIimage


#pragma mark - 秒 转 时分秒
-(NSString *)lyh_secondsStr2HourMinuteSeconds:(NSString *)secondsStr; // 传入 秒  得到 xx:xx:xx
-(NSString *)lyh_secondsStr2MinuteSeconds:(NSString *)secondsStr; //传入 秒  得到  xx分钟xx秒


#pragma mark - 字符串 以什么进行分割 分割出来是一个数组
- (NSArray *)lyh_str2cuttingToArray:(NSString *)cuttingStr; // 传入 字符串 得到 切割完成的数组

+ (NSArray *)lyh_str2cuttingToArray:(NSString *)cuttingStr; // 传入 字符串 得到 切割完成的数组


@end
