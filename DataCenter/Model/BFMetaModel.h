//
//  BFMetaModel.h
//  DataCenterExample
//
//  Created by wans on 2017/5/10.
//  Copyright © 2017年 wans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFMetaModel : NSObject

/**
 *  错误信息
 */
@property (nonatomic, copy) NSString *errmsg;

/**
 *  错误代码
 */
@property (nonatomic, assign) int errcode;

/**
 *  返回数据
 */
@property (nonatomic, strong) id data;

/**
 *  返回模型
 */
@property (nonatomic, strong) id model;

@end
