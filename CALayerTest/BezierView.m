//
//  BezierView.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/17.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    [self creatLines];
    [self creatSqure];
}
- (void)creatLines
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 100)];
    [path addLineToPoint:CGPointMake(100, 200)];
    
    [path moveToPoint:CGPointMake(50, 300)];
    [path addLineToPoint:CGPointMake(100, 200)];

    
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapRound;
    [path stroke];
}
- (void)creatSqure
{
    //矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 200, 100, 100)];
    //圆角矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 200, 200, 200) cornerRadius:20];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 200, 200, 200) byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomRight) cornerRadii:CGSizeMake(20, 20)];
//    [[UIColor redColor] setStroke];
    //椭圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 200, 200, 100)];
    //画圆弧
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 300) radius:100 startAngle:0 endAngle:3 * M_PI/4 clockwise:YES];
    //扇形
    /*
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 300) radius:100 startAngle:-M_PI/4 endAngle:M_PI / 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(200, 300)];
    [path closePath];
     [path fill];
     */
    [path fill];
}

@end
