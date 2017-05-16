//
//  BFDataCenter.h
//  BigFan
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFDCCommonOrder.h"
#import "BFDSError.h"
#import "BFDSResult.h"

typedef void (^BFDCCommonOrderBlock)(BFDCCommonOrder* order);
typedef void (^BFDCAsResultBlock)(BFDSResult *result);
typedef void (^BFDCAsResultErrorBlock)(BFDSError *error);


/**
 各模块DataSources需要实现
 */
@protocol BFDataCenterDelegate <NSObject>

@optional

/**
 获取数据列表
 @param order 操作命令
 */
+ (void)doGetListWithOrder:(BFDCCommonOrder *)order;

/**
 获取详情
 @param order 操作命令
 */
+ (void)doGetDetailWithOrder:(BFDCCommonOrder *)order;

@end

@interface BFDataCenter : NSObject

@property (nonatomic,strong, readonly) NSMutableDictionary *parameters;

+ (instancetype)sharedInstance;

- (void)fetchList:(BFDCCommonOrderBlock)order asResult:(BFDCAsResultBlock)resultBlock asError:(BFDCAsResultErrorBlock)errorBlock;
- (void)fetchDetail:(BFDCCommonOrderBlock)order asResult:(BFDCAsResultBlock)resultBlock asError:(BFDCAsResultErrorBlock)errorBlock;


+ (Class)findDataSourceClassWithURLPattern:(NSString *)URLPattern;
+ (Class)findViewObjectClassWithURLPattern:(NSString *)URLPattern;

+ (void)registerDataSourceURLPattern:(NSString *)URLPattern dataSourceClass:(Class)cls;
+ (void)registerViewObjectURLPattern:(NSString *)URLPattern dataSourceClass:(Class)cls;

@end
