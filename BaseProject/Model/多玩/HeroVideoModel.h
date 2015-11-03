//
//  HeroVideoModel.h
//  BaseProject
//
//  Created by ios－04 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@class Esarray;
@interface HeroVideoModel : BaseModel

@property (nonatomic, copy) NSString *coverUrl;

@property (nonatomic, copy) NSString *udb;

@property (nonatomic, copy) NSString *channelId;

@property (nonatomic, copy) NSString *uploadTime;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *letvVideoUnique;

@property (nonatomic, copy) NSString *letvVideoId;

@property (nonatomic, assign) NSInteger videoLength;

@property (nonatomic, assign) NSInteger totalPage;

@end

