//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

//把path写到文件头部，方便下次使用
#define kHeroPath @"http://lolbox.duowan.com/phone/apiHeroes.php" //免费+全部英雄
#define kHeroSkipPath @"http://box.dwstatic.com/apiHeroSkin.php" //皮肤

#define kHeroSounds @"http://box.dwstatic.com/apiHeroSound.php"  //英雄配音
#define kHeroVideo @"http://box.dwstatic.com/apiVideoesNormalDuowan.php" //英雄视频

#define kHeroCZ @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php" //英雄出装

#define  kHeroDetail @"http://lolbox.duowan.com/phone/apiHeroDetail.php" //英雄资料

#define kHeroChange @"http://db.duowan.com/boxnews/heroinfo.php" //英雄改动

#define kHeroWeek @"http://183.61.12.108/apiHeroWeekData.php" //英雄周数据

#define kHeroToolMenu @"http://box.dwstatic.com/apiToolMenu.php" //英雄游戏百科列表
#define kHeroZB @"http://lolbox.duowan.com/phone/apiZBCategory.php" //装备分类
#define kHeroZBitemList @"http://lolbox.duowan.com/phone/apiZBItemList.php" //某分类装备列表


#define kHeroGiftAndRunPath @"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php" //天赋和符文
#define kHeroItemDetail @"http://lolbox.duowan.com/phone/apiItemDetail.php" //装备详情
#define kHeroGft @"http://lolbox.duowan.com/phone/apiGift.php" //天赋
#define kHeroRune @"http://lolbox.duowan.com/phone/apiRunes.php" //符文列表
#define kHeroSumAbility @"http://lolbox.duowan.com/phone/apiSumAbility.php" //召唤师技能列表
#define kHeroBestGroup @"http://box.dwstatic.com/apiHeroBestGroup.php" //最佳阵容
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
