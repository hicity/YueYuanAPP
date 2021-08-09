//
//  AppDelegate.m
//  YueYuanAPP
//
//  Created by xiaoyu on 2021/8/7.
//

#import "AppDelegate.h"
#import "LZBBaseTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    [self addKeyboardManager];
    [self entryMainVC];
    
    
    EMOptions *options = [EMOptions optionsWithAppkey:@"appkey"];
    // apnsCertName是证书名称，可以先传nil，等后期配置apns推送时在传入证书名称
        options.apnsCertName = nil;
        [[EMClient sharedClient] initializeSDKWithOptions:options];
        return YES;
    
    [[EMClient sharedClient] loginWithUsername:@"user1" password:@"123" completion:^(NSString *aUsername, EMError *aError) {
        if (!aError) {
            NSLog(@"登录成功");
        } else {
            NSLog(@"登录失败的原因---%@", aError.errorDescription);
        }
    }];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}


#pragma mark - KeyboardManager
- (void)addKeyboardManager {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = NO;
    manager.toolbarTintColor = [UIColor redColor];
    //是否显示工具条
    manager.enableAutoToolbar = YES;
    [manager setToolbarManageBehaviour:IQAutoToolbarByPosition];
}

- (void)entryMainVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LZBBaseTabBarController *view = [storyboard instantiateViewControllerWithIdentifier:@"LZBBaseTabBarController"];
    self.window.rootViewController = view;
}



//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}

// MARK: - 全局 禁用第三方键盘
- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(UIApplicationExtensionPointIdentifier)extensionPointIdentifier {
    // 1. UIApplicationKeyboardExtensionPointIdentifier
    // 2. @"com.apple.keyboard-service"
    // 应该是一样的
    if ([extensionPointIdentifier isEqualToString:UIApplicationKeyboardExtensionPointIdentifier] )
        return NO;
    return YES;
}

@end
