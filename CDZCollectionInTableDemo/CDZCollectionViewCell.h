//
//  CDZCollectionViewCell.h
//  CDZCollectionInTableViewDemo
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDZCollectionViewItem.h"

@protocol CDZCollectionCellDelegate<NSObject>

@required
- (void)didDelete:(UICollectionViewCell *)cell;
@end

@interface CDZCollectionViewCell : UICollectionViewCell


@property (strong, nonatomic) CDZCollectionViewItem *item;

@property (assign, nonatomic) id<CDZCollectionCellDelegate> delegate;

@end
