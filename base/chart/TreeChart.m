//
//  TreeChart.m
//  runner
//
//  Created by runner on 2019/10/17.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "TreeChart.h"

@interface TreeChart ()

@property (nonatomic, assign) NSInteger dimensional;
@property (nonatomic, strong) NSMutableArray *nodeCount;
@property (nonatomic, strong) NSMutableArray *nodeGroup;
@property (nonatomic, strong) NSMutableArray *pointsGroup;

@end

@implementation TreeChart

#pragma mark - 初始化
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self configDefaultValues];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self configDefaultValues];
    }
    return self;
}

- (void)configDefaultValues {
    
    NSDictionary *tree = @{
        @"item" : @"A",
        @"list" : @[
                @{
                    @"item" : @"B",
                    @"list" : @[
                            @{
                                @"item" : @"B1",
                                @"list" : @[]
                            },
                            @{
                                @"item" : @"B2",
                                @"list" : @[]
                            }
                    ]
                },
                @{
                    @"item" : @"C",
                    @"list" : @[
                            @{
                                @"item" : @"C1",
                                @"list" : @[]
                            },
                            @{
                                @"item" : @"C2",
                                @"list" : @[]
                            }
                    ]
                },
                @{
                    @"item" : @"D",
                    @"list" : @[
                            @{
                                @"item" : @"D1",
                                @"list" : @[]
                            },
                            @{
                                @"item" : @"D2",
                                @"list" : @[]
                            }
                    ]
                }
                
        ]
    };
    
    _dimensional = 0;
    _nodeCount = [NSMutableArray new];
    _nodeGroup = [NSMutableArray new];
    _pointsGroup = [NSMutableArray new];
    
    [_nodeGroup addObject:@[@1]];
    [self getDim:@[tree]];
    [_nodeGroup removeLastObject];
    

    NSLog(@"-------------");
    NSLog(@"%ld", _dimensional);
    NSLog(@"%@", _nodeCount);
    NSLog(@"%@", _nodeGroup);
    NSLog(@"-------------");
        
    for (NSInteger dim = _nodeCount.count - 1; dim >= 0; dim--) {
        NSNumber *num = (NSNumber *)_nodeCount[dim];
        NSInteger count = num.integerValue;
        CGFloat x;
        CGFloat y;
        CGFloat w;
        CGFloat h;
        
        y = dim * 50.0 + dim * 10;
        w = Screen_Width / 6.0;
        h = 50.0;
        
        //group
        NSArray *group = _nodeGroup[dim];
        NSMutableArray *points = [NSMutableArray new];
        
        for (NSInteger i = 0; i < count; i++) {
            x = i * w;
            TreeItem *item = [[TreeItem alloc] initWithFrame:CGRectMake(x, y, w, h)];
            [self addSubview:item];
            
            [points addObject:@(CGPointMake(x + w / 2.0, y))];
        }
        
        
        NSInteger index = 0;
        for (NSInteger i = 0; i < group.count; i++) {
            NSInteger this = ((NSNumber *)group[i]).integerValue;
            NSMutableArray *pointArray = [NSMutableArray new];
            for (NSInteger j = 0; j < this; j++) {
                NSValue *pointValue = points[index + j];
                [pointArray addObject:pointValue];
            }
            [_pointsGroup addObject:pointArray];
            index += this;
        }
                
        for (NSInteger i = 0; i < _pointsGroup.count; i++) {
            NSArray *points = _pointsGroup[i];
            if (points.count >= 2) {
                for (NSInteger j = 0; j < points.count - 1; j++) {
                    CGPoint a = [points[j] CGPointValue];
                    CGPoint b = [points[j+1] CGPointValue];
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(a.x, a.y, b.x-a.x, 1)];
                    view.backgroundColor = UIColor.darkGrayColor;
                    [self addSubview:view];
                }
            }
        }
    }
    
    NSLog(@"%@", _pointsGroup);
    
}

- (void)getDim:(NSArray *)treeNodes {
    [_nodeCount addObject:@(treeNodes.count)];
    
    if (treeNodes.count > 0) {
        _dimensional += 1;
        
        NSMutableArray *thisTreeNodes = [NSMutableArray new];
        //计算本组个数
        NSMutableArray *group = [NSMutableArray new];
        for (NSInteger i = 0; i < treeNodes.count; i++) {
            NSDictionary *treeNode = treeNodes[i];
            
            NSArray *list = [treeNode objectForKey:@"list"];
            
            [group addObject:@(list.count)];
            
            for (NSDictionary *node in list) {
                [thisTreeNodes addObject:node];
            }
        }
        [_nodeGroup addObject:group];
        
        
        if (thisTreeNodes.count > 0) {
            [self getDim:thisTreeNodes];
        }
    }
    
}

- (BOOL)nodeHaveChildren: (NSArray *)treeNodes {
    BOOL haveChildren = NO;
    for (NSInteger i = 0; i < treeNodes.count; i++) {
        NSDictionary *treeNode = treeNodes[i];
        NSArray *list = [treeNode objectForKey:@"list"];
        if (list.count > 0) {
            haveChildren = YES;
            break;
        }
    }
    return haveChildren;
}




@end

@interface TreeItem ()

@property (nonatomic, strong) UIView *lineTop;
@property (nonatomic, strong) UIView *lineBottom;
@property (nonatomic, strong) UILabel *itemLabel;

@end

@implementation TreeItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    _lineTop = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2.0 - 0.5, 0, 1, 10)];
    _lineTop.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:_lineTop];
    
    _lineBottom = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2.0 - 0.5, 10 + 30, 1, 10)];
    _lineBottom.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:_lineBottom];
    
    _itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2.0 - 10, 10, 20, 30)];
    _itemLabel.backgroundColor = UIColor.brownColor;
    [self addSubview:_itemLabel];
}

@end
