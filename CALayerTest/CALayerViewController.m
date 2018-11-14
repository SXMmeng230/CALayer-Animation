//
//  CALayerViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/18.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "CALayerViewController.h"

@interface CALayerViewController ()

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //阴影
    UIView *shaowView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    shaowView.backgroundColor = [UIColor whiteColor];
    shaowView.layer.shadowColor = [UIColor redColor].CGColor;
//    shaowView.layer.shadowRadius = 10;
    shaowView.layer.shadowOpacity = 0.5;
    shaowView.layer.shadowOffset = CGSizeZero;//清除默认值
    CGFloat shaowWidth = 3;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(-shaowWidth * 0.5, -shaowWidth *0.5, 100 +  shaowWidth, 100 +  shaowWidth)];
    shaowView.layer.shadowPath = path.CGPath;
    shaowView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"11"].CGImage);
    [self.view addSubview:shaowView];
    
    //旋转
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 =  -1.0 / 800;
    shaowView.layer.transform = CATransform3DRotate(trans, M_PI_4, 1, 0, 0);
    
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
