//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
typedef NS_ENUM(NSUInteger,type){
    typeFree,
    typeAll
};
@interface DuoWanNetManager : BaseNetManager
+ (id)getDuoWanDataWithPath:(NSString *)path type:(type)heroType kCompletionHandle;
+ (id)getHeroSkipWithHero:(NSString *)heroName kCompletionHandle;
//英雄ViDeo
+ (id)getHeroVideoWithHero:(NSString *)heroName pID:(NSInteger)p kCompletionHandle;

+ (id)getHeroCZWithHeroName:(NSString *)heroName limit:(NSInteger)limit kCompletionHandle;

+ (id)getHeroDetailWithHeroName:(NSString *)heroName kCompletionHandle;

+ (id)getHeroChangeWithHeroName:(NSString *)heroName kCompletionHandle;

+ (id)getHeroWeekWithHerold:(NSInteger)herold kCompletionHandle;

+ (id)getHeroToolMenuWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

+ (id)getHeroZBCategoryWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

+ (id)getHeroZBItemWithWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

+ (id)getHeroItemDetailWithID:(NSString *)ID kCompletionHandle;

+ (id)getGiftWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

+ (id)getRunesWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

+ (id)getHeroSumAbilityWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

+ (id)getBestGroupWithCompletionHandle:(void (^)(id model,NSError *error))completionHandle;

@end
