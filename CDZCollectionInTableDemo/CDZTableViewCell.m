//
//  CDZTableViewCell.m
//  CDZCollectionInTableViewDemo
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZTableViewCell.h"
#import "CDZCollectionViewCell.h"
#import "CDZCollectionViewItem.h"
@interface CDZTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,CDZCollectionCellDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightLayout;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@property (strong, nonatomic) NSMutableArray<CDZCollectionViewItem *>*itemsArray;


@end
@implementation CDZTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    CDZCollectionViewItem *item = [CDZCollectionViewItem new];
    item.delBtnHidden = YES;
    _itemsArray = [NSMutableArray arrayWithObject:item];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
   // self.collectionViewFlowLayout.estimatedItemSize = CGSizeMake(125, 100);
   // self.collectionViewFlowLayout.itemSize = UICollectionViewFlowLayoutAutomaticSize;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CDZCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    [self reloadCell];
}


- (void)didDelete:(UICollectionViewCell *)cell{
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    [self.itemsArray removeObjectAtIndex:indexPath.row];
    [self reloadCell];
}

- (void)reloadCell{
    [self.collectionView reloadData];
    self.collectionViewHeightLayout.constant = self.collectionViewFlowLayout.collectionViewContentSize.height;
    [self updateConstraintsIfNeeded];
    [self.delegate shouldReload];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //载入数据，如图片等
    CDZCollectionViewItem *item = [CDZCollectionViewItem new];
    item.image = [UIImage imageNamed:@"example"];
    if ((indexPath.row == self.itemsArray.count - 1)) {
        [self.itemsArray insertObject:item atIndex:self.itemsArray.count - 1];
    }
    else{
        self.itemsArray[indexPath.row] = item;
    }
    [self reloadCell];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.item = self.itemsArray[indexPath.row];
    return cell;
}

@end
