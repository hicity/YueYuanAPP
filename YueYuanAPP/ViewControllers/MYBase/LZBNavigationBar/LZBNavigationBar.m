//
//  LZBNavigationBar.m
//  LZBProject
//
//  Created by liyan on 2019/11/9.
//  Copyright © 2019 hicity. All rights reserved.
//

#import "LZBNavigationBar.h"

@interface LZBNavigationBar()


@end

@implementation LZBNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self mt_loadUI];
    }
    return self;
}


- (void)mt_loadUI {
    self.backgroundColor = kMAIN31AC;
    self.frame = CGRectMake(0, 0, kScreenWidth, iPhoneX?44:20 + 44);
    ///添加标题
    [self addSubview:self.titleLab];
    ///添加返回按钮
    [self addSubview:self.backBtn];
}


///MARK:- Event API
- (void)mt_backEvent {
    if (self.leftCallBack) {
        self.leftCallBack();
        return;
    }
    
    UIViewController *vc = [UIViewController mt_currentViewController];
    
    if ([vc.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [vc.navigationController popViewControllerAnimated:YES];
    }
    
    if ([vc respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
        [vc dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}



///MARK:- Getter and Setter
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] init];
        _backBtn.frame = CGRectMake(0, iPhoneX?44:20, 65, 44);
        [_backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
        _backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -11, 0, 11);
        [_backBtn addTarget:self action:@selector(mt_backEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(60, iPhoneX?44:20, kScreenWidth - 120, 44);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.font = LZBMediumFont(17);
        _titleLab.textColor = [UIColor whiteColor];
    }
    return _titleLab;
}

@end
