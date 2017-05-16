//
//  BFDataCenterConstant.h
//  BigFan
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#ifndef BFDataCenterConstant_h
#define BFDataCenterConstant_h

#import "BFDataCenter.h"
#import "BFDCCommonOrder.h"

typedef void (^BFDCCommonBlock)(id object);


/**
 竞拍
 */
#define URL_AUCTION_CENTER                                     @"bigfan://auctiondatasource"


#undef	ADTACENTER_DATASOURCE_LOAD
#define ADTACENTER_DATASOURCE_LOAD( x ) \
+ (void)load \
{ \
[BFDataCenter registerDataSourceURLPattern:x dataSourceClass:[self class]]; \
}

#undef	ADTACENTER_VIEWOBJECT_LOAD
#define ADTACENTER_VIEWOBJECT_LOAD( x ) \
+ (void)load \
{ \
[BFDataCenter registerViewObjectURLPattern:x dataSourceClass:[self class]]; \
}


#ifndef	weakify
#if __has_feature(objc_arc)
#define weakify( x )	autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x;
#else	// #if __has_feature(objc_arc)
#define weakify( x )	autoreleasepool{} __block __typeof__(x) __block_##x##__ = x;
#endif	// #if __has_feature(objc_arc)
#endif	// #ifndef	weakify

#ifndef	normalize
#if __has_feature(objc_arc)
#define normalize( x )	try{} @finally{} __typeof__(x) x = __weak_##x##__;
#else	// #if __has_feature(objc_arc)
#define normalize( x )	try{} @finally{} __typeof__(x) x = __block_##x##__;
#endif	// #if __has_feature(objc_arc)
#endif	// #ifndef	@normalize

#endif /* BFDataCenterConstant_h */
