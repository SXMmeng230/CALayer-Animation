//
//  TestIBView.h
//  CALayerTest
//
//  Created by 小萌 on 2018/7/18.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface TestIBView : UIView
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
@property (nonatomic, strong) IBInspectable UIColor *lineColor;
@end
