//
//  ReplicatorViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/20.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "ReplicatorViewController.h"

@interface ReplicatorViewController ()
@end

@implementation ReplicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(50, 300, 10, 80);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.duration = 0.5;
    animation.toValue = @(0.1);
    animation.autoreverses = YES;
    animation.repeatCount = CGFLOAT_MAX;

    [layer addAnimation:animation forKey:@""];
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    //复制的个数
    replicatorLayer.instanceCount = 6;
    //相对于前一个的变换

    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
//    replicatorLayer.instanceTransform = CATransform3DConcat(CATransform3DMakeTranslation(15, 0, 0), CATransform3DMakeRotation(-M_PI / 18, 0, 0, 1));
//    replicatorLayer.instanceTransform = CATransform3DMakeRotation(-M_PI / 18, 0, 0, 1);

    
    //相对于前一个图层延时多久
    replicatorLayer.instanceDelay = 0.1;
    //图层颜色
    replicatorLayer.instanceColor = [UIColor greenColor].CGColor;
    //颜色相对于前一个图层渐变
    replicatorLayer.instanceRedOffset = -0.2;
    replicatorLayer.instanceBlueOffset = -0.2;
    replicatorLayer.instanceGreenOffset = -0.2;
    //把显示的图层加到复制层中，复制层自动复制
    [replicatorLayer addSublayer:layer];
    //把复制层添加到图层进行显示
    [self.view.layer addSublayer:replicatorLayer];
    
    
    
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
