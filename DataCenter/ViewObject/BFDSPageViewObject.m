//
//  BFDSPageViewObject.m
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDSPageViewObject.h"
#import "BFPageModel.h"

@interface BFDSPageViewObject ()
@property (nonatomic,strong,readwrite) BFPageModel         *pageModel;

@end

@implementation BFDSPageViewObject

#pragma mark - Getter Setter
- (BFPageModel *)pageModel {
    if( !_pageModel ){
//        _pageModel = [BFPageModel mj_objectWithKeyValues:self.metaModel.data];
    }
    return _pageModel;
}
@end
