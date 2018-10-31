// 参考 https://blog.csdn.net/wangyurui_wyr/article/details/52330516
#import <UIKit/UIKit.h>

@interface UIViewController (LYH_UIViewController_Extension)

#pragma mark - UI部分

/**
 渐变提示框

 @param frame 控件的frame
 @param color 提示框的背景颜色
 @param tColor 提示框文字的颜色
 @param msg 提示框的显示文字
 @param duration 提示框持续的时间长
 */
- (void)showAlertViewWithFrame:(CGRect)frame
                     alertView:(UIColor *)color
                showTitleColor:(UIColor *)tColor
                       message:(NSString *)msg
                      duration:(NSInteger)duration;
@end
