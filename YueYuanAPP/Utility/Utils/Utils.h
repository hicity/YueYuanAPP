//
//  Utils.h
//  LZBProject
//
//  Created by hicity on 2019/10/23.
//  Copyright © 2019 hicity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface Utils : NSObject

+ (instancetype)sharedInstance;
/**
 *  保存当前用户Token
 */
+ (void)saveUserToken:(NSString *)token;
/**
 *  加载前用户Token
 */
+ (NSString *)loadUserToken;

/// 删除当前用户Token
+ (void)removeUserToken;

/// 保存用户信息
/// @param userInfoDic 后台返回数据
+ (void)saveUserInfo:(NSDictionary *)userInfoDic;

/// 获取用户信息
+ (NSDictionary *)loadUserInfo;

@end

NS_ASSUME_NONNULL_END
