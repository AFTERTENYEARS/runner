//
//  NetAPI.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//


//#define BASE_URL @"http://www.xxproject.com:9081"
#define BASE_URL @"http://192.168.2.134:9081"

//获取注册验证码
#define api_code @"/api/code"
//注册
#define api_register @"/api/register"
//登录
#define api_login @"/api/login"


//手机注册验证码
#define retail_register_code @"/vba-api/retail/member/register/code"
//注册
#define retail_register @"/vba-api/retail/member/register"
//登录
#define retail_login @"/vba-api/retail/member/login"
//手机登录验证码
#define retail_login_code @"/vba-api/retail/member/login/code"

//修改用户信息
#define retail_member_userinfo @"/vba-api/retail/member/update/public/info"
