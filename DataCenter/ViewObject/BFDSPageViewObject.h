//
//  BFDSPageViewObject.h
//  BigFan
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDSViewObject.h"
#import "BFPageModel.h"

@interface BFDSPageViewObject : BFDSViewObject
@property (nonatomic,strong,readonly) BFPageModel *pageModel;

@end
