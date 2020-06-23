//
//  ViewController.m
//  08_XIB_自定义UIView_01
//
//  Created by lilin on 2020/6/23.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "NibView.h"
#import "CustomButton.h"
/**
 转换坐标系：
    由frame 相对父View坐标系转为相对控制器View的坐标系:
 [self.superView convertRect:self.myView.frame toView:self.view]
 myView的坐标将转换到相对于控制器view
 */
@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField* textField;

@end

@implementation ViewController

- (UITextField *)textField{
    if (_textField==nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 250, 50)];
        _textField.backgroundColor = [UIColor yellowColor];
        _textField.placeholder = @"欢迎访问github";
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.returnKeyType = UIReturnKeyGo;
        _textField.delegate = self;
    }
    return _textField;
}

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
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 200, 250, 50);
    [button setTitle:@"正常状态" forState:UIControlStateNormal];
    
    [button setTitle:@"高亮状态" forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];

    [button setImage:[UIImage imageNamed:@"highlighted"] forState:UIControlStateHighlighted];
    
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    //加载xib自定义按钮
    CustomButton* customButton =  [[[NSBundle mainBundle] loadNibNamed:@"CustomButton" owner:nil options:nil] lastObject];
    
    customButton.frame = CGRectMake(0, 250, 200, 50);
    [self.view addSubview:customButton];
    
    [customButton addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //UITextField
    
    UITextField* textField1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
    textField1.backgroundColor = [UIColor whiteColor];
    textField1.placeholder = @"欢迎访问99ios";
    textField1.textAlignment = NSTextAlignmentCenter;
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.clearsOnBeginEditing = YES;
    textField1.keyboardType = UIKeyboardTypeDefault;
    textField1.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField1.returnKeyType = UIReturnKeyDone;
    textField1.clearsOnInsertion = YES;
    textField1.delegate = self;
    [self.view addSubview:textField1];
    
    //添加一个子View
    [self.view addSubview:self.textField];
    [self.textField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField endEditing:YES];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}


- (IBAction)myAction:(id)sender {
    NSLog(@"%s",__func__);
    NSLog(@"按钮点击了");
}

- (void)viewDidAppear:(BOOL)animated{
    //弹出弹窗
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否要访问99ios?" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* defaultAction  = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了YES");
    }];
    
    UIAlertAction* cancelAction  = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了cancel");
    }];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了NO");
    }];
    
    [alert addAction:defaultAction];
    
    [alert addAction:cancelAction];
    
    [alert addAction:noAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"%s",__func__);
    NSLog(@"开始输入内容");
}

//didEndEdit:reason:定义了就不调用此方法
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%s---%d",__func__,__LINE__);
    NSLog(@"输入结束");

}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{
    NSLog(@"%s",__func__);
    NSLog(@"输入结束");
}

//对文本输入框内容作出限制
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //range.location代表光标的位置
    NSLog(@"range.location = %ld;;range.length = %ld",range.location,range.length);
    if(range.location - range.length >=3){
        NSLog(@"字数超出限制，无法继续输入");
        return NO;
    }else{
        NSLog(@"字数超出限制，可以继续输入");
        return YES;
    }
}
@end
