//
//  BFDCBaseOrder.h
//  BigFan
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFDCBaseOrder : NSObject

/**
 datasource url，注册到datacenter
 */
@property (nonatomic,strong,nonnull) NSString *modulesURL;

/**
 被调方提供服务名
 */
NS_ASSUME_NONNULL_BEGIN
@property (nonatomic,strong) NSString         *resourceName;

/**
 入参
 */
@property (nonatomic,strong) NSDictionary     *parameters;

@property (nonatomic,strong) id               model;
NS_ASSUME_NONNULL_END
@end
