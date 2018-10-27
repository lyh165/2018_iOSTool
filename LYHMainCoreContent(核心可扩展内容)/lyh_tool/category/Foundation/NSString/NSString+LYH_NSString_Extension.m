//
//  NSString+LYH_NSString_Extension.m
//  MHDMX
//
//  Created by lee on 2018/10/27.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "NSString+LYH_NSString_Extension.h"

@implementation NSString (LYH_NSString_Extension)



#pragma mark - str to json


/**
 字符串json 转 字典
 @return json字典
 */
- (NSDictionary *)lyh_jsonStr2Dict
{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [(NSString *)self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
- (id)lyh_jsonStr2ArrOrDict
{
    // 防止block的野指针错误
    __weak typeof(self) weakSelf = self;
    if (weakSelf == nil) {
        return nil;
    }
    
    NSData *jsonData = [(NSString *)weakSelf dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id arrOrDict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                   options:NSJSONReadingMutableContainers
                                                     error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return arrOrDict;
}


-(UIImage *)Base64StrToUIImage
{
    NSData  *decodedImageData   = [[NSData alloc] initWithBase64Encoding:(NSString *)self];
    UIImage *decodedImage       = [UIImage imageWithData:decodedImageData];
    return decodedImage;
}


/**
 https://www.cnblogs.com/jukaiit/p/5795833.html
 iOS 字典或者数组和JSON串的转换
 
 // 将字典或者数组转化为JSON串
 + (NSData *)toJSONData:(id)theData
 {
 NSError *error = nil;
 NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:nil];
 
 if ([jsonData length]&&error== nil){
 return jsonData;
 }else{
 return nil;
 }
 }
 */



#pragma mark - 秒 转 时分秒
//传入 秒  得到 xx:xx:xx
-(NSString *)lyh_secondsStr2HourMinuteSeconds:(NSString *)secondsStr{
    
    NSInteger seconds = [secondsStr integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}


//传入 秒  得到  xx分钟xx秒
-(NSString *)lyh_secondsStr2MinuteSeconds:(NSString *)secondsStr{
    
    NSInteger seconds = [secondsStr integerValue];
    
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@分钟%@秒",str_minute,str_second];
    
    NSLog(@"format_time : %@",format_time);
    
    return format_time;
    
}
#pragma mark - 字符串 以什么进行分割 分割出来是一个数组
- (NSArray *)lyh_str2cuttingToArray:(NSString *)cuttingStr
{
    NSArray *array = [(NSString*)self componentsSeparatedByString:cuttingStr]; //从字符A中分隔成2个元素的数组
    return array;
}

+ (NSArray *)lyh_str2cuttingToArray:(NSString *)cuttingStr
{
    NSArray *array = [(NSString*)self componentsSeparatedByString:cuttingStr]; //从字符A中分隔成2个元素的数组
    return array;
}

@end
