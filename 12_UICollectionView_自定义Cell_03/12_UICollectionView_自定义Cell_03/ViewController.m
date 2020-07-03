//
//  ViewController.m
//  12_UICollectionView_自定义Cell_03
//
//  Created by lilin on 2020/7/3.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"
#include "MyCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView* collectionView;
@end

@implementation ViewController

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        
        UINib* nib = [UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class]) bundle:nil];
        MyCollectionViewCell* cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
        //设置xib中item大小
        flowLayout.itemSize = cell.frame.size;
        [_collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell* cell =  [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"99logo"];
    cell.textLable.text = @"九九学院";
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

@end
