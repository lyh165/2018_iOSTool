//
//  NSData+LYH_Data_Extension.h
//  MHDMX
//
//  Created by lee on 2018/10/25.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LYH_Data_Extension)
// ⚠️这里在block里面使用可能会出现野指针错误,还没解决。如果block里面使用只能临时使用内部代码解析

// str
- (NSString *)lyh_dataToStr;
- (NSMutableString *)lyh_dataToStrM;

//dict
- (NSDictionary *)lyh_dataToDict;
- (NSMutableDictionary *)lyh_dataToDictM;


// array
- (NSArray *)lyh_dataToArray;
- (NSMutableArray *)lyh_dataToArrayM;
@end
