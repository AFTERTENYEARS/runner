//
//  JSONDdta.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#ifndef JSONData_h
#define JSONData_h

//json、model和dic之间转换
#define Json_By_Dic(dic) [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]
#define Json_By_Model(model) [model respondsToSelector:@selector(toDictionary)] ? [NetWork jsonFromDic:[model performSelector:@selector(toDictionary)] == nil ? [[NSDictionary alloc] init] : (NSDictionary *)[model performSelector:@selector(toDictionary)]] : @""
#define Dic_By_Json(json) [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil]
#define Dic_By_Model(json) [NSJSONSerialization JSONObjectWithData:[([model respondsToSelector:@selector(toDictionary)] ? [NetWork jsonFromDic:[model performSelector:@selector(toDictionary)] == nil ? [[NSDictionary alloc] init] : (NSDictionary *)[model performSelector:@selector(toDictionary)]] : @"") dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil]

#endif /* JSONData_h */
