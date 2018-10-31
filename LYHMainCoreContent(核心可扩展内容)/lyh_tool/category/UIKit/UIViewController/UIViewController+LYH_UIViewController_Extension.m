//
//  UIViewController+LYH_UIViewController_Extension.m
//  MHDMX
//
//  Created by lee on 2018/10/27.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "UIViewController+LYH_UIViewController_Extension.h"

@implementation UIViewController (LYH_UIViewController_Extension)
- (void)showAlertViewWithFrame:(CGRect)frame
                     alertView:(UIColor *)color
                showTitleColor:(UIColor *)tColor
                       message:(NSString *)msg
                      duration:(NSInteger)duration
{
    UILabel *tiplabel = [[UILabel alloc]initWithFrame:frame];
    //设置提示内容
    [tiplabel setText:msg];
    tiplabel.backgroundColor = color;
    tiplabel.layer.cornerRadius=5;
    tiplabel.layer.masksToBounds = YES;
    tiplabel.numberOfLines = 0;
    tiplabel.textAlignment = NSTextAlignmentCenter;
    tiplabel.textColor = tColor;
    [self.view addSubview:tiplabel];
    
    //设置时间和动画效果
    [UIView animateWithDuration:duration animations:^{
        tiplabel.alpha =0.0;
    } completion:^(BOOL finished) {
        //
        [tiplabel removeFromSuperview];
    }];
}
@end
