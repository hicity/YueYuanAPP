//
//  YYBaseViewController.h
//  YueYuanAPP
//
//  Created by 约牛 on 2021/8/9.
//

#import <UIKit/UIKit.h>
#import "LZBNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYBaseViewController : UIViewController

@property (nonatomic, strong) LZBNavigationBar *navView;
///  子类调用改方法 默认
/// @param str title 字符串 navView.hidden = NO
- (void)mt_showNavigationTitle:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
