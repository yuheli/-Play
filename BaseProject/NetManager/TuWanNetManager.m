//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"
#define kTuWanPath     @"http://cache.tuwan.com/app/" //path
#define kAppId         @"appid"  :@1
#define kAppver        @"appver" :@2.1
#define kClassmore     @"classmore" :@"indexpic"

#define kSetObjClass(dic,string)         [dic setObject:string forKey:@"class"]
#define kSetObjMod(dic,string)          [dic setObject:string forKey:@"mod"]
#define kSetObjDtid(dic,string)         [dic setObject:string forKey:@"dtid"]
#define kRemoveClassmore(dic)        [dic removeObjectForKey:@"classmore"];

@implementation TuWanNetManager
+(id)getTuWanWithInfoType:(InfoType)type start:(NSInteger)start completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kAppId,kAppver,@"start" : @(start),kClassmore}];
    switch (type) {
        case InfoTypeTouTiao: {
            
            break;
        }
        case InfoTypeDuJia: {
            kSetObjClass(params, @"heronews");
            kSetObjMod(params, @"八卦");
            kRemoveClassmore(params);
            break;
        }
        case InfoTypeAnHei: {
            kSetObjDtid(params, @"83623");
           
            break;
        }
        case InfoTypeMoShou: {
            kSetObjDtid(params, @"31537");
         
            break;
        }
        case InfoTypeFengBao: {
             kSetObjDtid(params, @"31538");
            
            break;
        }
        case InfoTypeLuShi: {
            kSetObjDtid(params, @"31528");
            break;
        }
        case InfoTypeXingJi: {
             kSetObjDtid(params, @"91821");
            kRemoveClassmore(params);

            break;
        }
        case InfoTypeShouWang: {
            kSetObjDtid(params, @"57067");
            kRemoveClassmore(params);

            break;
        }
        case InfoTypeTuPian: {
            kSetObjDtid(params, @"83623,31528,31537,31538,57067,91821");
            kRemoveClassmore(params);
            [params setObject:@"pic" forKey:@"type"];
            
        }
        case InfoTypeShiPin: {
           
            [params setObject:@"video" forKey:@"type"];
            break;
        }
        case InfoTypeGongLue: {
            [params setObject:@"guide" forKey:@"type"];
            break;
        }
        case InfoTypeHuanHua: {
            kRemoveClassmore(params);
            kSetObjMod(params, @"幻化");
            kSetObjClass(params, @"heronews");
            break;
        }
        case InfoTypeQuWen: {
             kSetObjDtid(params, @"0");
            kSetObjMod(params, @"趣闻");
            kSetObjClass(params, @"heronews");
            break;
        }
        case InfoTypeCOS: {
             kSetObjDtid(params, @"0");
            kSetObjMod(params, @"cos");
            kSetObjClass(params, @"cos");
            break;
        }
        case InfoTypeMeiNv: {
            kSetObjMod(params, @"美女");
            kSetObjClass(params, @"heronews");
            [params setObject:@"cos1" forKey:@"typechild"];
            break;
        }
        default: {
            break;
        }
    }
       
//兔玩服务器要求，传入的参数不能为中文
    
    NSString *strpath = [self percentPathWithpath:kTuWanPath parmas:params];
    return [self GET:strpath parameters:nil completionHandler:^(id responseObj, NSError *error) {
           completionHandle([TuWanBaseModel objectWithKeyValues:responseObj],error);
           
       }];
}
@end
