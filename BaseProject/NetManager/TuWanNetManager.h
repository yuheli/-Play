//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanBaseModel.h"
//只要公用一个解析类的请求就可以和写，只需要枚举变量，来决定不同的请求地址即可
typedef NS_ENUM(NSUInteger,InfoType){
    InfoTypeTouTiao,
    InfoTypeDuJia,
    InfoTypeAnHei,
    InfoTypeMoShou,
    InfoTypeFengBao,
    InfoTypeLuShi,
    InfoTypeXingJi,
    InfoTypeShouWang,
    InfoTypeTuPian,
    InfoTypeShiPin,
    InfoTypeGongLue,
    InfoTypeHuanHua,
    InfoTypeQuWen,
    InfoTypeCOS,
    InfoTypeMeiNv
};


@interface TuWanNetManager : BaseNetManager
+ (id)getTuWanWithInfoType:(InfoType)type start:(NSInteger)start kCompletionHandle;
@end
