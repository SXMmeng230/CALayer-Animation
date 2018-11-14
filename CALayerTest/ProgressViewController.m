//
//  ProgressViewController.m
//  CALayerTest
//
//  Created by 小萌 on 2018/7/18.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"

@interface ProgressViewController ()
@property (nonatomic, strong) ProgressView *progressView;
@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ProgressView *progressView = [[ProgressView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    [self.view addSubview:progressView];
    self.progressView = progressView;
}
- (IBAction)slider:(UISlider *)sender {
    self.progressView.progress = sender.value;
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
