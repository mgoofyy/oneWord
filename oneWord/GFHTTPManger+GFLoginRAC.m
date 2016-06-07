//
//  GFHTTPManger+GFLoginRAC.m
//  oneWord
//
//  Created by goofygao on 5/13/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHTTPManger+GFLoginRAC.h"
#import "GFHTTPManger+GFLogin.h"

typedef void (^GFCompletionBlock)(BOOL success, id userinfo);
@implementation GFHTTPManger (GFLoginRAC)

+ (RACSignal *)rac_login:(NSString *)urlString params:(NSDictionary *)params {

    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionTask *task = [self POST:urlString parameters:params responseKeys:@[@"data"] autoRun:YES progress:nil completion:^(BOOL success, id userinfo) {
            [subscriber sendNext:userinfo];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }] replayLazily];

}

@end
