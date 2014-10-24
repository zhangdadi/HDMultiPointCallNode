//
//  HDMultiPointCallNode.m
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-8-11.
//  Copyright (c) 2014年 YH. All rights reserved.
//
//  若发现bug请致电:z_dadi@163.com,在此感谢你的支持。
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "HDMultiPointCallNode.h"

@interface HDMultiPointCallNode ()
@property (nonatomic, weak) id data;
@property (nonatomic, strong) HDMultiPointCallNode *next;

@end

@implementation HDMultiPointCallNode

- (void)pushData:(id)data {
    [self popData:data];
    HDMultiPointCallNode *head = self;
    while (head.next != nil) {
        head = head.next;
    }
    
    HDMultiPointCallNode *newNode = [[HDMultiPointCallNode alloc] init];
    newNode.data                  = data;
    head.next                     = newNode;
}

- (void)popData:(id)data {
    HDMultiPointCallNode *head = self;
    HDMultiPointCallNode *temp = self.next;
    
    while (head.next != nil) {
        if (data == temp.data) {
            head.next = temp.next;
            temp.data = nil;
            temp      = nil;
        }
        head = head.next;
        temp = temp.next;
    }
}

- (void)popIndex:(NSInteger)index {
    HDMultiPointCallNode *head = self;
    HDMultiPointCallNode *temp = self.next;
    
    for (int i = 0; head.next != nil && i <= index; ++i, head = head.next, temp = temp.next) {
        if (i == index) {
            head.next = temp.next;
            temp.data = nil;
            temp      = nil;
        }
    }
}

- (void)callMultiPoint:(void (^)(id data))block {
    HDMultiPointCallNode *head = self;
    
    for (int i = 0; head.next != nil; ++i) {
        head = head.next;
        if (head.data != nil) {
            block(head.data);
        } else {
            [self popIndex:i--];
        }
    }
}

@end
