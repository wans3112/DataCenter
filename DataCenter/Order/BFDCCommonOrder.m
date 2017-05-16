//
//  BFDCCommonOrder.m
//  BigFan
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDCCommonOrder.h"

@interface BFDCCommonOrder ()

//@property (nonatomic,copy,readwrite) void (^completionHandler)(id);

@end

@implementation BFDCCommonOrder

- (instancetype)init {

    self = [super init];
    
    if ( self ) {
//        self.responseModel = [BFPageModel class];
    }
    
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
//    self.resultBlock = nil;
}
@end
