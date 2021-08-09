//
//  YYBaseViewController.m
//  YueYuanAPP
//
//  Created by 约牛 on 2021/8/9.
//

#import "YYBaseViewController.h"

@interface YYBaseViewController ()

@end

@implementation YYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.view.backgroundColor = KMAINFFFF;
    // 禁用系统导航栏
    self.fd_prefersNavigationBarHidden = YES;
    
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
    ///适配ScrollView 偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    ///添加自定义导航
    [self.view addSubview:self.navView];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /// 隐藏系统导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


///  子类调用改方法 默认
/// @param str title 字符串 navView.hidden = NO
- (void)mt_showNavigationTitle:(NSString *)str {
    self.navView.hidden = NO;
    self.navView.titleLab.text = str;
}


- (LZBNavigationBar *)navView {
    if (!_navView) {
        _navView = [LZBNavigationBar new];
        _navView.hidden = YES;
    }
    return _navView;
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
