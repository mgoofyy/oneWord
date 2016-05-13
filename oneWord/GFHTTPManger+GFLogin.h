//
//  GFHTTPManger+GFLogin.h
//  oneWord
//
//  Created by goofygao on 5/13/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHTTPManger.h"

@interface GFHTTPManger (GFLogin)

+ (NSURLSessionTask *)login_POST:(NSString *)urlString
                          params:(NSDictionary *)params
                      completion:(void (^)(BOOL success,id userinfo))completion;

@end
