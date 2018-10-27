//
//  NSArray+LYH_NSArray_Extension.h
//  MHDMX
//
//  Created by lee on 2018/10/26.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LYH_NSArray_Extension)
/**
 *  转换成JSON串字符串（没有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)lyh_ArrayToJSONString;

/**
 *  转换成JSON串字符串（有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)lyh_ArrayToReadableJSONString;

/**
 *  转换成JSON数据
 *
 *  @return JSON数据
 */
- (NSData *)lyh_ArrayToJSONData;
@end
