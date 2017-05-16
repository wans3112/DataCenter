//
//  BFDataCenterTest.m
//  BigFan
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDataCenterTest.h"
#import "BFDataCenterConstant.h"

#define Switch 0

@implementation BFDataCenterTest

+ (void)test{

    switch ( Switch ) {
        case 0:
        {
            [[BFDataCenter sharedInstance] fetchList:^(BFDCCommonOrder *order) {
                order.modulesURL = URL_AUCTION_CENTER;
//                order.resourceName = URL_AUCTION_DATASOURCE_GETLIST;
                order.parameters = @{@"pageNum":@(0),@"pageSize":@(10),@"type":@2};
//                order.cacheOnDataCenter = YES;//只从datacenter取数据
            } asResult:^(BFDSResult *result) {
                NSLog(@"test result : %@",result.data);
            } asError:^(BFDSError *error) {
//                [BFCustomHUD showInfoWithStatus:error.errmsg];
                NSLog(@"error >> %@", error.errmsg);

            }];
        }
            break;
            
        case 1:
        {
            [[BFDataCenter sharedInstance] fetchList:^(BFDCCommonOrder *order) {
                order.modulesURL = URL_AUCTION_CENTER;
//                order.postURL = API_AUCTIONVENDOR_PUBLISH;
//                order.parameters = @{@"pageNum":@(0),@"pageSize":@(10),@"type":@2};
//                order.cacheOnDataCenter = YES;//只从datacenter取数据
            } asResult:^(id result) {
                NSLog(@"test result : %@",result);
            } asError:^(BFDSError *error) {
//                [BFCustomHUD showInfoWithStatus:error.errmsg];
                NSLog(@"error >> %@", error.errmsg);
            }];
        }
            break;
        default:
            break;
    }
   
}
@end
