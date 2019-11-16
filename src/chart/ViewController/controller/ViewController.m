//
//  ViewController.m
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerTableProtocol.h"
#import "VCViewModel.h"
#import "PushPage.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) VCViewModel *VCVM;
@property (nonatomic, strong) ViewControllerTableProtocol *tableProtocol;

@property (nonatomic, strong) LineChart *lineChart;
@property (nonatomic, strong) RadarChart *radarChart;
@property (nonatomic, strong) CircleChart *circleChart;
@property (nonatomic, strong) HistogramChart *histogramChart;
@property (nonatomic, strong) TreeChart *treeChart;

@end

@implementation ViewController

- (VCViewModel *)VCVM {
    if (!_VCVM) {
        _VCVM = [[VCViewModel alloc] init];
    }
    return _VCVM;
}

- (UIView *)return_nav_bar {
    LKNav *nav = [LKNav backStyleWithTitle:@"KLZ"];
    nav.backgroundColor = UIColor.brownColor;
    
    return nav;
}

- (UIColor *)return_background_color {
    return UIColor.whiteColor;
}

- (CGRect)return_tableView_frame {
    return CGRectMake(0, Status_Nav_Bar_Height, Screen_Width, Screen_Height - Status_Nav_Bar_Height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self setUI];
    
    [self line_Chart];
    [self radar_Chart];
    [self circle_Chart];
    [self histogram_Chart];
    //[self tree_Chart];
    
    LKSwiper *swiper = [[LKSwiper alloc] initWithFrame:CGRectMake(0, 00, Screen_Width, 240)];
    swiper.timeInterval = 2;
    swiper.imageNameList = @[@"example",@"example",@"example",@"example",@"example",@"example",];
    swiper.clickImage = ^(NSInteger index) {
        
    };
    
    LKRollView *roll = [[LKRollView alloc] initWithFrame:CGRectMake((Screen_Width - 100) / 2.0, 0, 100, 100 * 1.77) withDistanceForScroll:12 withGap:12];
    roll.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    [roll rollWithImageName:@[@"example", @"example", @"example"]];
    
    self.tableProtocol.views = @[/*_treeChart,*/ _histogramChart, _lineChart, _radarChart, _circleChart, swiper, roll];
    [self.tableView reloadData];
        
    
    
    //    UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
    //    tf.borderStyle = UITextBorderStyleLine;
    //    tf.autocorrectionType = UITextAutocorrectionTypeNo;
    //
    //    [[tf rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
    //        NSLog(@"%@", x);
    //    }];
    //
    //    [self.view addSubview:tf];
    
    //    NSString *dateStr = @"2015-12-10T12:10:00.000Z";
    //    NSLog(@"%@", dateStr.l_format_HH_mm_ss);
    
    //NSLog(@"%@", String_By_TimeStamp(1504667976));
    
    //yyyy-MM-dd'T'HH:mm:ss.SSSZ
    
    //    [NetWork request:get url:api_test1 parameters:nil progress:nil loading:defaul netCallBack:^(NetValue * _Nonnull netValue) {
    //        NSLog(@"%@", netValue.toJSON);
    //    }];
    
    //    [NetWork request:post url:api_code parameters:@{@"mobile" : @"17666111185"} progress:nil loading:defaul netCallBack:^(NetValue * _Nonnull netValue) {
    //        NSLog(@"%@", netValue.toJSON);
    //    }];
}

- (void)configTableProtocol {
    self.tableProtocol = [[ViewControllerTableProtocol alloc] init];
    self.tableView.delegate = self.tableProtocol;
    self.tableView.dataSource = self.tableProtocol;
    
    //    __weak typeof(self) weakSelf = self;
    //    self.tableProtocol.cellClick = ^(NSInteger section, NSInteger index) {
    //        [weakSelf.navigationController pushViewController:[PushPage new] animated:YES];
    //    };
}

