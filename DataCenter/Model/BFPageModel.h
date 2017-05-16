//
//  BFPageModel.h
//  DataCenterExample
//
//  Created by wans on 2017/5/10.
//  Copyright © 2017年 wans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFPageModel : NSObject

@property (nonatomic, assign) NSInteger pageNum;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) NSInteger type;

@end
