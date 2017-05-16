//
//  BFDSResult.m
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDSResult.h"

@interface BFDSResult ()
@property (nonatomic,strong,readwrite) id data;

@end

@implementation BFDSResult

+ (instancetype)resultWithData:(id)asresult {
    BFDSResult *dsresult = [[[self class] alloc] init];
    dsresult.data = asresult;
    return dsresult;
}
@end