- (void)setUI {
    self.tableView.mj_header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 220, Screen_Width, 140)];
    scrollView.contentSize = CGSizeMake(1400, 140);
    scrollView.backgroundColor = UIColor.brownColor;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    for (NSInteger i = 0; i < 20; i++) {
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(i * 70, 0, 70, 70)];
        view1.layer.masksToBounds = YES;
        view1.layer.cornerRadius = 35.0f;
        view1.backgroundColor = COLOR_RANDOM;
        [scrollView addSubview:view1];
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(i * 70, 70, 70, 70)];
        view2.layer.masksToBounds = YES;
        view2.layer.cornerRadius = 35.0f;
        view2.backgroundColor = COLOR_RANDOM;
        [scrollView addSubview:view2];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 20; i++) {
        [arr addObject: @(i * 70)];
    }
    if ([arr containsObject:@(offset.x)]) {
        NSLog(@"1");
        if (@available(iOS 10.0, *)) {
            UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
            [feedBackGenertor impactOccurred];
        } else {
            // Fallback on earlier versions
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGPoint offset = scrollView.contentOffset;
    
    NSInteger off = (NSInteger)offset.x;
    NSInteger yu = off % 70;
    
    CGFloat x;
    if (yu < 35) {
        x = (off / 70) * 70.0;
    } else {
        x = (off / 70 + 1) * 70.0;
    }
    
    scrollView.contentOffset = CGPointMake(x, 0);
    if (decelerate) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [scrollView setContentOffset:scrollView.contentOffset animated:NO];
        });
    }
}

