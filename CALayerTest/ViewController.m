//
//  ViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/17.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathViewController.h"
#import "ProgressViewController.h"
#import "CALayerViewController.h"
#import "MaskViewViewController.h"
#import "WaterProgressViewController.h"
#import "ReplicatorViewController.h"
#import "CAEmitterViewController.h"
#import "CAGradientViewController.h"
#import "WaterWaveViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)bezier:(UIButton *)sender {
    BezierPathViewController *bezierPahtVC = [[BezierPathViewController alloc] init];
    [self.navigationController pushViewController:bezierPahtVC animated:YES];
}
- (IBAction)progress:(UIButton *)sender {
    ProgressViewController *vc = [[ProgressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)calyer:(UIButton *)sender {
    CALayerViewController *layer = [[CALayerViewController alloc] init];
    [self.navigationController pushViewController:layer animated:YES];
}
- (IBAction)water:(UIButton *)sender {
    WaterProgressViewController *waterVC = [[WaterProgressViewController alloc] init];
    [self.navigationController pushViewController:waterVC animated:YES];
}

- (IBAction)mask:(id)sender {
    MaskViewViewController *maskVC = [[MaskViewViewController alloc] init];
    [self.navigationController pushViewController:maskVC animated:YES];
}
- (IBAction)Replicator:(UIButton *)sender {
    ReplicatorViewController *vc = [[ReplicatorViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)CAEmitter:(UIButton *)sender {
    CAEmitterViewController *vc = [[CAEmitterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)gradie:(UIButton *)sender {
    
    CAGradientViewController *vc = [[CAGradientViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

}
- (IBAction)clickWaterWave:(UIButton *)sender
{
    WaterWaveViewController *vc = [[WaterWaveViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
