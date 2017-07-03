//
//  ViewController.m
//  CDZCollectionInTableViewDemo
//
//  Created by Nemocdz on 2017/1/21.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "ViewController.h"
#import "CDZTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CDZTableViewCellDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.estimatedRowHeight = 100.f;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (void)didChangeCell:(UITableViewCell *)cell{
    [self.tableview reloadData];
    NSIndexPath *indexPath = [self.tableview indexPathForCell:cell];
    [self.tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifer = [NSString stringWithFormat:@"CDZTableViewCell%ld",indexPath.row];//唯一标识，相当于不复用
    CDZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell  = [CDZTableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.delegate = self;
    return cell;
}



@end
