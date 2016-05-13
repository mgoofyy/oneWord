//
//  GFHTTPManger+GFLoginRAC.h
//  oneWord
//
//  Created by goofygao on 5/13/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHTTPManger.h"

@interface GFHTTPManger (GFLoginRAC)
/**
 *  登陆
 *
 *  @param urlString 基础登陆的url
 *  @param params    参数
 *
 *  @return 信号
 */
+ (RACSignal *)rac_login:(NSString *)urlString
                  params:(NSDictionary *)params;

@end
