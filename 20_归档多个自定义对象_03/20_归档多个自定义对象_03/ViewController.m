//
//  ViewController.m
//  20_归档多个自定义对象_03
//
//  Created by lilin on 2020/7/20.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
#import "ArchiveService.h"
@interface ViewController ()
@property (nonatomic,strong) NSMutableArray* array;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;

@end

@implementation ViewController

-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [ArchiveService readObjectsFromArchiveFile];
        if (_array ==nil) {
            _array = [NSMutableArray array];
        }
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)writeObjectsToArchive:(id)sender {
    if (self.scoreTextField.text == nil) {
        NSDictionary* dict = @{@"name":self.nameTextField.text,@"age":self.ageTextField.text};
        
        Person* person = [Person personWithDictionary:dict];
        
        NSLog(@"name=%@",person.name);
        
        NSLog(@"age=%@",person.age);
        
        [self.array addObject:person];
        
        if ([ArchiveService writeObjectsToArchive:self.array]) {
            NSLog(@"person数组归档成功");
        }
    }else{
        Student* student = [[Student alloc] init];
        student.name = self.nameTextField.text;
        NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
        student.age = [formatter numberFromString:self.ageTextField.text];
        student.score = self.scoreTextField.text;
        
        if ([ArchiveService writeSubObjectToArchive:student]) {
            NSLog(@"student归档成功");
        }
    }
    
}

- (IBAction)readObjectsFromArchive:(id)sender {
    if (self.scoreTextField.text == nil) {
        NSMutableArray *persons = [ArchiveService readObjectsFromArchiveFile];
        for (Person *person in persons) {
            NSLog(@"person name: %@, person age:%@", person.name,person.age);
        }
    }else{
        Student *student = [ArchiveService readSubObjectFromArchiveFile];
        NSLog(@"student name: %@, student age:%@, student score:%@", student.name,student.age,student.score);
    }
}

@end
