//
//  MaskViewViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/19.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "MaskViewViewController.h"

@interface MaskViewViewController ()
@property (nonatomic, strong) UIImageView *maskImageView;
@end

@implementation MaskViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.maskImageView];
    [self drawMaskView];
    
}
- (void)drawMaskView
{
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.position = CGPointMake(150, 150);
    layer.bounds = CGRectMake(0, 0, 50, 50);
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"logo"].CGImage);
    
    self.maskImageView.layer.mask = layer;

    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    keyAni.duration = 5;
    keyAni.values = @[[NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)],[NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)],[NSValue valueWithCGRect:CGRectMake(0, 0, 1000, 1000)]];
    keyAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyAni.removedOnCompletion = NO;
    keyAni.fillMode = kCAFillModeForwards;
    [layer addAnimation:keyAni forKey:@"bounds"];


}
- (UIImageView *)maskImageView
{
    if (!_maskImageView) {
        _maskImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _maskImageView.center = self.view.center;
        _maskImageView.image = [UIImage imageNamed:@"11"];
    }
    return _maskImageView;
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
