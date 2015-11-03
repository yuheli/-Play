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
//很多具有共同点的东西，可以宏定义


//把path写到文件头部，方便下次使用
#define kHeroPath @"http://lolbox.duowan.com/phone/apiHeroes.php" //免费+全部英雄
#define kHeroSkipPath @"http://box.dwstatic.com/apiHeroSkin.php" //皮肤

#define kHeroVideo @"http://box.dwstatic.com/apiVideoesNormalDuowan.php" //英雄视频

#define kHeroCZ @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php" //英雄出装

#define  kHeroDetail @"http://lolbox.duowan.com/phone/apiHeroDetail.php" //英雄资料

#define kHeroChange @"http://db.duowan.com/boxnews/heroinfo.php" //英雄改动

#define kHeroWeek @"http://183.61.12.108/apiHeroWeekData.php" //英雄周数据

#define kHeroToolMenu @"http://box.dwstatic.com/apiToolMenu.php" //英雄游戏百科列表
#define kHeroZB @"http://lolbox.duowan.com/phone/apiZBCategory.php" //装备分类
#define kHeroZBitemList @"http://lolbox.duowan.com/phone/apiZBItemList.php" //某分类装备列表

#define kHeroItemDetail @"http://lolbox.duowan.com/phone/apiItemDetail.php" //装备详情
#define kHeroGft @"http://lolbox.duowan.com/phone/apiGift.php" //天赋
#define kHeroRune @"http://lolbox.duowan.com/phone/apiRunes.php" //符文列表
#define kHeroSumAbility @"http://lolbox.duowan.com/phone/apiSumAbility.php" //召唤师技能列表
#define kHeroBestGroup @"http://box.dwstatic.com/apiHeroBestGroup.php" //最佳阵容

#define kOSTypeV  @"OSType":@"iOS9.1",@"v":@140     //9.1是当前手机系统版本，需要到info.plist文件去取
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
+(id)getHeroSkipWithHero:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *parmas = [NSMutableDictionary dictionaryWithDictionary:@{kOSTypeV}];
    kSetObjectV(parmas);
    kSetObjectVersionName(parmas);
    kSetHeroName(parmas, heroName, @"hero");
    return [BaseNetManager GET:kHeroSkipPath parameters:parmas completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([HeroSkinModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getHeroVideoWithHero:(NSString *)heroName pID:(NSInteger)p completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *parmas = @{@"action" :@"l",@"p":@(p),@"src":@"letv"};
    
    [parmas setValue:heroName forKey:@"tag"];
    return [BaseNetManager GET:kHeroVideo parameters:parmas completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([HeroVideoModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getHeroCZWithHeroName:(NSString *)heroName limit:(NSInteger)limit completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSTypeV}];
    kSetHeroName(params, heroName, @"championName");
    kSetLimit(params, limit);
    return [BaseNetManager GET:kHeroCZ parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        
        completionHandle([HeroCZModel objectWithKeyValues:responseObj],error);
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
        
        completionHandle([ToolMenuModel objectWithKeyValues:responseObj],error);
    }];
}
+(id)getHeroZBCategoryWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroZB parameters:@{kOSTypeV,@"versionName":@"2.4.0"} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ZBCategoryModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getHeroZBItemWithWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroZBitemList parameters:@{@"tag":@"consumable",kOSTypeV,@"versionName":@"2.4.0"} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ZBItemModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getHeroItemDetailWithID:(NSString *)ID completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroItemDetail parameters:@{kOSTypeV} completionHandler:^(id responseObj, NSError *error) {
        
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
        
        completionHandle([SumAbilityModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getBestGroupWithCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return [BaseNetManager GET:kHeroBestGroup parameters:@{kOSTypeV} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([BestGroupModel objectWithKeyValues:responseObj],error);
    }];
}






















@end
