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
    [self.tableview registerNib:[UINib nibWithNibName:@"CDZTableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (void)shouldReload{
    [self.tableview reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}



@end
