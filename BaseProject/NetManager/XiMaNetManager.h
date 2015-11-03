//
//  XiMaNetManager.h
//  BaseProject
//
//  Created by ios－04 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#define kRankingListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album" //音乐分类列表
#define kAlbumPath @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"
@interface XiMaNetManager : BaseNetManager
+ (id)getRankingListWithPageId:(NSInteger)pageId kCompletionHandle;
+ (id)getAlbumWithId:(NSInteger)Id pageId:(NSInteger)pageId kCompletionHandle;
@end
