//
//  HDMultiPointCallNode.h
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


#import <Foundation/Foundation.h>

/**
 *  不retain计数的多点回调
 */
@interface HDMultiPointCallNode : NSObject

/**
 *  加入委托对象
 *
 *  @param data delegate对象
 */
- (void)pushData:(id)data;

/**
 *  把delegate从回调队列里移除
 *
 *  @param index 索引
 */
- (void)popIndex:(NSInteger)index;

/**
 *  把delegate从回调队列里移除
 *
 *  @param data 对象实例
 */
- (void)popData:(id)data;

/**
 *  多点回调
 *
 *  @param block 需要回调的delegate
 */
- (void)callMultiPoint:(void (^)(id data))block;

@end
