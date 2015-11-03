//
//  TuWanBaseModel.m
//  BaseProject
//
//  Created by ios－04 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanBaseModel.h"

@implementation TuWanBaseModel



//+(NSDictionary *)objectClassInArray
//{
//    return @{@"indexpic" : [TuWanDataIndexpicModel class],@"list":[TuWanDataListModel class]};
//}
@end
@implementation TuWanDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"indexpic" : [TuWanDataIndexpic class], @"list" : [TuWanDataIndexpic class]};
}

@end


@implementation TuWanDataIndexpic

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanDataIndexpicShowitemModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"typeName" : @"typename",@"desc" : @"description"};
}
@end


@implementation TuWanDataIndexpicInfochildModel

@end


@implementation TuWanDataIndexpicShowitemModel

@end


@implementation TuWanDataIndexpicShowitemInfoModel

@end






