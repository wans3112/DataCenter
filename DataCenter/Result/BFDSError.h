//
//  BFDSError.h
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDSError.h"
#import "BFMetaModel.h"

@interface BFDSError : NSObject
/**
 * 请求结果
 */
@property (nonatomic, assign) int ret;

/**
 *  错误信息
 */
@property (nonatomic, copy) NSString *errmsg;

/**
 *  错误代码
 */
@property (nonatomic, assign) int errcode;

+ (instancetype)errorWithMeta:(BFMetaModel *)meta;

+ (instancetype)errorWithMessage:(NSString *)errormsg;

@end
