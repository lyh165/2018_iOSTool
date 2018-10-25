//
//  APOrderInfo.m
//  AliSDKDemo
//
//  Created by antfin on 17-10-24.
//  Copyright (c) 2017年 AntFin. All rights reserved.
//

#import "APOrderInfo.h"

@implementation APBizContent
/*
 alipay_sdk=alipay-sdk-java-dynamicVersionNo&app_id=2018042460042154&biz_content=%7B%22out_trade_no%22%3A%2220180716160926260%22%2C%22passback_params%22%3A%22%E8%B4%AD%E4%B9%B0%E5%A8%83%E5%A8%83%E5%B8%81%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22subject%22%3A%22%E4%BB%98%E6%AC%BE29%E5%85%83%E8%B4%AD%E4%B9%B0%E5%A8%83%E5%A8%83%E5%B8%81%21%22%2C%22timeout_express%22%3A%2230m%22%2C%22total_amount%22%3A%2229%22%7D&charset=utf-8&format=json&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Fwww.huo858.com%2FGrabDoll_Web%2FaliPay_result.do&sign=eSxlBmAP1%2BPh43HplYzSyD%2BItegGbNK5NV6SAJenPnL1bRXV3qA1antJX4UTvWRgjcRL83315FeRyTap5gJuYFjAmjT1LPNLYO98M%2BYE2GCPYMVrpzWS6WejIt2q8BJyfb7QAwbbTNkzAi%2BpzlB49IzgCvImCkJflKmpYxOUGJmaA2WPSJTY1we2RrE8%2Fdfyi8xd%2BgJhMpNOa4Quy3ky7mtZVYCkbhq70Iq1xo5xeeix9aMakmTkOvT6C5N8TE02S3M%2BpWw%2FJawMaEoC2AFJRbaLbnSCVvqBgIQcCAgfR65w6WzXX7V6%2FIYzJFmssQcsj6r4%2FgUKdKABi2uve7mC7A%3D%3D&sign_type=RSA2&timestamp=2018-07-16+16%3A09%3A26&version=1.0
 */
- (NSString *)description {
    
    NSMutableDictionary *tmpDict = [NSMutableDictionary new];
    // NOTE: 增加不变部分数据
    [tmpDict addEntriesFromDictionary:@{@"subject":_subject?:@"",
                                        @"out_trade_no":_out_trade_no?:@"",
                                        @"total_amount":_total_amount?:@"",
                                        @"seller_id":_seller_id?:@"",
                                        @"product_code":_product_code?:@"QUICK_MSECURITY_PAY"}];
    
    // NOTE: 增加可变部分数据
    if (_body.length > 0) {
        [tmpDict setObject:_body forKey:@"body"];
    }
    
    if (_timeout_express.length > 0) {
        [tmpDict setObject:_timeout_express forKey:@"timeout_express"];
    }
    
    // NOTE: 转变得到json string
    NSData* tmpData = [NSJSONSerialization dataWithJSONObject:tmpDict options:0 error:nil];
    NSString* tmpStr = [[NSString alloc]initWithData:tmpData encoding:NSUTF8StringEncoding];
    return tmpStr;
}

@end


@implementation APOrderInfo

- (NSString *)orderInfoEncoded:(BOOL)bEncoded {
    
    if (_app_id.length <= 0) {
        return nil;
    }
    
    // NOTE: 增加不变部分数据
    NSMutableDictionary *tmpDict = [NSMutableDictionary new];
    [tmpDict addEntriesFromDictionary:@{@"app_id":_app_id,
                                        @"method":_method?:@"alipay.trade.app.pay",
                                        @"charset":_charset?:@"utf-8",
                                        @"timestamp":_timestamp?:@"",
                                        @"version":_version?:@"1.0",
                                        @"biz_content":_biz_content.description?:@"",
                                        @"sign_type":_sign_type?:@"RSA"}];
    
    
    // NOTE: 增加可变部分数据
    if (_format.length > 0) {
        [tmpDict setObject:_format forKey:@"format"];
    }
    
    if (_return_url.length > 0) {
        [tmpDict setObject:_return_url forKey:@"return_url"];
    }
    
    if (_notify_url.length > 0) {
        [tmpDict setObject:_notify_url forKey:@"notify_url"];
    }
    
    if (_app_auth_token.length > 0) {
        [tmpDict setObject:_app_auth_token forKey:@"app_auth_token"];
    }
    
    // NOTE: 排序，得出最终请求字串
    NSArray* sortedKeyArray = [[tmpDict allKeys] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSMutableArray *tmpArray = [NSMutableArray new];
    for (NSString* key in sortedKeyArray) {
        NSString* orderItem = [self orderItemWithKey:key andValue:[tmpDict objectForKey:key] encoded:bEncoded];
        if (orderItem.length > 0) {
            [tmpArray addObject:orderItem];
        }
    }
    return [tmpArray componentsJoinedByString:@"&"];
}

- (NSString*)orderItemWithKey:(NSString*)key andValue:(NSString*)value encoded:(BOOL)bEncoded
{
    if (key.length > 0 && value.length > 0) {
        if (bEncoded) {
            value = [self encodeValue:value];
        }
        return [NSString stringWithFormat:@"%@=%@", key, value];
    }
    return nil;
}

- (NSString*)encodeValue:(NSString*)value
{
    NSString* encodedValue = value;
    if (value.length > 0) {
        NSCharacterSet *charset = [[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"]invertedSet];
        encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:charset];
    }
    return encodedValue;
}

@end
