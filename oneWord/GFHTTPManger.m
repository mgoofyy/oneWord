//
//  GFHTTPManger.m
//  oneWord
//
//  Created by goofygao on 5/12/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHTTPManger.h"

@implementation GFHTTPManger

+ (AFHTTPSessionManager *)manger {
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    return manger;
}

+ (NSString *)fullUrlString:(NSString *)urlString {
    return [APIRootBsseURL stringByAppendingString:urlString];
}

+ (NSURLSessionTask *)POST:(NSString *)urlString
                    params:(NSDictionary *)params
                  progress:(NSProgress *)progress
                completion:(void(^)(BOOL success, id userInfo))completion
                   success:(void(^)(BOOL success,id userInfo))success
                      fail:(void(^)(BOOL fail, NSError *error))fail {
    
//    [GFHTTPManger manger] POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        uploadProgress = progress;
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }
    
}


@end
