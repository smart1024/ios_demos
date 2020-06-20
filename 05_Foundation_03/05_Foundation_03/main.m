//
//  main.m
//  05_Foundation_03
//
//  Created by lilin on 2020/6/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //打印出指定网页内容 stringWithContentOfUrl
        NSURL* url = [NSURL URLWithString:@"http://www.99ios.com"];
        NSString* stringContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"the string content of 99ios.com %@",stringContent);
        
        NSLog(@"=============================================================");
        //使用NSData打印出网页内容 dataWithContentOfUrl
        NSData* dataContent = [NSData dataWithContentsOfURL:url];
        
        //返回的内容是以编码形式显示
        NSLog(@"the data content of 99ios.com %@",dataContent);
    }
    return 0;
}
