//
//  NetValue.m
//  runner
//
//  Created by runner on 2019/9/4.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "NetValue.h"

@implementation NetValue

- (void)setUrl:(NSString *)url {
    if (Is_Null(url)) {
        _url = @"";
    } else {
        _url = url;
    }
}

- (void)setParameters:(NSDictionary *)parameters {
    if (Is_Null(parameters)) {
        _parameters = @{};
    } else {
        _parameters = parameters;
    }
}

- (void)setStatusCode:(NSInteger)statusCode {
    _statusCode = statusCode;
}

- (void)setCode:(NSInteger)code {
    _code = code;
}

- (void)setBody:(NSDictionary *)body {
    if (Is_Null(body)) {
        _body = @{};
    } else {
        _body = body;
    }
}

- (void)setMsg:(NSString *)msg {
    if (Is_Null(msg)) {
        _msg = @"未知异常";
    } else {
        _msg = msg;
    }
}

-(NSDictionary *)toDictionary {
    NSDictionary *netValueDic = @{@"url" : self.url,
                                  @"parameters" : self.parameters,
                                  @"success" : @(_success),
                                  @"statusCode" : @(_statusCode),
                                  @"code" : @(_code),
                                  @"body" : _body,
                                  @"msg" : _msg
    };
    return netValueDic;
}

- (NSString *)toJSON {
    return Json_By_Dic(self.toDictionary);
}

@end
