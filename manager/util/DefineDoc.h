//
//  DefineDoc.h
//  runner
//
//  Created by runner on 2019/9/4.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#ifndef DefineDoc_h
#define DefineDoc_h

//自定义输出
#define DeBug 1
#define LKDLog(...) if (DeBug) {NSLog(@"%s\n %@\n\n", __func__, [NSString stringWithFormat:__VA_ARGS__]);} else {}

#define Is_Null(obj) [obj isEqual:[NSNull null]] || obj == nil ? YES : NO

#define Image_By_Name(name) [UIImage imageNamed:name]

#define Lk_Image(imageView, url)  [imageView sd_setImageWithURL:[NSURL URLWithString:url]

//加载xib
#define View_By_Xib(xibName) [[[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil] lastObject]
#define Views_By_Xib(xibName) [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil]

#define Int_By_Obj(obj,key) ([obj objectForKey:key] == [NSNull null] || [obj objectForKey:key]== nil ? 0 : (long)[[obj objectForKey:key] integerValue])
#define Float_By_Obj(obj,key) ([obj objectForKey:key] == [NSNull null] || [obj objectForKey:key]== nil ? 0.0 : [[obj objectForKey:key] doubleValue])
#define Value_By_Obj(obj,key) ([obj objectForKey:key] == [NSNull null] || [obj objectForKey:key]== nil ? nil : [obj objectForKey:key])
#define String_By_Obj(obj,key) [NSString stringWithFormat:@"%@",([obj objectForKey:key] == [NSNull null] || [obj objectForKey:key]== nil ? @"" : [obj objectForKey:key])]
#define DELAY_EXECUTE(time,method) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time/*延迟执行时间*/ * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
    method;\
    });

#define Step_1 @"caigou-shenqing"
#define Step_2 @"caigou-fukuan"
#define Step_3 @"caigou-over"


#define Notification_ReceiveMsg @"receiveMsg"


#endif /* DefineDoc_h */
