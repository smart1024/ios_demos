//
//  ViewController.m
//  08_XIB_自定义UIView_01
//
//  Created by lilin on 2020/6/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "NibView.h"

/**
 转换坐标系：
    由frame 相对父View坐标系转为相对控制器View的坐标系:
 [self.superView convertRect:self.myView.frame toView:self.view]
 myView的坐标将转换到相对于控制器view
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //方法一:自定义类方法
    
//    NibView* nibView = [NibView initFromNib];
    
    //方法二:直接加载
//    NibView* nibView = [[[NSBundle mainBundle] loadNibNamed:@"NibView" owner:nil options:nil] lastObject];
    
    //方法三：UINib
    UINib* nib = [UINib nibWithNibName:@"NibView" bundle:nil];
    NibView* nibView = [[nib instantiateWithOwner:nil options:nil] lastObject];
    nibView.frame = CGRectMake(0, 0, 200, 200);
    
    [self.view addSubview:nibView];
}


@end
