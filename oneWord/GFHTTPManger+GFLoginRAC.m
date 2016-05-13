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
    return
    [GFHTTPManger createSignal:^NSURLSessionTask *(GFCompletionBlock completion) {
        return [GFHTTPManger login_POST:<#(NSString *)#> params:params completion:completion];
    }];
}

@end
