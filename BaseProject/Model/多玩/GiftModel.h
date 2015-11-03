//
//  GiftModel.h
//  BaseProject
//
//  Created by ios－04 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface GiftModel : BaseModel
@property (nonatomic,strong)  NSArray *a;
@property (nonatomic,strong)  NSArray *d;
@property (nonatomic,strong)  NSArray *g;
@end

@interface GiftAModel :BaseModel
@property (nonatomic,strong)  NSString *ID; //id
@property (nonatomic,strong)  NSString *name;
@property (nonatomic,strong)  NSArray *level;
@end