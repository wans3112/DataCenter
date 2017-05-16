//
//  BFDSViewObject.h
//  将json转换成Model,DataSource与Model解藕
//
//  Created by wans on 16/12/16.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFMetaModel.h"
#import "BFDCCommonOrder.h"

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT

@protocol BFDSViewObjectDelegate;
typedef void (^BFDSViewObjectAsResultBlock)(id);

@protocol BFDSViewObjectDelegate <NSObject>


/**
 将字典转换成Model，需要在子类重写实现业务Model的转换

 @return 可直接被业务使用的数据
 */
- (id)viewObjectList;

- (id)viewObjectDetail;

@end

@interface BFDSViewObject : NSObject<BFDSViewObjectDelegate>

@property (nonatomic,strong,readonly) BFMetaModel                   *metaModel;

@property (nonatomic,strong) BFDCCommonOrder                        *commonOrder;


/**
 网络数据返回初始化自己

 @param meta BFMetaModel
 @return 实例
 */
+ (instancetype)viewObjectWithMeta:(BFMetaModel *)meta;

@end
