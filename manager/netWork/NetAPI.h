//
//  NetAPI.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//


//#define BASE_URL @"http://www.xxproject.com:9081"

//https://www.klz888.com/sprogram/navigateimage.png

#ifndef config_h
#define config_h

#ifndef NETWORK_ENVIRONMENT
#define NETWORK_ENVIRONMENT 0   //0:生产环境 1:测试环境
#endif

#if NETWORK_ENVIRONMENT==0
#define BASE_URL @"https://www.klz888.com"
#define BASE_IMAGE_URL @"https://www.klz888.com"

#elif NETWORK_ENVIRONMENT==1
#define BASE_URL @"http://192.168.2.134:9081"
#define BASE_IMAGE_URL @"http://192.168.2.109:8080"

#endif
#endif


//获取注册验证码
#define api_code @"/api/code"
//注册
#define api_register @"/api/register"
//登录
#define api_login @"/api/login"

//http://192.168.2.109:8080/vba-api/vba-admin/statics/images/1574212977144.jpg

//版本配置
#define retail_config_version @"/vba-api/retail/config/version"


