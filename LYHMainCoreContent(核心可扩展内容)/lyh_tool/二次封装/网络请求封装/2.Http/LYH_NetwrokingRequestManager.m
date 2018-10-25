//
//  LYH_NetwrokingRequestManager.m
//  MHDMX
//
//  Created by lee on 2018/10/25.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "LYH_NetwrokingRequestManager.h"

@implementation LYH_NetwrokingRequestManager
+ (void)requestWithType:(RequestType)type urlString:(NSString *)urlString parDic:(NSDictionary *)parDic finish:(RequestFinish)finish error :(RequestError)error {
    LYH_NetwrokingRequestManager *manager = [[LYH_NetwrokingRequestManager alloc] init];
    [manager requestWithType:type urlString:urlString parDic:parDic finish:finish error:error];
}

- (void)requestWithType:(RequestType)type urlString:(NSString*)urlString parDic:(NSDictionary*)parDic finish:(RequestFinish)finish error:(RequestError)error {
    //拿到参数之后进行请求
    NSURL *url = [NSURL URLWithString:urlString];
    //创建可变的URLRequest
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    //如果请求方式是POST需要设置参数和请求方式
    if(type == POST) {
        //设置请求方式
        [urlRequest setHTTPMethod:@"POST"];
        if (parDic.count > 0) {
            NSData *data = [self parDicToDataWithDic:parDic];
            //设置请求参数的Body
            [urlRequest setHTTPBody:data];
        }
    }
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"网络响应 为 %@",response);
        if (response == nil) {
            return ;
        }
        
        if (data) {
            finish(data);
        } else {
            error(connectionError);
        }
        
    }];
}

//把参数字典转为POST请求所需要的参数体
- (NSData *)parDicToDataWithDic:(NSDictionary*)dic {
    NSMutableArray *array = [NSMutableArray array];
    //遍历字典得到的每一个键,得到所有的key = value类型的字符串
    for (NSString *key in dic) {
        NSString *str = [NSString stringWithFormat:@"%@=%@",key,dic[key]];
        [array addObject:str];
    }
    //数组里所有的key=value的字符串通过&符号连接
    NSString *parString = [array componentsJoinedByString:@"&"];
    return [parString dataUsingEncoding:NSUTF8StringEncoding];
}

@end
