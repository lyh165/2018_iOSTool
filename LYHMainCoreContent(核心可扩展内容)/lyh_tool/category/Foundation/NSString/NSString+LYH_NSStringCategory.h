//
//  NSString+LYH_NSStringCategory.h
//  LYH_EducationOnLive
//
//  Created by lee on 2018/8/23.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LYH_NSStringCategory)
- (NSDictionary *)lyh_jsonStr2Dict; // 字符串json 转 字典
- (id)lyh_jsonStr2ArrOrDict;        // 字符串json 转 字典 数组
-(UIImage *)Base64StrToUIImage;     // 字符串 转 UIimage
@end
