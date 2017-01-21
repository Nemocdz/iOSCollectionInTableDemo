//
//  CDZCollectionViewItem.m
//  CDZCollectionInTableViewDemo
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZCollectionViewItem.h"

@implementation CDZCollectionViewItem

- (instancetype)init{
    if ((self = [super init])) {
        _delBtnHidden = NO;
        _image = [UIImage imageNamed:@"发单-添加"];
    }
    return self;
}



@end
