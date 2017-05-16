//
//  BFDCCommonOrder.h
//  BigFan
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDCCommonOrder.h"
#import "BFDCBaseOrder.h"

@interface BFDCCommonOrder : BFDCBaseOrder

/**
 被调用方数据输出的回调
 */
@property (nonatomic,copy)                           void (^resultBlock)(id);

/**
 是否需要在数据中心缓存
 */
@property (nonatomic,assign) BOOL                    cacheOnDataCenter;

/**
 只从数据中心获取缓存
 */
@property (nonatomic,assign) BOOL                    cacheInDataCenter;

@end
