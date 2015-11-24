//
//  ViewController.m
//  AFNetworking之搭配webView使用
//
//  Created by 陈高健 on 15/11/24.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkTool.h"

@interface ViewController ()
//WebView
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebView];
}

- (void)loadWebView{
    //1.获取我们NetWorkTool的单例
    NetWorkTool *netWorkTool = [NetWorkTool sharedNetWorkTool];
    
    //2.发送GET请求  //html
    __weak typeof(self) weakSelf = self;
    [netWorkTool GET:@"http://www.baidu.com" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"result===%@----%@",responseObject,[NSThread currentThread]);
        
        //再将我们返回的二进制,转成我们字符串,反序列化
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        //在主线程更新UI
        [weakSelf.webView loadHTMLString:html baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error===%@",[error localizedDescription]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
