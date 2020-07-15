//
//  MainViewController.m
//  16_UISegmentedCotrol使用_04
//
//  Created by lilin on 2020/7/15.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "MainViewController.h"
#import "SubViewController.h"
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kNumber (self.segmentedControl.numberOfSegments)

@interface MainViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView* scrollView;
@property (nonatomic,strong) UISegmentedControl* segmentedControl;
@end

@implementation MainViewController

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake(kScreenWidth * kNumber, 0);
        _scrollView.backgroundColor = [UIColor yellowColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UISegmentedControl *)segmentedControl{
    if (_segmentedControl == nil) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"最新",@"最热",@"经典"]];
        _segmentedControl.tintColor = [UIColor redColor];
        _segmentedControl.selectedSegmentIndex = 0;
        [_segmentedControl addTarget:self action:@selector(changeIndex) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

-(void)changeIndex{
    CGFloat offsetX = kScreenWidth*self.segmentedControl.selectedSegmentIndex;
    self.scrollView.contentOffset = CGPointMake(offsetX, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.segmentedControl;
    [self.view addSubview:self.scrollView];
    for (int i = 0; i < kNumber; i++) {
        SubViewController *subVC = [[SubViewController alloc] init];
        CGFloat x = kScreenWidth * i;
        subVC.view.frame = CGRectMake(x, 0, kScreenWidth, [UIScreen mainScreen].bounds.size.height);
        [self.scrollView addSubview:subVC.view];
    }
}

//监听用户手势滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat x = offsetX / kScreenWidth;
    //四舍五入
    int index = (int)round(x);
    self.segmentedControl.selectedSegmentIndex = index;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
