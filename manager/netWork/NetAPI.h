//
//  NetAPI.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//


//#define BASE_URL @"http://www.xxproject.com:9081"
#define BASE_URL @"http://192.168.2.134:9081"
#define BASE_IMAGE_URL @"http://192.168.2.109:8080"

//获取注册验证码
#define api_code @"/api/code"
//注册
#define api_register @"/api/register"
//登录
#define api_login @"/api/login"

//http://192.168.2.109:8080/vba-api/vba-admin/statics/images/1574212977144.jpg

//MARK:！！！登录注册
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
//添加(编辑)收货地址
#define retail_member_address_addOrUpdate @"/vba-api/retail/member/address/addOrUpdate"
//设置默认地址
#define retail_member_address_set_default @"/vba-api/retail/member/address/setDefault/%@"
//收货地址列表
#define retail_member_address_list @"/vba-api/retail/member/address/list"
//获取默认地址
#define retail_member_address_get_default @"/vba-api/retail/member/address/getDefault/"
//删除地址
#define retail_member_address_delete @"/vba-api/retail/member/address/delete/%@"
//客服列表
#define retail_member_css @"/vba-api/retail/member/get/ccs"
//机具列表
#define retail_device_list @"/vba-api/retail/device/list"
//订单列表
#define retail_order_list @"/vba-api/retail/device/order/list"
//我的政策
#define retail_member_policy @"/vba-api/retail/member/myPolicy"
//实名认证
#define retail_member_name_auth @"/vba-api/retail/member/name/auth"


//MARK:！！！首页
//提交订单
#define retail_device_submit_order @"/vba-api/retail/device/order/submission"
//订单详情  orderId
#define retail_device_order_detail @"/vba-api/retail/device/order/list/detail/%@"
//机型列表
#define retail_device_list_show @"/vba-api/retail/device/list/show"
//机具绑定
#define retail_bind_devicesn @"/vba-api/retail/bind/member/devicesn"
//机具绑定列表
#define retail_bind_list @"/vba-api/retail/bind/member/list"

//MARK:！！！团队
//我的团队
#define retail_wallet_team @"/vba-api/retail/wallet/myTeam"
//级别推荐
#define retail_wallet_level_recommend @"/vba-api/retail/wallet/%ld/recommend"
//级别推荐 会员详情 memberId
#define retail_wallet_level_statistics_member @"/vba-api/retail/wallet/statistics/%@"
//数据统计 0 年 1 近一周 2 近半年
#define retail_wallet_myDataStatistics_type @"/vba-api/retail/wallet/myDataStatistics/%@"

//MARK:！！！我的
//余额
#define retail_wallet_balance @"/vba-api/retail/wallet/balance"
//申请提现
#define retail_wallet_cashWithdrawal @"/vba-api/retail/wallet/cashWithdrawal"
//收入（我的明细）
#define retail_wallet_myDetailed @"/vba-api/retail/wallet/myDetailed"
//支出（提现记录）
#define retail_wallet_log @"/vba-api/retail/wallet/log"
//我的推荐人
#define retail_my_recommender @"/vba-api/retail/member/getMyRecommender"
//收益记录
#define retail_wallet_profitRecord @"/vba-api/retail/wallet/profitRecord/%@"
//订单收益
#define retail_order_profit @"/vba-api/retail/order/profit/list"
//其他收益
#define retail_other_profit @"/vba-api/retail/other/profit/list"


#define key_freight @"freight"
