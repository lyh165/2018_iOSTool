//
//  UIView+LYH_UIView_Extension.m
//  LYH_EducationOnLive
//
//  Created by lee on 2018/10/31.
//  Copyright © 2018年 DCloud. All rights reserved.
//

#import "UIView+LYH_UIView_Extension.h"

@implementation UIView (LYH_UIView_Extension)

#pragma mark - 《属性set方法重写》 start
- (CGFloat)frameX
{
    return self.frame.origin.x;
}

- (void)setFrameX:(CGFloat)newX
{
    self.frame = CGRectMake(newX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameY
{
    return self.frame.origin.y;
}

- (void)setFrameY:(CGFloat)newY
{
    self.frame = CGRectMake(self.frame.origin.x, newY, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameWidth
{
    return self.frame.size.width;
}

- (void)setFrameWidth:(CGFloat)newWidth
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newWidth, self.frame.size.height);
}

- (CGFloat)frameHeight
{
    return self.frame.size.height;
}

- (void)setFrameHeight:(CGFloat)newHeight
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newHeight);
}

- (CGPoint)frameOrigin
{
    return self.frame.origin;
}

- (void)setFrameOrigin:(CGPoint)newOrigin
{
    self.frame = CGRectMake(newOrigin.x, newOrigin.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)frameSize
{
    return self.frame.size;
}

- (void)setFrameSize:(CGSize)newSize
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newSize.width, newSize.height);
}

- (CGFloat)boundsX
{
    return self.bounds.origin.x;
}

- (void)setBoundsX:(CGFloat)newX
{
    self.bounds = CGRectMake(newX, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat)boundsY
{
    return self.bounds.origin.y;
}

- (void)setBoundsY:(CGFloat)newY
{
    self.bounds = CGRectMake(self.bounds.origin.x, newY, self.bounds.size.width, self.bounds.size.height);
}

- (CGFloat)boundsWidth
{
    return self.bounds.size.width;
}

- (void)setBoundsWidth:(CGFloat)newWidth
{
    self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, newWidth, self.bounds.size.height);
}

- (CGFloat)boundsHeight
{
    return self.bounds.size.height;
}

- (void)setBoundsHeight:(CGFloat)newHeight
{
    self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, newHeight);
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)newX
{
    self.center = CGPointMake(newX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)newY
{
    self.center = CGPointMake(self.center.x, newY);
}

#pragma mark  《属性set方法重写》 end


// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen
{
    if (self == nil) {
        return FALSE;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    CGRect rect = [self convertRect:self.frame fromView:nil];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return FALSE;
    }
    
    // 若view 隐藏
    if (self.hidden) {
        return FALSE;
    }
    
    // 若没有superview
    if (self.superview == nil) {
        return FALSE;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  FALSE;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return FALSE;
    }
    
    return TRUE;
}
@end
