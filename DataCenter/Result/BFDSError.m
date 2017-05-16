//
//  BFDSError.m
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDSError.h"

@implementation BFDSError

+ (instancetype)errorWithMeta:(BFMetaModel *)meta {
    BFDSError *error = [[self class] alloc];
    error.errcode = meta.errcode;
    error.errmsg = meta.errmsg;
//    error.ret = meta.ret;
    return error;
}

+ (instancetype)errorWithMessage:(NSString *)errormsg {
    BFDSError *error = [[self class] alloc];
    error.errmsg = errormsg;
    return error;
}
@end
