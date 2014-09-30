//
//  HDMessageManageSingleton.h
//  demo
//
//  Created by 张达棣 on 14-9-30.
//  Copyright (c) 2014年 YH. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HDMessageManageSingleton;

@protocol HDMessageManageDelegate <NSObject>
@optional

//发送消息结果回调
- (void)HDSendMessageFinish:(BOOL)isSucceed;

@end


@interface HDMessageManageSingleton : NSObject

+ (instancetype)getSingleton;
@property (nonatomic, weak) id<HDMessageManageDelegate> delegate;

//发消息
- (void)sendTextMessage:(NSString *)text;

/**
 *  手动移除回调（有自动移除机制，当delegate指向的对象已被释放时，会自动移除）.
 *
 *  @param deleaget 回调对象
 */
- (void)removeCall:(id<HDMessageManageDelegate>) deleaget;

@end
