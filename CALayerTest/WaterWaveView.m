//
//  WaterWaveView.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/27.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "WaterWaveView.h"
@interface WaterWaveView()


//y=Asin(ωx+φ)+k和y=Acos(ωx+φ)+k

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, assign) CGFloat waveAmplitude;

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;


@property (nonatomic, assign) BOOL increase;
@property (nonatomic, assign) CGFloat variable;
@property (nonatomic, assign) CGFloat offsetX;

@property (nonatomic, assign) CGFloat currentWavePointY;    // 当前波浪高度，k


@end
@implementation WaterWaveView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.currentWavePointY = self.frame.size.height * (1-self.precent);
    self.waveAmplitude = 8;
    self.variable = 1.6;
    self.increase = NO;
 
    [self initGradientLayer];
    [self startWave];
}
- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [[CAShapeLayer alloc] init];
        _shapeLayer.strokeColor = [UIColor blueColor].CGColor;
        _shapeLayer.fillColor = [UIColor redColor].CGColor;
    }
    return _shapeLayer;
}

- (void)initGradientLayer
{
    _gradientLayer = [[CAGradientLayer alloc] init];
    _gradientLayer.frame = CGRectMake(0,self.currentWavePointY, self.bounds.size.width, self.bounds.size.height-self.currentWavePointY);
    _gradientLayer.locations = @[@0.5,@1];
    _gradientLayer.startPoint = CGPointMake(0.5, 0);
    _gradientLayer.endPoint = CGPointMake(0.5, 1);
    _gradientLayer.colors = @[(__bridge id)([UIColor redColor].CGColor),(__bridge id)([UIColor greenColor].CGColor)];
    self.gradientLayer.mask = self.shapeLayer;
    [self.layer addSublayer:self.gradientLayer];
}
- (void)currentWave:(CADisplayLink *)timer
{
    
    [self increaseVare];
    self.offsetX += 0.3 / M_PI;
    [self drawWaterWave];
}

- (void)setPrecent:(CGFloat)precent
{
    if (_precent != precent) {
        _precent = precent;
    }
    if (_precent<=0.2) {
        _precent = 0.2;
    }
    [self resetLayer];
}
- (void)resetLayer
{
    self.currentWavePointY = self.frame.size.height * (1-self.precent);
    _gradientLayer.frame = CGRectMake(0,self.currentWavePointY, self.bounds.size.width, self.bounds.size.height-self.currentWavePointY);
}
- (void)stopWave
{
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
  
}
- (void)startWave
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(currentWave:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

}
- (void)increaseVare
{
    if (self.increase) {
        self.variable += 0.05;
    }else{
        self.variable -= 0.05;
    }
    if (self.variable <= 1) {
        self.increase = YES;
    }
    if (self.variable >=1.6) {
        self.increase = NO;
    }
    self.waveAmplitude = self.variable * 5;
}
- (void)drawWaterWave
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0,20)];
    for (int i = 0; i < self.bounds.size.width; i ++) {
        CGFloat x = i / (self.bounds.size.width) *  M_PI * 2;
        CGFloat y = 20 +  (self.waveAmplitude * sin(x * 2 + self.offsetX));
        [path addLineToPoint:CGPointMake(i, y)];
      }
    
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.gradientLayer.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.gradientLayer.frame.size.height)];
    [path closePath];
    self.shapeLayer.path = path.CGPath;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
