//
//  VersionUpdateView.m
//  runner
//
//  Created by runner on 2019/12/9.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "VersionUpdateView.h"

@implementation VersionUpdateView

- (void)setContent:(NSString *)content {
    _content = content;
    
    DELAY_EXECUTE(0.2,
                  self.contentLabel.text = content;
                  
                  [self.contentLabel sizeToFit];
                  self.frame = CGRectMake(self.x, self.y, self.width, 155.5 + self.contentLabel.height);
                      
                  [self layoutIfNeeded];
                  [self setNeedsLayout];
                  );
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
