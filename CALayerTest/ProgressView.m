//
//  ProgressView.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/18.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "ProgressView.h"
@interface ProgressView()
@property (nonatomic, strong) UILabel *progressLabel;
@end
@implementation ProgressView
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.progressLabel];
    }
    return self;
}
- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _progressLabel.textColor = [UIColor blackColor];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.font = [UIFont systemFontOfSize:15];
    }
    return _progressLabel;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //扇形1
    /*
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat startAngle = -M_PI / 2;
    CGFloat endAngle = M_PI * 2 * self.progress + startAngle;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.bounds.size.width * 0.5 startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor redColor] setFill];
    [path closePath];
    [path fill];
     */
    //扇形2 水满形状
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat startAngle = M_PI / 2 - M_PI * 2 * self.progress * 0.5;
    CGFloat endAngle = M_PI * 2 * self.progress + startAngle;
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:self.bounds.size.width * 0.5 - 5 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [[UIColor redColor] set];
    [path1 stroke];

    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.bounds.size.width * 0.5 - 5 startAngle:startAngle endAngle:endAngle clockwise:YES];
    [[UIColor redColor] setFill];
    [path fill];
}
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    [self setNeedsDisplay];
}

@end
