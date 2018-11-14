//
//  CAGradientViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/20.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "CAGradientViewController.h"

@interface CAGradientViewController ()

@end

@implementation CAGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CALayer *baseLayer = [[CALayer alloc] init];
    baseLayer.frame = CGRectMake(100, 200, 200, 200);
    [self.view.layer addSublayer:baseLayer];

    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 180, 180)];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = 10;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.fillColor =[UIColor clearColor].CGColor;
    
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.frame = CGRectMake(0, 0, 200, 200);
    layer.locations = @[@0.1,@0.5,@0.7,@0.9];
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor orangeColor].CGColor];
    
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    layer.mask = shapeLayer;
    [baseLayer addSublayer:layer];
 
    CABasicAnimation *animationn = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animationn.duration = 3;
    animationn.fromValue = 0;
    animationn.toValue =@(2*M_PI);
    animationn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationn.repeatCount = CGFLOAT_MAX;
    animationn.fillMode = kCAFillModeForwards;
    [baseLayer addAnimation:animationn forKey:@"rotate"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
