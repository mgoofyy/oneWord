//
//  GFHTTPManger+GFLogin.m
//  oneWord
//
//  Created by goofygao on 5/13/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHTTPManger+GFLogin.h"

@implementation GFHTTPManger (GFLogin)

+ (NSURLSessionTask *)login_POST:(NSString *)urlString params:(NSDictionary *)params completion:(void (^)(BOOL success,id userinfo))completion {
    //此处做一些参数的处理
   return [GFHTTPManger POST_BASE:urlString parameters:params responseKeys:@[@"error",@"token",@"profile"] autoRun:YES progress:nil completion:completion];
}

@end
