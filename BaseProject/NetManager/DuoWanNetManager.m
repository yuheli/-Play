//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "AllHeroModel.h"
#import "FreeHeroModel.h"
#import "HeroSkinModel.h"
#import "HeroVideoModel.h"
#import "HeroVideoModel.h"
#import "HeroCZModel.h"
#import "HeroDetailModel.h"
#import "HeroChangeModel.h"
#import "HeroWeekDataModel.h"
#import "ToolMenuModel.h"
#import "ZBItemModel.h"
#import "ZBCategoryModel.h"
#import "ItemDetailModel.h"
#import "GiftModel.h"
#import "RuneModel.h"
#import "SumAbilityModel.h"
#import "BestGroupModel.h"
#import "HeroGiftAndRuneModel.h"
//很多具有共同点的东西，可以宏定义

#define kHeroSkinPath       @"http://box.dwstatic.com/apiHeroSkin.php"

#define kOSType       @"OSType": [@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion] //获取当前系统版本号

#define kVersionName    @"versionName": @"2.4.0"
#define kV              @"v": @140

#define kOSTypeV  @"OSType":[@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion],@"v":@140     //9.1是当前手机系统版本，需要到info.plist文件去取
#define kSetObjectV(dic)    [dic setValue:@140 forKey:@"v"]
#define kSetObjectTypeFree(dic) [dic setValue:@"free" forKey:@"type"]
#define kSetObjectTypeAll(dic) [dic setValue:@"all" forKey:@"type"]
#define kSetObjectVersionName(dic) [dic setValue:@"2.4.0" forKey:@"versionName"]
//#define kSetObjectHeroName(dic,string) [dic setValue:string forKey:@"hero"]

#define kSetHeroName(dic,heroName,string)  [dic setObject:heroName forKey:string]
#define kSetLimit(dic,ID) [dic setObject:@(ID) forKey:@"limit"]

@implementation DuoWanNetManager
+(id)getDuoWanDataWithPath:(NSString *)path type:(type)heroType completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *parmas = [NSMutableDictionary dictionaryWithDictionary:@{kOSTypeV}];
    kSetObjectV(parmas);
    switch (heroType) {
        case typeAll:
            kSetObjectTypeAll(parmas);
            break;
        case typeFree:
            kSetObjectTypeFree(parmas);
            break;
        default:
            break;
    }
    
    return [BaseNetManager GET:kHeroPath parameters:parmas completionHandler:^(id responseObj, NSError *error) {
        switch (heroType) {
            case typeAll:
                completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
                break;
            case typeFree:
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj],error);
 
                break;
            default:
                break;
        }
        
    }];

}

//通过字典数组来创建一个模型数组
+(id)getHeroSkipWithHero:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
   
    return [BaseNetManager GET:kHeroSkipPath parameters:@{kOSTypeV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
        
//        completionHandle([HeroSkinModel objectWithKeyValues:responseObj],error);
        
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getHeroSoundsWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroSounds parameters:@{kOSTypeV,kVersionName,@"hero":heroName} completionHandler:^(id responseObj, NSError *error) {
        //JSON数据就是标准数组，不需要解析
        completionHandle(responseObj,error);
    }];
}

+(id)getHeroVideoWithHero:(NSString *)heroName pID:(NSInteger)p completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *parmas = @{@"action" :@"l",@"p":@(p),@"src":@"letv",@"tag":heroName};
    
//    [parmas setValue:heroName forKey:@"tag"];
    return [BaseNetManager GET:kHeroVideo parameters:parmas completionHandler:^(id responseObj, NSError *error) {
        //responseObj为数组模式
        completionHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+ (id)getHeroCZWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSTypeV}];
    kSetHeroName(params, heroName, @"championName");
    kSetLimit(params,7);
    return [BaseNetManager GET:kHeroCZ parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        
        completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
    
}

+(id)getHeroDetailWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSTypeV}];
    kSetHeroName(params, heroName, @"heroName");
    return [BaseNetManager GET:kHeroDetail parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([HeroDetailModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getHeroChangeWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroChange parameters:@{kOSTypeV,@"name" :heroName} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getHeroWeekWithHerold:(NSInteger)herold completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroWeek parameters:@{@"herold" : @(herold)} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([HeroWeekDataModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getHeroToolMenuWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroToolMenu parameters:@{kOSTypeV,@"category" :@"database",@"versionName":@"2.4.0"} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ToolMenuModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
+(id)getHeroZBCategoryWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroZB parameters:@{kOSTypeV,@"versionName":@"2.4.0"} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ZBCategoryModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getHeroZBItemWithWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroZBitemList parameters:@{@"tag":@"consumable",kOSTypeV,@"versionName":@"2.4.0"} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ZBItemModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getHeroItemDetailWithID:(NSString *)ID completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroItemDetail parameters:@{kOSTypeV,@"id":ID} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj],error);
    }];
    
}

+(id)getGiftWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroGft parameters:@{kOSTypeV} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([GiftModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getRunesWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroRune parameters:@{kOSTypeV} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([RuneModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getHeroSumAbilityWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroSumAbility parameters:@{kOSTypeV} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([SumAbilityModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getBestGroupWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroBestGroup parameters:@{kOSTypeV} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([BestGroupModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+ (id)getHeroGiftAndRuneWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroGiftAndRunPath parameters:@{kOSTypeV,@"hero":heroName} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([HeroGiftAndRuneModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}




















@end
