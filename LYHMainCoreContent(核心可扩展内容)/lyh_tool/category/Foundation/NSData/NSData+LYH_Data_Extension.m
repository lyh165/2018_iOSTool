//
//  NSData+LYH_Data_Extension.m
//  MHDMX
//
//  Created by lee on 2018/10/25.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "NSData+LYH_Data_Extension.h"

@implementation NSData (LYH_Data_Extension)
- (NSString *)lyh_dataToStr
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}
- (NSMutableString *)lyh_dataToStrM
{
    return [[NSMutableString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)lyh_dataToDict
{
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];//转换数据格式
}
- (NSMutableDictionary *)lyh_dataToDictM
{
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];//转换数据格式
}
- (NSArray *)lyh_dataToArray
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:self];//转换数据格式
}
- (NSMutableArray *)lyh_dataToArrayM
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:self];//转换数据格式
}





@end
