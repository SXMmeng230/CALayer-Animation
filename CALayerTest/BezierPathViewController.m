//
//  BezierPathViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/17.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "BezierPathViewController.h"
#import "BezierView.h"
#import "PieChartView.h"

@interface BezierPathViewController ()

@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    /*
    BezierView *bezierView = [[BezierView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:bezierView];
     */
    PieChartView *chartView = [[PieChartView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:chartView];
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
