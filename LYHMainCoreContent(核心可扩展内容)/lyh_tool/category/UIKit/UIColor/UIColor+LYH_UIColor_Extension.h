// 技术参考 https://www.jianshu.com/p/79e4dd8a44bc
// 工具使用 https://tool.css-js.com/rgba.html
#import <UIKit/UIKit.h>
@interface UIColor (LYH_UIColor_Extension)

/**
 16进制 转 UIColor
 @param hexadecimalColor 16进制的Color 字符串 例如:
 @return UIColor
 */
+ (UIColor *) lyh_hexadecimalColor2Color: (NSString *)hexadecimalColor;
@end
