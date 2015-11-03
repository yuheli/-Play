//
//  HeroVideoModel.m
//  BaseProject
//
//  Created by ios－04 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroVideoModel.h"

@implementation HeroVideoModel
+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"totalPage"] || [propertyName isEqualToString:@"channelId"]) {
        return propertyName;
    }
    
    //驼峰转下划线
    return [propertyName underlineFromCamel];
}
@end