- (void)refreshAction {
    [self.VCVM refreshWithCallback:^(NSArray *models) {
        self.VCVM.models = models;
        self.tableProtocol.VCVM = self.VCVM;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)line_Chart {
    
    _lineChart = [[LineChart alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 220)];
    _lineChart.xLabelTitles = @[@"0",@"10",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100",];
    _lineChart.yLabelTitles = @[@"0", @"20", @"40", @"60", @"80", @"100"];
    //_lineChart.xLabelRotationAngle = M_PI/6;
    _lineChart.showCoordinateAxis = YES;
    _lineChart.xLabelAlignmentStyle = GBXLabelAlignmentStyleFitXAxis;
    
    _lineChart.showVerticalLine = YES;
    _lineChart.verticalLineColor = [UIColor cyanColor];
    _lineChart.verticalLineWidth = 1;
    _lineChart.verticalLineXValue = 40;
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectsFromArray:@[@100,@20, @30,@20,@40,@0,@80,@40,@10,@50,@10]];
    
    NSMutableArray *xArray = _lineChart.xLabelTitles.mutableCopy;
    NSInteger index = ceil(_lineChart.verticalLineXValue/10.0);
    
    NSInteger count = 0;
    for (NSString *title in _lineChart.xLabelTitles) {
        if ([title floatValue] != _lineChart.verticalLineXValue) {
            count++;
        }
    }
    
//    if (count == _lineChart.xLabelTitles.count) {
//        //如果是坐标上的端点 就不要insert
//        [xArray insertObject:[NSString stringWithFormat:@"%0.0f", _lineChart.verticalLineXValue] atIndex:index];
//        //CGFloat yvalue = ([array[index-1] floatValue] + [array[index] floatValue]) / 2;
//
//        CGFloat index_1Value = [array[index-1] floatValue];
//        CGFloat indexValue = [array[index] floatValue];
//
//        CGFloat minValue = index_1Value > indexValue ? indexValue : index_1Value;
//        CGFloat maxValue = index_1Value > indexValue ? index_1Value : indexValue;
//
//        CGFloat yvalue = maxValue - (maxValue - minValue) / 10 * 2.5;
//
//        [array insertObject:[NSNumber numberWithFloat:yvalue] atIndex:index];
//    }
    
    LineChartData *data = [LineChartData new];
    data.lineAlpha = 0.7;
    data.lineColor = [UIColor blueColor];
    data.lineWidth = 1;
    data.startIndex = 0;
    data.itemCount = index+1;
    data.lineChartPointStyle = LineChartPointStyleNone;
    data.inflexionPointStrokeColor = [UIColor redColor];
    data.inflexionPointFillColor = [UIColor greenColor];
    data.inflexionPointWidth = 6;
    data.showDash = NO;
    data.showGradientArea = YES;
    data.startGradientColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    data.endGradientColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    data.lineDashPattern = @[@1,@1];
    
    data.showPointLabel = YES;
    data.pointLabelFont = [UIFont systemFontOfSize:10];
    data.pointLabelColor = [UIColor blackColor];
    data.pointLabelFormat = @"%1.0f";
    
    data.dataGetter = ^LineChartDataItem *(NSInteger item) {
        return [LineChartDataItem dataItemWithY:[array[item] floatValue] X:[xArray[item] floatValue]];
    };
    
    _lineChart.verticalLineIndex = data.itemCount;
        
    LineChartData *data1 = [LineChartData new];
    data1.lineAlpha = 1;
    data1.lineColor = [UIColor orangeColor];
    data1.lineWidth = 1;
    data1.startIndex = data.itemCount-1;
    data1.itemCount = array.count-data1.startIndex;
    data1.lineChartPointStyle = LineChartPointStyleNone;
    data1.inflexionPointStrokeColor = [UIColor cyanColor];
    data1.inflexionPointWidth = 5;
    
    data1.showPointLabel = YES;
    data1.pointLabelFont = [UIFont systemFontOfSize:10];
    data1.pointLabelColor = [UIColor blackColor];
    data1.pointLabelFormat = @"%1.0f";
    data1.showGradientArea = YES;
    data1.startGradientColor = [[UIColor yellowColor] colorWithAlphaComponent:0.6];
    data1.endGradientColor = [[UIColor yellowColor] colorWithAlphaComponent:0.0];
    
    data1.dataGetter = ^LineChartDataItem *(NSInteger item) {
        return [LineChartDataItem dataItemWithY:[array[item] floatValue] X:[xArray[item] floatValue]];
    };
    
    _lineChart.lineChartDatas = @[data, data1];
    _lineChart.chartMarginLeft = 25;
    
    _lineChart.yLabelBlockFormatter = ^NSString *(CGFloat value) {
        return [NSString stringWithFormat:@"%0.0f", value];
    };
    _lineChart.showSmoothLines = YES;
    [_lineChart strokeChart];
}

- (void)radar_Chart {
    
    NSMutableArray *items = [NSMutableArray array];
    NSArray *values = @[@100,@50,@70,@30,@50,@40,@45,];
    NSArray *descs = @[@"苹果",@"香蕉",@"花生",@"橙子",@"葡萄",@"火龙果",@"西瓜",];
    for (int i = 0; i < values.count; i++) {
        
        RadarChartDataItem *item = [RadarChartDataItem dataItemWithValue:[values[i] floatValue] description:descs[i]];
        [items addObject:item];
    }
    
    _radarChart = [[RadarChart alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 400) items:items valueDivider:20];
    
    _radarChart.plotStrokeColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3];
    _radarChart.plotFillColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3];
    _radarChart.isShowGraduation = YES;
    _radarChart.labelStyle = RadarChartLabelStyleHorizontal;
    [_radarChart strokeChart];
}

- (void)circle_Chart {
    
    _circleChart = [[CircleChart alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200) total:@100 current:@30 clockwise:YES shadow:YES shadowColor:[[UIColor grayColor] colorWithAlphaComponent:0.4] displayCountingLabel:YES overrideLineWidth:@4];
    _circleChart.strokeColorGradientStart = [UIColor blueColor];
    _circleChart.strokeColor = [UIColor redColor];
    //    circleChart.shadowColor = [UIColor blueColor];
    _circleChart.countingLabel.formatBlock = ^NSString *(CGFloat value) {
        
        return [NSString stringWithFormat:@"%0.0f分\n我的成绩单", value];
    };
    [_circleChart strokeChart];
}

- (void)histogram_Chart {
    _histogramChart = [[HistogramChart alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 240)];
    _histogramChart.xLabelTitles = @[@"苹果",@"橘子",@"香蕉",@"火龙果",@"橙子",@"葡萄"];
    _histogramChart.yLabelTitles = @[@"0", @"20", @"40", @"60", @"80", @"100"];
    _histogramChart.data = @[@85, @32, @60, @50, @10, @90];
        
    [_histogramChart strokeChart];
}

- (void)tree_Chart {
    _treeChart = [[TreeChart alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 180)];
    
}


@end
