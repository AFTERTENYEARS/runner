//
//  NSDate+DateFormat.m
//  DateFormat
//
//  Created by runner on 2019/09/01
//  Copyright © runner All rights reserved.

#import "NSDate+DateFormat.h"
#import "NSDateComponents+DateFormat.h"

@implementation NSDate (DateFormat)

-(NSInteger)year
{
    NSDateComponents *components = [NSDateComponents l_dateComponentsFromDate:self];
    return components.year;
}
- (NSInteger) month
{
    NSDateComponents *components =  [NSDateComponents l_dateComponentsFromDate:self];
    return components.month;
}

- (NSInteger) day
{
    NSDateComponents *components =  [NSDateComponents l_dateComponentsFromDate:self];
    return components.day;
}

- (NSInteger) hour
{
    NSDateComponents *components =  [NSDateComponents l_dateComponentsFromDate:self];
    return components.hour;
}

- (NSInteger) minute
{
    NSDateComponents *components = [NSDateComponents l_dateComponentsFromDate:self];
    return components.minute;
}

- (NSInteger) seconds
{
    NSDateComponents *components =  [NSDateComponents l_dateComponentsFromDate:self];
    return components.second;
}

- (NSInteger) weekday
{
    NSDateComponents *components =  [NSDateComponents l_dateComponentsFromDate:self];
    return components.weekday;
}

+(NSDate *)l_dateWithDateString:(NSString *)dateString
{
    NSDate *date = nil;
    date = [self l_dateWithFormat_yyyy_MM_dd_HH_mm_ss_SSSZ_string:dateString];
    if(date) return date;
    date = [self l_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:dateString];
    if(date) return date;
    date = [self l_dateWithFormat_yyyy_MM_dd_HH_mm_string:dateString];
    if(date) return date;
    date = [self l_dateWithFormat_yyyy_MM_dd_HH_string:dateString];
    if(date) return date;
    date = [self l_dateWithFormat_yyyy_MM_dd_string:dateString];
    if(date) return date;
    date = [self l_dateWithFormat_yyyy_MM_string:dateString];
    if(date) return date;
    return nil;
}

+(NSDate *)l_dateWithFormat_yyyy_MM_dd_HH_mm_ss_SSSZ_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+(NSDate *)l_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+(NSDate *)l_dateWithFormat_yyyy_MM_dd_HH_mm_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+(NSDate *)l_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+(NSDate *)l_dateWithFormat_yyyy_MM_dd_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+(NSDate *)l_dateWithFormat_yyyy_MM_string:(NSString *)string
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}
@end
