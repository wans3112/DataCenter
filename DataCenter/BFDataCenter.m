//
//  BFDataCenter.m
//  BigFan
//
//  Created by wans on 16/12/15.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "BFDataCenter.h"
#import "BFDSViewObject.h"


typedef enum {
    BFDataCenteTypeList        = 0,// 列表
    BFDataCenteTypeDetail      = 1,// 详情
}BFDataCenteType;

static int BFDCAsResultSuccessCode = 200;

@interface BFDataCenter ()

/**
 缓存
 */
@property (nonatomic,strong, readwrite) NSMutableDictionary *dataCenter;

/**
 保存datasource的URL
 */
@property (nonatomic,strong, readwrite) NSMutableDictionary *registerDataSourceCls;

/**
 保存viewObject的URL
 */
@property (nonatomic,strong, readwrite) NSMutableDictionary *registerViewObjectCls;

@end

@implementation BFDataCenter

/**
 *  单例
 *
 *  @return BFDataCenter实例
 */
+ (instancetype)sharedInstance {
    static BFDataCenter *theDataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theDataCenter = [[BFDataCenter alloc] init];
    });
    return theDataCenter;
}

- (void)fetchList:(BFDCCommonOrderBlock)orderBlock
         asResult:(BFDCAsResultBlock)resultBlock
          asError:(BFDCAsResultErrorBlock)errorBlock {
    
    [self fetchCommonData:orderBlock
                 asResult:resultBlock
                  asError:errorBlock
                   dcType:BFDataCenteTypeList];
}

- (void)fetchDetail:(BFDCCommonOrderBlock)orderBlock
           asResult:(BFDCAsResultBlock)resultBlock
            asError:(BFDCAsResultErrorBlock)errorBlock {
    
    [self fetchCommonData:orderBlock
                 asResult:resultBlock
                  asError:errorBlock
                   dcType:BFDataCenteTypeDetail];
}

/**
 执行获取数据
 
 @param orderBlock 请求规则参数
 @param resultBlock 成功回调
 @param errorBlock 失败回调
 @param dcType 获取数据类型
 
 @return 数据
 */
- (void)fetchCommonData:(BFDCCommonOrderBlock)orderBlock
               asResult:(BFDCAsResultBlock)resultBlock
                asError:(BFDCAsResultErrorBlock)errorBlock
                 dcType:(BFDataCenteType)dcType {
    //获得请求参数
    BFDCCommonOrder *targetOrder = (BFDCCommonOrder *)[self setupOrder:[[BFDCCommonOrder alloc] init]
                                                                 order:orderBlock];
    
    //只在数据中心取数据
    NSString *cachedKey = [[self class] getCachedKeyWithPattern:targetOrder.modulesURL
                                                            url:targetOrder.resourceName];
    if ( targetOrder.cacheInDataCenter ) {
        id data = [self.dataCenter objectForKey:cachedKey];
        if ( resultBlock ) {
            resultBlock(data);
        }
        return ;
    }
    
//    Method method = NULL;
    Class dataSourceClass = NULL;
//    SEL pSEL = @selector(doGetListWithOrder:);
    NSString *pattern = targetOrder.modulesURL;
    
    @try {
        
        if ( !pattern ) {
            [NSException raise:@"DC错误" format:@"datasource url不能为空"];
        }
        dataSourceClass = [[self class] findDataSourceClassWithURLPattern:pattern];
        
//        pSEL = NSSelectorFromString(methodName);
//        method = class_getClassMethod(dataSourceClass, pSEL);
        if ( dataSourceClass == NULL ) {
            [NSException raise:@"参数错误" format:@"%@不存在方法:%@",NSStringFromClass(dataSourceClass),pattern];
        }
    } @catch (NSException *exception) {
        NSLog(@"datacenter exception.reason = %@" , exception.reason);
        if ( errorBlock ) {
            BFDSError *error = [BFDSError errorWithMessage:exception.reason];
            errorBlock(error);
        }
        
        return ;
    } @finally {
        
    }
    
//    typedef void (*invokeDataSource) (id, Method, BFDCCommonOrder *);
//    invokeDataSource doInvokeDataSource = (invokeDataSource)method_invoke;
//不需要回调
//    if ( !resultBlock ) {
//        if ( [dataSourceClass respondsToSelector:@selector(doGetListWithOrder:)] ) {
//            [dataSourceClass doGetListWithOrder:targetOrder];
//        };
//
//        return;
//    }
    
    //初始化回调
    @weakify(self)
    BFDSViewObjectAsResultBlock vOAsResultBlock = ^(id resultData) {
        @normalize(self)
        
        BFMetaModel *meta = (BFMetaModel *)resultData;
        
        if ( !meta || meta.errcode != BFDCAsResultSuccessCode ) {
            if ( errorBlock ) {
                BFDSError *error = [BFDSError errorWithMeta:meta];
                errorBlock(error);
            }
        }else {
            if ( resultBlock ) {
                
                //目标数据
                id targetData = nil;
                
                Class viewObjectClass = [[self class] findViewObjectClassWithURLPattern:pattern];
                
                if ( viewObjectClass ) {
                    BFDSViewObject *viewObject = [viewObjectClass viewObjectWithMeta:meta];
                    viewObject.commonOrder = targetOrder;
                    if ( dcType == BFDataCenteTypeList && [viewObject respondsToSelector:@selector(viewObjectList)] ) {
                        targetData = [viewObject viewObjectList];
                    }else if ( dcType == BFDataCenteTypeDetail && [viewObject respondsToSelector:@selector(viewObjectDetail)] ) {
                        targetData = [viewObject viewObjectDetail];
                    }
                }
                
                BFDSResult *result = [BFDSResult resultWithData:targetData];
                result.meta = meta;
                //执行数据返回回调
                resultBlock(result);
                
                //缓存到datacenter
                if ( targetOrder.cacheOnDataCenter && targetData ) {
                    [self.dataCenter setObject:result forKey:cachedKey];
                }
            }
        }
    };
    
    targetOrder.resultBlock = vOAsResultBlock;
    SEL targetSEL;
    if ( dcType == BFDataCenteTypeList ) {
        targetSEL = @selector(doGetListWithOrder:);
    }else if ( dcType == BFDataCenteTypeDetail ) {
        targetSEL = @selector(doGetDetailWithOrder:);
    }
    
    if ( [dataSourceClass respondsToSelector:targetSEL] ) {
        [dataSourceClass doGetListWithOrder:targetOrder];
    }
//
//    if ( class_respondsToSelector(dataSourceClass, pSEL) ) {
//        doInvokeDataSource(dataSourceClass, method, targetOrder);
//    }
//执行获取数据操作

//    if ( targetOrder.customParameter.count > 0 ) {
//        NSMethodSignature * sig  = [dataSourceClass methodSignatureForSelector:pSEL];
//        NSInvocation * invocatin = [NSInvocation invocationWithMethodSignature:sig];
//        [invocatin setTarget:dataSourceClass];
//        [invocatin setSelector:pSEL];
//        
//        [invocatin setArgument:&targetOrder atIndex:2];
//        
//        [invocatin invoke];
//    }
    
}

