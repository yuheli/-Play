//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanModel.h"
#import "DuoWanRequest.h"

typedef NS_ENUM(NSUInteger,type){
    typeFree,
    typeAll
};
@interface DuoWanNetManager : BaseNetManager

/**
 *  获取免费英雄或收费英雄列表， 因为免费和收费英雄请求串十分相似，所以合写
 *
 *  @param type 请求英雄类型
 *
 *  @return 当前请求所在任务
 */
+ (id)getDuoWanDataWithPath:(NSString *)path type:(type)heroType kCompletionHandle;
/**
 *  获取英雄配音
 *
 *  @param heroName 英雄英文名
 *
 *  @return 网络请求任务
 */

+ (id)getHeroSoundsWithHeroName:(NSString *)heroName kCompletionHandle;


/**
 *  获取英雄皮肤
 *
 *  @param heroName 要获取皮肤的英雄英文名称
 *
 *  @return 请求所在任务
 */

+ (id)getHeroSkipWithHero:(NSString *)heroName kCompletionHandle;
//英雄ViDeo
/**
 *  获取某英雄出装
 *
 *  @param enName 英雄英文名
 *
 *  @return 网络请求任务
 */

+ (id)getHeroVideoWithHero:(NSString *)heroName pID:(NSInteger)p kCompletionHandle;
/**
 *  获取某英雄出装
 *
 *  @param enName 英雄英文名
 *
 *  @return 网络请求任务
 */

+ (id)getHeroCZWithHeroName:(NSString *)heroName kCompletionHandle;
/**
 *  获取英雄资料
 *
 *  @param enName 英雄英文名
 *
 *  @return 网络请求任务
 */

+ (id)getHeroDetailWithHeroName:(NSString *)heroName kCompletionHandle;
/**
 *  获取英雄改动
 *
 *  @param enName 英雄英文名
 *
 *  @return 网络请求任务
 */

+ (id)getHeroChangeWithHeroName:(NSString *)heroName kCompletionHandle;
/**
 *  获取英雄一周数据
 *
 *  @param heroId 英雄id
 *
 *  @return 网络请求任务
 */

+ (id)getHeroWeekWithHerold:(NSInteger)herold kCompletionHandle;
/** 获取游戏百科列表 */
+ (id)getHeroToolMenuWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;
/** 获取装备分类 */
+ (id)getHeroZBCategoryWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;
/**
 *  获取某分类装备列表
 *
 *  @param tag 分类tag
 *
 *  @return
 */

+ (id)getHeroZBItemWithWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;
/**
 *  装备详情
 *
 *  @param itemId 装备id
 *
 *  @return
 */

+ (id)getHeroGiftAndRuneWithHeroName:(NSString *)heroName kCompletionHandle;

+ (id)getHeroItemDetailWithID:(NSString *)ID kCompletionHandle; //获取某分类装备列表
/** 获取天赋树 */
+ (id)getGiftWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;
/** 获取符文列表 */
+ (id)getRunesWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;
/** 获取召唤师技能 */
+ (id)getHeroSumAbilityWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;
/** 获取最佳阵容 */ 
+ (id)getBestGroupWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

@end
