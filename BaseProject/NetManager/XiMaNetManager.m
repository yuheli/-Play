//
//  XiMaNetManager.m
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"
@implementation XiMaNetManager
+(id)getRankingListWithPageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{@"device" : @"iPhone",@"key":@"ranking:album:played:1:2",@"pageId":@(pageId),@"pageSize":@20,@"position":@0,@"title":@"排行榜"};
    return [BaseNetManager GET:kRankingListPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        
//        RankingListModel *model = [RankingListModel objectWithKeyValues:responseObj];
        completionHandle([RankingListModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getAlbumWithId:(NSInteger)Id pageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{@"device":@"iPhone"};
    NSString *path = [NSString stringWithFormat:kAlbumPath,@(Id),@(pageId)];
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([AlbumModel objectWithKeyValues:responseObj],error);
    }];
}
@end
