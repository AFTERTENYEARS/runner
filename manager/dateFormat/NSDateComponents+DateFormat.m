//
//  NSDateComponents+DateFormat.m
//  DateFormat
//
//  Created by runner on 2019/09/01.
//  Copyright © 2019 runner All rights reserved.

#import "NSDateComponents+DateFormat.h"

@implementation NSDateComponents (DateFormat)

+(NSDateComponents *)l_dateComponentsFromDate:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal fromDate:date];
    return components;
    
}

@end
