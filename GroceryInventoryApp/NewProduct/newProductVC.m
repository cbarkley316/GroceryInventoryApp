//
//  newProductVC.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/12/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "newProductVC.h"
#import "newProductTableCell.h"
#import "Model.h"

@interface newProductVC ()

@end

@implementation newProductVC

@synthesize productTableCell, model;

- (void)viewDidLoad {
    [super viewDidLoad];
}



#pragma mark - TableView stuff

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView.rowHeight = 95;
    tableView.estimatedRowHeight = 44.0;
    productTableCell = [tableView dequeueReusableCellWithIdentifier:@"createProductTableCell"
                                                forIndexPath:indexPath];
    [productTableCell setModel:model];
    [productTableCell updateTableCell];
    return productTableCell;
}

@end
