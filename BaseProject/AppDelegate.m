//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "BaseNetManager.h"
#import "TuWanBaseModel.h"
#import "RankingListModel.h"
#import "XiMaNetManager.h"
#import "TuWanNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];

//    NSString *path = @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1";
//    NSString *path = @"http://cache.tuwan.com/app/";
//    NSDictionary *parmas = @{@"appid" : @1,@"class":@"heronews",@"mod" : @"八卦",@"appver":@2.1};
//    [BaseNetManager GET:path parameters:parmas completionHandler:^(id responseObj, NSError *error) {
//        TuWanBaseModel *model = [TuWanBaseModel objectWithKeyValues:responseObj];
//        DDLogVerbose(@"ssssss");
//    }];
    
    //喜码
    [XiMaNetManager getRankingListWithPageId:1 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"sssss"); //
        
    }];
    [XiMaNetManager getAlbumWithId:3092772 pageId:1 completionHandle:^(id model, NSError *error) {
        
        DDLogVerbose(@"ssss"); //需要添加text/plain
    }];
    //兔玩
    [TuWanNetManager getTuWanWithInfoType:InfoTypeCOS start:0 completionHandle:^(id model, NSError *error) {
        
        DDLogVerbose(@"sssss");
    }];
    
    //还没有测试

    return YES;
}

@end
