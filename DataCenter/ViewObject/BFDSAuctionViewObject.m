//
//  BFDSAuctionViewObject.m
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDSAuctionViewObject.h"

@implementation BFDSAuctionViewObject
ADTACENTER_VIEWOBJECT_LOAD(URL_AUCTION_CENTER)

- (id)viewObjectList {

//    SWITCH ( self.commonOrder.resourceName ) {
//        CASE ( @"" ) {
//            return nil;
//            break;
//        }
//    }
    
//    return [RespAuctionListInfoModel mj_objectArrayWithKeyValuesArray:self.pageModel.items];
    return nil;
}

- (id)viewObjectDetail {
    
    SWITCH ( @"" ) {
        CASE ( @"/api/place/placeSearch" ) {
//            return [RespBizPlaceBaseInfo mj_objectArrayWithKeyValuesArray:self.pageModel.items];
            return nil;

            break;
        }
        
        CASE (@"CCC") {
            break;
        }
        DEFAULT {
            break;
        }
    }
    
    return nil;
}
@end
