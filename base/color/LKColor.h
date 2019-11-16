//
//  LKColor.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#ifndef LKColor_h
#define LKColor_h

#import "UIColor+TFT.h"
#define COLOR_A(HEX, ALPHA) [UIColor colorWithRGBHexString:HEX alpha:ALPHA]
#define COLOR(HEX) COLOR_A(HEX, 1.0)

#define COLOR_RANDOM [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0f]

#define COLOR_ALPHA(COLOR, ALPHA) [UIColor colorWithAlpha:COLOR alpha:ALPHA]

#endif /* LKColor_h */
