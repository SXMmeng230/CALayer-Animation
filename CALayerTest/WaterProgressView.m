//
//  WaterProgressView.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/19.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "WaterProgressView.h"
@interface WaterProgressView()
@property (nonatomic, strong) CAShapeLayer *lightLayer;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@property (nonatomic, strong) UILabel *progressLabel;

@end
@implementation WaterProgressView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.progressLabel];
        [self initLightBezi];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(progressUpdate:) userInfo:nil repeats:YES];
    }
    return self;
}
- (void)progressUpdate:(NSTimer *)timer
{
    if (self.progressLayer.strokeEnd <= 1) {
        self.progressLayer.strokeEnd += 0.01;
        self.progressLabel.text = [NSString stringWithFormat:@"已使用%.f%%流量",self.progressLayer.strokeEnd * 100];
    }else{
        [timer invalidate];
        timer = nil;
    }
}
- (void)initLightBezi
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.lightLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    self.lightLayer.lineWidth = 10;
    self.lightLayer.fillColor = [UIColor clearColor].CGColor;
    self.lightLayer.path = path.CGPath;
    [self.layer addSublayer:self.lightLayer];
    
    
    self.progressLayer.strokeColor = [UIColor redColor].CGColor;
    self.progressLayer.lineWidth = 10;
    self.progressLayer.strokeStart = 0;
    self.progressLayer.strokeEnd = 0;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.path = path.CGPath;
    [self.layer addSublayer:self.progressLayer];
    
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
- (CAShapeLayer *)lightLayer
{
    if (!_lightLayer) {
        _lightLayer = [[CAShapeLayer alloc] init];
        _lightLayer.frame = self.bounds;
    }
    return _lightLayer;
}
- (CAShapeLayer *)progressLayer
{
    if (!_progressLayer) {
        _progressLayer = [[CAShapeLayer alloc] init];
        _progressLayer.frame = self.bounds;
    }
    return _progressLayer;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
