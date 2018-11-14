//
//  HollowOutView.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/19.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "HollowOutView.h"
@interface HollowOutView()

@end

@implementation HollowOutView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self drawHollowOutView];
    }
    return self;
}
- (void)drawHollowOutView
{
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    //边框圆角
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10];
    //空心圆
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.bounds.size.width - 40, self.bounds.size.height -40)];
    [path appendPath:roundPath];
    layer.path = path.CGPath;
    layer.fillRule = kCAFillRuleEvenOdd;
    layer.fillColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:layer];
    
    
    CAShapeLayer *roundLayer = [[CAShapeLayer alloc] init];

    UIBezierPath *piePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5) radius:(self.bounds.size.width - 40 - 20) *0.5 startAngle:0 endAngle:M_PI * 2 *3 /4 clockwise:YES];
    [piePath addLineToPoint:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5)];
    roundLayer.path = piePath.CGPath;
    roundLayer.fillColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:roundLayer];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
