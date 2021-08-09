//
//  MYMainMacro.h
//  MeiYuanProject
//
//  Created by 约牛 on 2021/8/4.
//

#ifndef MYMainMacro_h
#define MYMainMacro_h

#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define kScreenBounds   [UIScreen mainScreen].bounds
#define kScreenWidth    kScreenBounds.size.width
#define kScreenHeight   kScreenBounds.size.height

// 日记输出宏
#ifdef DEBUG // 调试状态, 打开LOG功能
    #define XLDLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
    #define XLDLog(...)
#endif

#ifndef IMAGE_NAMED
    #define IMAGE_NAMED(__imageName__)\
    [UIImage imageNamed:__imageName__]
#endif

#ifndef SYSTEM_FONT
    #define SYSTEM_FONT(__fontsize__)\
    [UIFont lzb_fontForPingFangSC_RegularFontOfSize:__fontsize__]
#endif

#ifndef BOLD_FONT
    #define BOLD_FONT(__fontsize__)\
    [UIFont lzb_fontForPingFangSC_SemiboldFontOfSize:__fontsize__]
#endif


#define SDUserDefaults                  [NSUserDefaults standardUserDefaults]

#define SDUserDefaultsSync              [SDUserDefaults synchronize]

#define GETUSER_VALUE(key)              [SDUserDefaults valueForKey:key]
#define GETUSER_OBJ(key)                [SDUserDefaults objectForKey:key]
#define GETUSER_BOOL(key)               [SDUserDefaults boolForKey:key]
#define GETUSER_INT(key)                [SDUserDefaults integerForKey:key]
#define GETUSER_DOUBLE(key)             [SDUserDefaults doubleForKey:key]
#define GETUSER_STRING(key)             [SDUserDefaults stringForKey:key]
#define GETUSER_ARRAY(key)              [SDUserDefaults arrayForKey:key]
#define GETUSER_DICT(key)               [SDUserDefaults dictionaryForKey:key]
#define GETUSER_DATA(key)               [SDUserDefaults dataForKey:key]
#define GETUSER_URL(key)                [SDUserDefaults URLForKey:key]


#define SETUSER_VALUE(key, value)       [SDUserDefaults setValue:value forKey:key]
#define SETUSER_OBJ(key, value)         [SDUserDefaults setObject:value forKey:key]
#define SETUSER_BOOL(key, value)        [SDUserDefaults setBool:value forKey:key]
#define SETUSER_INT(key, value)         [SDUserDefaults setInteger:value forKey:key]
#define SETUSER_DOUBLE(key, value)      [SDUserDefaults setDouble:value forKey:key]
#define SETUSER_URL(key, value)         [SDUserDefaults setURL:value forKey:key]

#define REMOVEUSER_OBJ(key)             [SDUserDefaults removeObjectForKey:key]



#endif /* MYMainMacro_h */
