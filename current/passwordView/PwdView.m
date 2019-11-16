//
//  PwdView.m
//  runner
//
//  Created by runner on 2019/11/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PwdView.h"

@interface PwdView ()<UITextFieldDelegate>

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, strong) NSMutableArray<UILabel *> *char_label_array;

@property (nonatomic, strong) UITextField *pwdTF;

@property (nonatomic, strong) NSString *pwd;

@end

@implementation PwdView

- (instancetype)initWithLength: (NSInteger)length pwdCallback: (PwdCallback)pwdCallback {
    self = [super init];
    if (self) {
        self.char_label_array = [NSMutableArray new];
        self.length = length;
        self.pwdCallBack = pwdCallback;
        [self customUI];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)customUI {
    self.frame = CGRectMake(0, 0, 44.0 * _length, 44.4);
    
    //背景色
    self.backgroundColor = FAFAFA;
    
    //画边框
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = E94F4f.CGColor;
    
    self.layer.masksToBounds = YES;
    
    //画线
    for (NSInteger i = 1; i < self.length; i++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(i * 44.0, 0, 0.5, 44)];
        line.backgroundColor = COLOR(@"cccccc");
        [self addSubview:line];
    }
    
    //绘制label
    for (NSInteger i = 0; i < self.length; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * 44.0, 0, 44.0, 44.0)];
        label.text = @"";
        label.font = [UIFont systemFontOfSize:25];
        label.textColor = COLOR(@"333333");
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        [self.char_label_array addObject:label];
    }
    
    //隐藏的密码输入框
    self.pwdTF = [[UITextField alloc] init];
    self.pwdTF.frame = CGRectMake(0, 44, 200, 44);
    self.pwdTF.keyboardType = UIKeyboardTypeNumberPad;
    self.pwdTF.delegate = self;
    [self.pwdTF addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    
    [self addSubview:self.pwdTF];
    
    [self.pwdTF becomeFirstResponder];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [button addTarget:self action:@selector(input) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)input {
    [self.pwdTF becomeFirstResponder];
}

- (void)textFieldDidChange{
    self.pwd = self.pwdTF.text;
    [self fillPwd];
}

- (void)fillPwd {
    //NSLog(@"%@", self.pwd);
    
    //已经输入的密码
    NSMutableArray *char_array = [NSMutableArray new];
    for (NSInteger i = 0; i < self.pwd.length; i++) {
        char num = [self.pwd characterAtIndex:i];
        [char_array addObject:[NSString stringWithFormat:@"%c",num]];
    }
    
    //填充密码
    for (NSInteger i = 0; i < char_array.count; i++) {
        UILabel *char_Label = self.char_label_array[i];
        NSString *the_char = [NSString stringWithFormat:@"%@",char_array[i]];
        the_char = @"＊";
        char_Label.text = the_char;
    }
    
    for (NSInteger i = self.pwd.length; i < self.length; i++) {
        UILabel *char_Label = self.char_label_array[i];
        char_Label.text = @"";
    }
    
    if (self.pwd.length == self.length && self.pwdCallBack) {
        self.pwdCallBack(self.pwd);
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location > self.length - 1) {
        return NO;
    }
    return [self validateNumber:string];
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    
    return res;
}


@end
