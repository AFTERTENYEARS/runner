//
//  Regex.h
//  runner
//
//  Created by runner on 2019/9/12.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#ifndef Regex_h
#define Regex_h

#define regex_email @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"\
@"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"\
@"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"\
@"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"\
@"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"\
@"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"\
@"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

#define regex_mobile @"^1+[3578]+\\d{9}"
#define regex_vercationCode @"\\d{6}"
#define regex_idCard @"^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$"
#define regex_bankCard @"\\d{16}"

#define REGEX_MATCHING(regex,string) ([[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@" , regex] evaluateWithObject:string])

#endif /* Regex_h */