/**
 获取实例

 @param order 实例block
 @return 赋值后的实例
 */
- (id)setupOrder:instance order:(void (^)(id)) order {
    if (order) {
        order(instance);
    }
    return instance;
}

/**
 获取DataSource类
 
 @param URLPattern url
 @return DataSource类名
 */
+ (Class)findDataSourceClassWithURLPattern:(NSString *)URLPattern {
    return [[BFDataCenter sharedInstance].registerDataSourceCls valueForKey:URLPattern];
}

+ (Class)findViewObjectClassWithURLPattern:(NSString *)URLPattern {
    return [[BFDataCenter sharedInstance].registerViewObjectCls valueForKey:URLPattern];
}

/**
 注册DataSource到DataCenter
 
 @param URLPattern url
 @param cls 类对象
 */
+ (void)registerDataSourceURLPattern:(NSString *)URLPattern dataSourceClass:(Class)cls {
    [[BFDataCenter sharedInstance].registerDataSourceCls setObject:cls forKey:URLPattern];
}

+ (void)registerViewObjectURLPattern:(NSString *)URLPattern dataSourceClass:(Class)cls {
    [[BFDataCenter sharedInstance].registerViewObjectCls setObject:cls forKey:URLPattern];
}


/**
 拼接缓存key

 @param pattern 模块名
 @param url 请求名
 @return key
 */
+ (NSString *)getCachedKeyWithPattern:(NSString *)pattern url:(NSString *)url {
    if ( url.length > 0 ) {
        return [pattern stringByAppendingString:url];
    }
    return pattern;
}

#pragma mark - Getter && Setter

- (NSMutableDictionary *)dataCenter {
    if( !_dataCenter ) {
        _dataCenter = [NSMutableDictionary dictionary];
    }
    return _dataCenter;
}

- (NSMutableDictionary *)registerDataSourceCls {
    if( !_registerDataSourceCls ) {
        _registerDataSourceCls = [NSMutableDictionary dictionary];
    }
    return _registerDataSourceCls;
}

- (NSMutableDictionary *)registerViewObjectCls {
    if( !_registerViewObjectCls ) {
        _registerViewObjectCls = [NSMutableDictionary dictionary];
    }
    return _registerViewObjectCls;
}
@end
