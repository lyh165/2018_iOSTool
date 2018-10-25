//
//  CALayer+LYH_XibBorderColor.m
//  MHDMX
//
//  Created by lee on 2018/10/20.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "CALayer+LYH_XibBorderColor.h"
#import <UIKit/UIKit.h>
@implementation CALayer (LYH_XibBorderColor)
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end
