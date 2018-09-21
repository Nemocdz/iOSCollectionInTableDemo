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
#import <Masonry/Masonry.h>

@interface CDZTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,CDZCollectionCellDelegate>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray<CDZCollectionViewItem *>*itemsArray;
@end
@implementation CDZTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    CDZCollectionViewItem *item = [CDZCollectionViewItem new];
    item.delBtnHidden = YES;
    _itemsArray = [NSMutableArray arrayWithObject:item];

   // self.collectionViewFlowLayout.estimatedItemSize = CGSizeMake(125, 100);
   // self.collectionViewFlowLayout.itemSize = UICollectionViewFlowLayoutAutomaticSize;
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.with.bottom.with.left.with.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(@100).priorityLow();
    }];

}


- (void)didDelete:(UICollectionViewCell *)cell{
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    [self.itemsArray removeObjectAtIndex:indexPath.row];
    [self reloadCell];
}

- (void)reloadCell{
    [self.collectionView reloadData];
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.collectionView.collectionViewLayout.collectionViewContentSize.height)).priorityHigh();
    }];
    [self.delegate didChangeCell:self];
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

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout.alloc init];
        layout.itemSize = CGSizeMake(125, 100);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"CDZCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

@end
