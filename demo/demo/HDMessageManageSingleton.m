//
//  HDMessageManageSingleton.m
//  demo
//
//  Created by 张达棣 on 14-9-30.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import "HDMessageManageSingleton.h"
#import "HDMultiPointCallNode.h"

@interface HDMessageManageSingleton ()
{
    HDMultiPointCallNode * _callNode;
}

@end

@implementation HDMessageManageSingleton

+ (instancetype)getSingleton {
    static HDMessageManageSingleton *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
         _callNode = [[HDMultiPointCallNode alloc] init];
    }
    return self;
}

- (void)setDelegate:(id<HDMessageManageDelegate>)delegate {
    [_callNode pushData:delegate];
}

- (void)sendTextMessage:(NSString *)text {
    
    NSLog(@"开始发消息，3秒后回调");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"开始回调");
        [_callNode callMultiPoint:^(id data) {
            [data HDSendMessageFinish:YES];
        }];
    });
    
}

- (void)removeCall:(id<HDMessageManageDelegate>) deleaget {
    [_callNode popData:deleaget];
}

@end
