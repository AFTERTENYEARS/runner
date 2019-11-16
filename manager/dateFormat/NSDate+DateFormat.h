//
//  NSDate+DateFormat.h
//  DateFormat
//
//  Created by runner on 2019/09/01
//  Copyright © runner All rights reserved.

#import <Foundation/Foundation.h>

@interface NSDate (DateFormat)

@property(nonatomic,assign,readonly)NSInteger year;
@property(nonatomic,assign,readonly)NSInteger month;
@property(nonatomic,assign,readonly)NSInteger day;
@property(nonatomic,assign,readonly)NSInteger hour;
@property(nonatomic,assign,readonly)NSInteger minute;
@property(nonatomic,assign,readonly)NSInteger seconds;
@property (nonatomic,assign,readonly)NSInteger weekday;

+(NSDate *)l_dateWithDateString:(NSString *)dateString;

+(NSDate *)l_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:(NSString *)string;
+(NSDate *)l_dateWithFormat_yyyy_MM_dd_HH_mm_string:(NSString *)string;
+(NSDate *)l_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string;
+(NSDate *)l_dateWithFormat_yyyy_MM_dd_string:(NSString *)string;
+(NSDate *)l_dateWithFormat_yyyy_MM_string:(NSString *)string;

@end
