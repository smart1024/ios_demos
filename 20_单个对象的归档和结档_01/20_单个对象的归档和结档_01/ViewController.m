//
//  ViewController.m
//  20_单个对象的归档和结档_01
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "ArchiveService.h"

//类似于实现java实现serializable、parcelable接口，ios自定义类需要实现NSSecureCoding协议
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//写
- (IBAction)writeStringToArchiveFile:(NSString *)sender {
//    BOOL success = [ArchiveService writeStringToArchiveFile:self.nameTextField.text];
    
    BOOL success = [ArchiveService newWriteStringToArchiveFile:self.nameTextField.text];
    NSLog(@"success = %d",success);
}

- (IBAction)readStringFromArchiveFile:(NSString *)sender {
//    NSLog(@"readStringFromArchiveFile=%@",[ArchiveService readStringFromArchiveFile]);
    NSLog(@"readStringFromArchiveFile=%@",[ArchiveService newReadStringFromArchiveFile]);
}
@end
