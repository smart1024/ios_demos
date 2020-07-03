//
//  ViewController.m
//  12_UICollectionView_01
//
//  Created by lilin on 2020/7/3.
//  Copyright © 2020 lilin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView* collectionView;
@end

@implementation ViewController

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        //必须传布局类型
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //最小行间距
        flowLayout.minimumLineSpacing = 10;
        //最小列间距
        flowLayout.minimumInteritemSpacing = 10;
        
        //header大小
        flowLayout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
        //footer大小
        flowLayout.footerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
        
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    //UICollectionView 需要reuse的View都需要注册
    //注册单元格，在懒加载方法中也可以
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    //注册headerView以复用
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
}

//每个分段中item数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

//分段数量
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}

//返回单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

/**
 补充视图,
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView* reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
       UICollectionReusableView* header =  [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        header.backgroundColor = [UIColor greenColor];
        reusableView = header;
    }else{
        UICollectionReusableView* footer = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footerView" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor redColor];
        reusableView = footer;
    }
    return reusableView;
}

//设置单元格能否被选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//设置单元格能否取消选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//单元格选中时
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
}

//单元格取消选中时
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
}

@end
