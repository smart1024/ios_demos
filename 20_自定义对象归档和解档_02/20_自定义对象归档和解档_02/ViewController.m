//
//  ViewController.m
//  20_自定义对象归档和解档_02
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ArchiveService.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)writeToArchive:(id)sender {
    NSDictionary* dict = @{@"name":self.nameTextField.text,@"age":self.ageTextField.text};
    Person* person = [Person personWithDict:dict];
    BOOL success = [ArchiveService writeObjectToArchiveFile:person];
    if(success){
        NSLog(@"归档成功");
    }
}

- (IBAction)readFromArchive:(id)sender{
   Person* person = [ArchiveService readObjectFromArchiveFile];
    NSLog(@"person.name=%@,person.age=%@",person.name,person.age);
}

@end
