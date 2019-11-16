//
//  NSString+DateFormat.m
//  DateExample
//
//  Created by runner on 2019/09/01.
//  Copyright © 2019年 runner. All rights reserved.

#import "NSString+DateFormat.h"
#import "NSDate+DateFormat.h"

@implementation NSString (DateFormat)

-(NSString *)l_formatNianYueRi
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年%02ld月%02ld日",date.year,date.month,date.day];
}
-(NSString *)l_formatNianYue
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年%02ld月",date.year,date.month];
}
-(NSString *)l_formatYueRi
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld月%02ld日",date.month,date.day];
}
-(NSString *)l_formatNian
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年",date.year];
}
-(NSString *)l_formatShiFenMiao
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld时%02ld分%02ld秒",date.hour,date.minute,date.seconds];
}
-(NSString *)l_formatShiFen
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld时%02ld分",date.hour,date.minute];
}
-(NSString *)l_formatFenMiao
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld分%02ld秒",date.minute,date.seconds];
}
-(NSString *)l_format_yyyy_MM_dd_HH_mn_ss
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld:%02ld",date.year,date.month,date.day,date.hour,date.minute,date.seconds];
}
-(NSString *)l_format_yyyy_MM_dd
{
   NSDate *date = [NSDate l_dateWithDateString:self];
   return [NSString stringWithFormat:@"%ld-%02ld-%02ld",date.year,date.month,date.day];
}
-(NSString *)l_format_yyyy_MM
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld-%02ld",date.year,date.month];
}
-(NSString *)l_format_MM_dd
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld-%02ld",date.month,date.day];
}
-(NSString *)l_format_yyyy
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld",date.year];
}
-(NSString *)l_format_HH_mm_ss
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",date.hour,date.minute,date.seconds];
}
-(NSString *)l_format_HH_mm
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld",date.hour,date.minute];
}
-(NSString *)l_format_mm_ss
{
    NSDate *date = [NSDate l_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld",date.minute,date.seconds];
}

-(NSString *)l_formatWeekDay
{
    NSString *weekStr=nil;
    NSDate *date = [NSDate l_dateWithDateString:self];
    switch (date.weekday) {
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        case 7:
            weekStr = @"星期六";
            break;
        case 1:
            weekStr = @"星期天";
            break;
        default:
            break;
    }
    return weekStr;
}
@end
