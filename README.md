# CLUIKit


[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/CLUIKit.svg)](https://img.shields.io/cocoapods/v/CLUIKit.svg) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Platform](https://img.shields.io/cocoapods/p/CLUIKit.svg?style=flat)](http://cocoadocs.org/docsets/CLUIKit) [![Language](https://img.shields.io/badge/language-ObjC-blue.svg)](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)

## CLUIKit简介

`CLUIKit`是对系统`UIKit API`进行扩展, 以及一些自己封装的`UI`, `API`的用法全部都在`CLUIKitExample`里, 如果在使用库遇到的一些疑惑欢迎随时`Issues`给我.

支持`CocoaPod`管理

> pod 'CLUIKit'

## 目录
- [CLButton@](#CLButton)
- [CLCollectionViewController@](#CLCollectionViewController)
  - [UICollectionView与MJRefresh@](#UICollectionView与MJRefresh)
  - [UICollectionView代理与数据源@](#代理与数据源)
  - [注册类@](#注册类)
- [CLCollectionViewViewModel@](#CLCollectionViewViewModel)
- [CLCollectionViewDelegate@](#CLCollectionViewDelegate)
- [CLCollectionViewDataSource@](#CLCollectionViewDataSource)
- [CLNavigationController@](#CLNavigationController)
- [CLScanQRCodeController@](#CLScanQRCodeController)
  - [获取数据(Block)@](#获取数据(Block))
  - [获取数据(Delegate)@](#获取数据(Delegate))
- [CLTableViewController@](#CLTableViewController)
  - [UITableView与MJRefresh@](#UITableView与MJRefresh)
  - [UITableView代理与数据源@](#UITableView代理与数据源)

## CLButton@

`CLButton`是对系统`UIButton`的封装并添加了一些属性:

```objective-c
typedef NS_ENUM(NSInteger, CLButtonStyle) {
    
    CLButtonImageTopStyle = 0,
    CLButtonImageLeftStyle,
    CLButtonImageBottomStyle,
    CLButtonImageRightStyle
};

@property (nonatomic, assign) CLButtonStyle cl_buttomImageStyle;
@property (nonatomic, assign) CGFloat cl_imageSpacing;
@property (nonatomic, assign) CGSize cl_imageSize;
```




## CLCollectionViewController@

`CLCollectionViewController`是对系统`UIViewController + UICollectionView`的封装并添加了一些特性:

### UICollectionView与MJRefresh@

```objective-c
- (void)cl_removeRefresh;

- (void)cl_removeHeaderRefresh;

- (void)cl_removeFooterRefresh;

- (void)cl_dropDownRefresh;

- (void)cl_dropDownBeginRefresh;

- (void)cl_dropDownEndRefresh;

- (void)cl_pullUpRefresh;

- (void)cl_pullUpBeginRefresh;

- (void)cl_pullUpEndRefresh;
```

### UICollectionView代理与数据源@

```objective-c
- (void)cl_setCollectionViewDelegate:(_Nullable id <UICollectionViewDelegate>)delegate
                          dataSource:(_Nullable id <UICollectionViewDataSource>)dataSource;
```

### 注册类

```objective-c
- (void)cl_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier;
```

## CLCollectionViewViewModel

`CLCollectionViewViewModel`是`CLCollectionViewController`的`ViewModel`, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewController *cl_collectionViewController;

@property (nonatomic, strong) NSMutableArray *cl_dataSource;

- (instancetype)initCollectionViewBaseModelWithController:(CLCollectionViewController *)viewController;

- (void)cl_collectionViewHTTPRequest;
```



## CLCollectionViewDelegate@

`CLCollectionViewDelegate`是`CLCollectionViewController`的代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

- (instancetype)initCollectionViewDelegateWithViewModel:(CLCollectionViewViewModel *)viewModel;
```



## CLCollectionViewDataSource@

`CLCollectionViewDataSource`是`CLCollectionViewController`的数据源代理, 需要配合着使用:

```objective-c
@property (nonatomic, weak, readonly) CLCollectionViewViewModel *cl_viewModel;

- (instancetype)initCollectionViewDataSourceWithViewModel:(CLCollectionViewViewModel *)viewModel;
```



## CLNavigationController@

`CLNavigationController`是针对系统`UINavigationController`的封装并添加了一些特性:

```objective-c
@property (nonatomic, strong) UIImage *cl_backgroundImage;

@property (nonatomic, strong) UIColor *cl_tintColor;

@property (nonatomic, strong) UIColor *cl_foregroundColor;
```



`CLNavigationController`默认重载了`pushViewController:animated:`, 会在`pushViewController`的时候自动隐藏掉`UITarBar`.

## CLScanQRCodeController@

`CLScanQRCodeController`是基于`AVFoundation`进行封装的`QRCode`扫描库, 系统默认识别十三种编码:

```objective-c
@property (nonatomic, strong) UIView *cl_scanQRCodeView;

@property (nonatomic, assign) BOOL cl_autoStopCaptureSessionRunning;

@property (nonatomic, weak) id <CLScanQRCodeControllerDelegate> cl_scanQRCodeControllerDelegate;

- (void)cl_startCaptureSessionRunning;

- (void)cl_stopCaptureSessionRunning;
```

### 获取数据(Block)@

```objective-c
@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataObjectsBlock)(NSArray *metadataObjects);

@property (nonatomic, copy) void(^cl_scanQRCodeGetMetadataStringValue)(NSString *stringValue);
```

### 获取数据(Delegate)@

```objective-c
- (void)cl_scanQRCodeGetMetadataObjectsWithMetadataObjects:(NSArray *)metadataObjects;

- (void)cl_scanQRCodeGetMetadataStringValue:(NSString *)stringValue;
```



## CLTableViewController@

`CLTableViewController`是对系统`UIViewController + UITableView`的封装并添加了一些特性:

```objective-c
@property (nonatomic, strong, null_resettable, readonly) UITableView *cl_tableView;

- (instancetype)initTableViewControllerWithStyle:(UITableViewStyle)style;
```

### UITableView与MJRefresh@

```objective-c
- (void)cl_removeRefresh;

- (void)cl_removeHeaderRefresh;

- (void)cl_removeFooterRefresh;

- (void)cl_dropDownRefresh;

- (void)cl_dropDownBeginRefresh;

- (void)cl_dropDownEndRefresh;

- (void)cl_pullUpRefresh;

- (void)cl_pullUpBeginRefresh;

- (void)cl_pullUpEndRefresh;
```

### UITableView代理与数据源@

```objective-c
- (void)cl_setTableViewDelegate:(_Nullable id <UITableViewDelegate>)delegate
                     dataSource:(_Nullable id <UITableViewDataSource>)dataSource;
```



关于`CLTableViewController`封装的原理: [玩转iOS开发：打造一个低耦合可复用的《TableViewController》](https://cainrun.github.io/15009611814095.html).



## CLToolBarListView@

关于**CLToolBarListView**的用法, 以前就写过一篇文章, 大家可以去看看[玩转iOS开发：横向滑动条《CLToolBarListView》](https://cainrun.github.io/14729678790305.html).
