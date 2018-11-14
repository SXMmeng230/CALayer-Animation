//
//  CAEmitterViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/20.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "CAEmitterViewController.h"

@interface CAEmitterViewController ()

@end

@implementation CAEmitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.name = @"emitterCell";
    cell.alphaRange = 0.1;
    cell.alphaSpeed = -0.1;
    cell.lifetime = 3;
    cell.lifetimeRange = 0.3;
    cell.birthRate = 2000;
    cell.velocity = 80;
    cell.velocityRange = 50;
    cell.scale = 0.04;
    cell.scaleRange = 0.02;
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"sparkle"].CGImage);
    
    CAEmitterCell *cellStar = [[CAEmitterCell alloc] init];
    cellStar.name = @"emitterCellStar";
    cellStar.alphaRange = 0.1;
    cellStar.alphaSpeed = -0.1;
    cellStar.lifetime = 3;
    cellStar.lifetimeRange = 0.3;
    cellStar.birthRate = 100;
    cellStar.velocity = 50;
    cellStar.velocityRange = 20;
    cellStar.scale = 0.2;
    cellStar.scaleRange = 0.5;
    cellStar.contents = (__bridge id _Nullable)([UIImage imageNamed:@"DazStarOutline"].CGImage);
    cellStar.color = [UIColor blueColor].CGColor;

    
    
    CAEmitterLayer *emitterLayer = [[CAEmitterLayer alloc] init];
    /*发射源包含的粒子*/
    emitterLayer.emitterCells = @[cell,cellStar];
    /*发射源大小*/
    emitterLayer.emitterSize = CGSizeMake(5, 5);
    emitterLayer.lifetime = 2;
    /*发射源形状:
     kCAEmitterLayerPoint 点
     kCAEmitterLayerLine 线
     kCAEmitterLayerRectangle 矩形
     kCAEmitterLayerCuboid 长方形
     kCAEmitterLayerCircle 圆
     kCAEmitterLayerSphere 球形
*/
    emitterLayer.emitterShape = kCAEmitterLayerSphere;
    /*发射模式：
     kCAEmitterLayerPoints //点状
     kCAEmitterLayerOutline //轮廓
     kCAEmitterLayerSurface //表面
     kCAEmitterLayerVolume //大量
     */
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    
    emitterLayer.renderMode = kCAEmitterLayerOldestLast;
    emitterLayer.zPosition = -1;
    emitterLayer.position = self.view.center;
    
    [self.view.layer addSublayer:emitterLayer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //停止粒子发射
        emitterLayer.birthRate = 0;
    });
    
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
