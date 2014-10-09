多点回调类
====================

当你一个委托要回调多个对象时是不是要写多个委托呢？
而用通知又没有委托方便快捷呢？
使用target :selecto又没有安全检查机制呢？

所以，解决方案来了，使用多点回调一切都解决了，
如下使用：

```
@interface HDMessageManageSingleton : NSObject

+ (instancetype)getSingleton;

@property (nonatomic, weak) id<HDMessageManageDelegate> delegate; //引用不加1的多点回调，放心使用

```

```
- (void)setDelegate:(id<HDMessageManageDelegate>)delegate {
    [_callNode pushData:delegate];
}
```

在回调的地方如下

```
 [_callNode callMultiPoint:^(id data) {
                [self callNewMessageDelegate:data obj:obj msgKing:msgKing];
            }];
```

这样delegate就可以同时指向多个对象，同时回调多个对象，效果和IOS的通知一样，但是使用起来比通知更方便，不用在dealloc里移除通知了，这些都是自动了。

