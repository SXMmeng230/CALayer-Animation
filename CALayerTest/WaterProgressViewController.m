//
//  WaterProgressViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/19.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "WaterProgressViewController.h"
#import "WaterProgressView.h"
#import "HollowOutView.h"

@interface WaterProgressViewController ()
@property (nonatomic, strong) WaterProgressView *progressView;
@end

@implementation WaterProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.progressView];
        
    HollowOutView *outView = [[HollowOutView alloc] initWithFrame:CGRectMake(100, 400, 200, 200)];
    [self.view addSubview:outView];
}
- (WaterProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[WaterProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    }
    return _progressView;
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
