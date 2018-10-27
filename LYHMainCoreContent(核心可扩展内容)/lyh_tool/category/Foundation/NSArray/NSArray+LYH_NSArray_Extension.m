//
//  NSArray+LYH_NSArray_Extension.m
//  MHDMX
//
//  Created by lee on 2018/10/26.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "NSArray+LYH_NSArray_Extension.h"

@implementation NSArray (LYH_NSArray_Extension)
- (NSString *)lyh_ArrayToJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
    
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

- (NSString *)lyh_ArrayToReadableJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

- (NSData *)lyh_ArrayToJSONData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    return data;
}
@end
