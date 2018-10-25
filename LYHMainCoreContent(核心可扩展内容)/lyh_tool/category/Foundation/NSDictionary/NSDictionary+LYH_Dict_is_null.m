//
//  NSDictionary+LYH_Dict_is_null.m
//  MHDMX
//
//  Created by lee on 2018/10/22.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "NSDictionary+LYH_Dict_is_null.h"

@implementation NSDictionary (LYH_Dict_is_null)
- (NSDictionary *)deleteNull{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys) {
        if ([[self objectForKey:keyStr] isEqual:[NSNull null]]) {
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else{
            [mutableDic setObject:[self objectForKey:keyStr] forKey:keyStr];
        }
    }
    return mutableDic;
}
@end
