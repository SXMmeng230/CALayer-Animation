//
//  PieChartView.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/17.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "PieChartView.h"

@implementation PieChartView
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSArray *arrValue = @[@(10),@(10),@(5),@(25),@(90)];
    CGFloat sumValue = [[arrValue valueForKeyPath:@"@sum.floatValue"] floatValue];

    CGPoint point = CGPointMake(200, 200);
    CGFloat radio = 100;
    CGFloat startArc = 0;
    for (int i = 0; i < arrValue.count; i ++) {
        CGFloat value = [arrValue[i] floatValue];
        CGFloat endArc = M_PI*2*value/sumValue + startArc;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radio startAngle:startArc endAngle:endArc clockwise:YES];
        [path addLineToPoint:point];
        UIColor *color = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:(arc4random_uniform(256) / 255.0)];
        [color setFill];
        [path closePath];
        
//        CGFloat dash[] ={
//            2.0,
//            4.0,
//            5.0
//        };
//        [path setLineDash:dash count:3 phase:0];
        [path fill];

        startArc = endArc;
    }
}


@end
