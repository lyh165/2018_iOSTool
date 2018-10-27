//
//  NSString+LYH_NSStringCategory.m
//  LYH_EducationOnLive
//
//  Created by lee on 2018/8/23.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "NSString+LYH_NSStringCategory.h"

@implementation NSString (LYH_NSStringCategory)

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



@end
