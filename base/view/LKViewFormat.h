//
//  LKViewFormat.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "UIView+Extension.h"

#ifndef LKViewFormat_h
#define LKViewFormat_h

#define Screen_Width                [[UIScreen mainScreen] bounds].size.width
#define Screen_Height              [[UIScreen mainScreen] bounds].size.height
#define Screen_Bounds               [UIScreen mainScreen].bounds

#define Status_Bar_Height           (([[UIScreen mainScreen] bounds].size.height == 812.0f || [[UIScreen mainScreen] bounds].size.height == 896.0f) ? 44.0f : 20.0f)
#define Nav_Bar_Height        44.0f
#define Status_Nav_Bar_Height       (Status_Bar_Height + Nav_Bar_Height)
#define Tabbar_Height               49.0f
#define Control_Bar_Height           (([[UIScreen mainScreen] bounds].size.height == 812.0f || [[UIScreen mainScreen] bounds].size.height == 896.0f) ? 34.0f : 0.0f)

#define View_Width(view)            view.frame.size.width
#define View_Height(view)           view.frame.size.height
#define View_X(view)                view.frame.origin.x
#define View_Y(view)                view.frame.origin.y
#define View_Left(view)             view.frame.origin.x
#define View_Top(view)              view.frame.origin.y
#define View_Bottom(view)           CGRectGetMaxY(view.frame)
#define View_Right(view)            CGRectGetMaxX(view.frame)


#endif /* LKViewFormat_h */
