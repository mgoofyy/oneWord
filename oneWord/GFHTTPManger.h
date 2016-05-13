//
//  GFHTTPManger.h
//  oneWord
//
//  Created by goofygao on 5/12/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFHTTPManger : NSObject


+ (NSURLSessionTask *)POST_BASE:(NSString *)urlString
                parameters:(NSDictionary *)parameters
              responseKeys:(id)responseKeys
                   autoRun:(BOOL)autoRun
                  progress:(void(^)(NSProgress *))progress
                completion:(void(^)(BOOL success, id userinfo))completion;
@end
