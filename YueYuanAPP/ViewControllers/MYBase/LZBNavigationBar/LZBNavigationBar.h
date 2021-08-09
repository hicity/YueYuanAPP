//
//  LZBNavigationBar.h
//  LZBProject
//
//  Created by liyan on 2019/11/9.
//  Copyright © 2019 hicity. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZBNavigationBar : UIView

///返回按钮
@property (nonatomic, strong) UIButton *backBtn;

///标题
@property (nonatomic, strong) UILabel *titleLab;

///自定义返回事件
@property (nonatomic, copy) void(^leftCallBack)(void);

@end

NS_ASSUME_NONNULL_END
