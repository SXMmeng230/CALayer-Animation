//
//  WaterWaveViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/26.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "WaterWaveViewController.h"
#import "WaterWaveView.h"

@interface WaterWaveViewController ()
@property (nonatomic, strong) WaterWaveView *waveView;

@end

@implementation WaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view from its nib.
    
    WaterWaveView *waveView = [[WaterWaveView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    waveView.backgroundColor = [UIColor blackColor];
    self.waveView = waveView;
    [self.view addSubview:waveView];

    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(add:) userInfo:nil
                                    repeats:YES];
    
    
}
- (void)add:(NSTimer *)timer
{
    self.waveView.precent += 0.01;
    if (self.waveView.precent >= 1) {
        [timer invalidate];
        timer = nil;
    }

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
