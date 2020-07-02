//
//  FirView.m
//  11_xib_连线_class设置file's owner或者view
//
//  Created by lilin on 2020/7/2.
//  Copyright © 2020 lilin. All rights reserved.
//

/**
 xib连线(xib自动会给属性赋值)时：
 1、指定File‘s Owner 的custom class为FirView
 直接连线btn报如下错误：
 Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<FirView 0x10847e640> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key btn.'
 
 说明FirView不能为btn赋值，因为File's owner此时为View的父控件，没法给子控件属性赋值
 
 2、指定View的custom class为FirView（通常我们制定file's owner子view custom class为自定View(这里指FirView)，当加载并初始化xib时，会自动为所有outlet和Action绑定值
 */

#import "FirView.h"
@interface FirView()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)clickButton:(id)sender;

@end

@implementation FirView

+(instancetype)firView{
//    FirView * firView = [[FirView alloc]init];
//    firView.frame = CGRectMake(30, 30, 100, 100);
//    firView.layer.borderWidth = 1;
    
    //从xib加载view
//    NSString* className = NSStringFromClass([self class]);
//    UINib* nib = [UINib nibWithNibName:className bundle:nil];
//    return [[nib instantiateWithOwner:self options:nil] lastObject];
    
    FirView * firView = [[FirView alloc]init];
    
    return firView;
}

- (void)layoutSubviews{
    //设置子控件大小和FirView大小相同
    self.view.frame = self.bounds;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString* className = NSStringFromClass([self class]);
        
        //给view属性赋值的三种方法
        /**
            1、加载Xib，赋值到self.view
         */
        //加载xib
//            UINib * nib = [UINib nibWithNibName:className bundle:nil];
//            //self.view可以不写但会出现警告，已连线会
        //初始化xib
//            self.view = [nib instantiateWithOwner:self options:nil].firstObject;
//            [self addSubview:self.view];
         
        
        /**
         2、键值编码，等同于1
         //加载xib
            UINib * nib = [UINib nibWithNibName:className bundle:nil];
        //初始化xib
         [self setValue:[nib instantiateWithOwner:self options:nil].firstObject forKey:@"view"];
            UINib * nib = [UINib nibWithNibName:className bundle:nil];
        */
        
        //3、加载xib并初始化xib,会给已连线属性赋值
        [[NSBundle mainBundle] loadNibNamed:className owner:self options:nil];
        
        //(File's Owner 此时是FirView)将File's owner的子view手动添加到File's ower才会显示
        [self addSubview:self.view];
        //file's owener 子view边框
        self.view.layer.borderWidth = 1;
        self.view.frame = CGRectMake(10, 10, 100, 100);
        self.view.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (IBAction)clickButton:(id)sender {
    NSLog(@"%s",__func__);
    NSLog(@"clickButton 点击了");
}
@end
