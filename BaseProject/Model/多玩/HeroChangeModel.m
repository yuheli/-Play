//
//  HeroChangeModel.m
//  BaseProject
//
//  Created by ios－04 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroChangeModel.h"

@implementation HeroChangeModel
+ (NSDictionary *)objectClassInArray{
    return @{@"changeLog" : [HeroChangeChangelogModel class]};
}
@end
@implementation HeroChangeChangelogModel



@end