//
//  CDZCollectionViewCell.m
//  CDZCollectionInTableViewDemo
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZCollectionViewCell.h"
@interface CDZCollectionViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *delButton;

- (IBAction)delCell:(UIButton *)sender;

@end
@implementation CDZCollectionViewCell



- (IBAction)delCell:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didDelete:)]){
        [self.delegate didDelete:self];
    }
}

- (void)setItem:(CDZCollectionViewItem *)item{
    //  解析需要的数据
    
    self.imageView.image = item.image;
    self.delButton.hidden = item.delBtnHidden;
}

@end
