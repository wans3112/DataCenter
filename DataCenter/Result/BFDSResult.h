//
//  BFDSResult.h
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFDSResult : NSObject


/**
 经过转换后目标数据，需要强制转换类型，类型与对应的viewobject中返回相同
 */
@property (nonatomic,strong,readonly) id data;

/**
 被调方返回的原始数据
 */
@property (nonatomic,strong) BFMetaModel *meta;

+ (instancetype)resultWithData:(id)asresult;

@end
