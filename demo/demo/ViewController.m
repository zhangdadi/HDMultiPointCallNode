//
//  ViewController.m
//  demo
//
//  Created by 张达棣 on 14-9-30.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import "ViewController.h"
#import "HDMessageManageSingleton.h"

@interface classA : NSObject <HDMessageManageDelegate>

@end

@implementation classA

- (void)HDSendMessageFinish:(BOOL)isSucceed {
    NSLog(@"classA回调HDSendMessageFinish");
}


@end

@interface classB : NSObject <HDMessageManageDelegate>

@end

@implementation classB

- (void)HDSendMessageFinish:(BOOL)isSucceed {
    NSLog(@"classB回调HDSendMessageFinish");
}


@end


@interface ViewController () <HDMessageManageDelegate>
{
    classA *_a;
    classB *_b;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _a = [[classA alloc] init];
    _b = [[classB alloc] init];
    
    [HDMessageManageSingleton getSingleton].delegate = self;
    [HDMessageManageSingleton getSingleton].delegate =_b;
	
}
- (IBAction)buttonClick:(id)sender {
    [HDMessageManageSingleton getSingleton].delegate = _a;
    [[HDMessageManageSingleton getSingleton] sendTextMessage:@"消息"];
}

- (IBAction)removeAButtonClick:(id)sender {
    [[HDMessageManageSingleton getSingleton] removeCall:_a];
    [[HDMessageManageSingleton getSingleton] sendTextMessage:@"消息"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)HDSendMessageFinish:(BOOL)isSucceed {
    NSLog(@"ViewController回调HDSendMessageFinish");
}

@end
