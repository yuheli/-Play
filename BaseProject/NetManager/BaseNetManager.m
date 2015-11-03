//
//  BaseNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    });
    return manager;
}
/**
http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1
path: http://cache.tuwan.com/app/
params:@{@"appid" : @1,@"class":@"heronews",@"mod" : @"八卦",@"appver":2.1};中文
 
 直接整体传，或加上字典参数
*/

//把path和参数拼接起来。把字符串的中文转化为百分号形式，因为有的服务器不接受中文编码
+ (NSString *)percentPathWithpath:(NSString *)path parmas:(NSDictionary *)params
{
//     for (int i = 0; i<keys.count; i++) {
//   假设for循环1000次，[params allkeys]会调用1000次，oc语言特性是runtime，实际上调用的方法是在底层调用方法名所在的地址，调用完毕后把这个方法放到常用方法列表里（列表存的是许多方法），如果再次执行某个方法就在常用方法列表搜索调用，效率更高
//}
    NSMutableString *str = [NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;
    for (int i = 0; i<count; i++) {
        if (i==0) {
            [str appendFormat:@"?%@=%@",keys[i],params[keys[i]]];
        }else{
            [str appendFormat:@"&%@=%@",keys[i],params[keys[i]]];
        }
    }
    //把字符串的中文转为百分号
    return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
//    return str;
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    
//    path = [self percentPathWithpath:path parmas:params];
    //打印网络请求， DDLog  与  NSLog 功能一样
    DDLogVerbose(@"Request Path: %@, Params:%@", path, params);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}

+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}



@end
