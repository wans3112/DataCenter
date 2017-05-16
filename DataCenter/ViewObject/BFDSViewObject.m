//
//  BFDSViewObject.m
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDSViewObject.h"

@interface BFDSViewObject ()
@property (nonatomic,strong,readwrite) BFMetaModel                   *metaModel;

@end

@implementation BFDSViewObject

+ (instancetype)viewObjectWithMeta:(BFMetaModel *)meta {
    BFDSViewObject *objectView = [[[self class] alloc] init];
    objectView.metaModel = meta;
    return objectView;
}

- (id)viewObjectList {
    
    return nil;
}

- (id)viewObjectDetail {
    
    return nil;
}
@end
