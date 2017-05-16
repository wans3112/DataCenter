//
//  BFAuctionDataSource.m
//  获取数据层
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFAuctionDataSource.h"
#import "BFDataCenterConstant.h"
#import "BFDSAuctionViewObject.h"

@interface BFAuctionDataSource ()<BFDataCenterDelegate>

@end

@implementation BFAuctionDataSource
ADTACENTER_DATASOURCE_LOAD(URL_AUCTION_CENTER)

+ (void)doGetListWithOrder:(BFDCCommonOrder *)order {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 提供服务...
        id result = nil;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            order.resultBlock(result);
            order.resultBlock = nil;
        });
        
    });
}

@end
