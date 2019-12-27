//
//  NSString+DateFormat.h
//  DateExample
//
//  Created by runner on 2019/09/01.
//  Copyright © 2019年 runner All rights reserved.

#import <Foundation/Foundation.h>

@interface NSString (DateFormat)

//时间字符串2017-04-16 13:08:06 ->转换

#pragma mark -年月日

/**
 *  x年x月x日
 */
@property(nonatomic,copy,readonly)NSString *l_formatNianYueRi;

/**
 *  x年x月
 */
@property(nonatomic,copy,readonly)NSString *l_formatNianYue;

/**
 *  x月x日
 */
@property(nonatomic,copy,readonly)NSString *l_formatYueRi;

/**
 *  x年
 */
@property(nonatomic,copy,readonly)NSString *l_formatNian;
/**
*  x月
*/
@property(nonatomic,copy,readonly)NSString *l_formatYue;
/**
*  x日
*/
@property(nonatomic,copy,readonly)NSString *l_formatRi;
/**
 *  x时x分x秒
 */
@property(nonatomic,copy,readonly)NSString *l_formatShiFenMiao;

/**
 *  x时x分
 */
@property(nonatomic,copy,readonly)NSString *l_formatShiFen;

/**
 *  x分x秒
 */
@property(nonatomic,copy,readonly)NSString *l_formatFenMiao;

/**
 *  yyyy-MM-dd HH:mm:ss
 */
@property(nonatomic,copy,readonly)NSString *l_format_yyyy_MM_dd_HH_mn_ss;

/**
 *  yyyy-MM-dd
 */
@property(nonatomic,copy,readonly)NSString *l_format_yyyy_MM_dd;

/**
 *  yyyy-MM
 */
@property(nonatomic,copy,readonly)NSString *l_format_yyyy_MM;

/**
 *  MM-dd
 */
@property(nonatomic,copy,readonly)NSString *l_format_MM_dd;

/**
 *  yyyy
 */
@property(nonatomic,copy,readonly)NSString *l_format_yyyy;

/**
 *  HH:mm:ss
 */
@property(nonatomic,copy,readonly)NSString *l_format_HH_mm_ss;

/**
 *  HH:mm
 */
@property(nonatomic,copy,readonly)NSString *l_format_HH_mm;

/**
 *  mm:ss
 */
@property(nonatomic,copy,readonly)NSString *l_format_mm_ss;

#pragma mark - 转换为星期几
@property(nonatomic,copy,readonly)NSString *l_formatWeekDay;

@end
