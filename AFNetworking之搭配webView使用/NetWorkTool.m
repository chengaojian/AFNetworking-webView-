//
//  NetWorkTool.m
//  AFNetworking之搭配webView使用
//
//  Created by 陈高健 on 15/11/24.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool

static NetWorkTool *_instance;
+ (instancetype)sharedNetWorkTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[NetWorkTool alloc] initWithBaseURL:nil];
        
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        
        //默认情况下的响应解析方式,就是不管服务器给我们返回的是什么,都按照JSON去解析
        //将默认的JSON序列化方式,改成我们最普通的二进制
        _instance.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    
    return _instance;
}
@end
