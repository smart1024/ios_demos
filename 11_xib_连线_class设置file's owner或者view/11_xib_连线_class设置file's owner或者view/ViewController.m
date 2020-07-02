//
//  ViewController.m
//  11_xib_连线_class设置file's owner或者view
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "FirView.h"
@interface ViewController ()
@property (nonatomic,strong) FirView* firView;
@end

@implementation ViewController

- (FirView *)firView{
    if (_firView == nil) {
        _firView = [FirView firView];
    }
    return _firView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firView.frame = CGRectMake(30, 30, 300, 300);
    self.firView.layer.borderWidth = 1;
    [self.view addSubview:self.firView];
}


@end
