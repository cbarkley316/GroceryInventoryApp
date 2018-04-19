//
//  ViewController.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 3/28/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//    

#import "invViewController.h"
#import "invTableViewCell.h"
#import "newProductVC.h"
#import "productCell.h"
#import "Model.h"

@interface invViewController ()

@end

@implementation invViewController

@synthesize invTableView, sectionList, fridgeProducts, tableCell, collCell, model, tableRowHeight;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableRowHeight:95];
    if (model == nil){
        model = [[Model alloc] init];
    }
    //need one for default homeSection
    [model addHomeSection:@"Inventory"];
    [model addHomeSection:@"Fridge"];
    //need one for default storeSection
    [model addStoreSection:@"Store"];
    [model addStoreSection:@"Produce Section"];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"invToCreate"]){
        // Get reference to the destination view controller
        newProductVC *vc = [segue destinationViewController];
        [vc setModel:model];
    }
}

- (void)reloadTheData{
    
}

- (void)viewWillAppear:(BOOL)animated{
    for (int i = 4; i < model.productList.count; i += 4){
            tableRowHeight += 55;
    }
    SEL reloadSelector = NSSelectorFromString(@"reloadData");
    [invTableView performSelectorOnMainThread:reloadSelector
                                                withObject:nil
                                             waitUntilDone:YES];
}

- (void)dealloc{
    NSLog(@"invViewController Dealocated");
}

#pragma mark - TableView stuff

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return model.homeSections.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //for each row create a invTableViewCell
    tableCell = [tableView dequeueReusableCellWithIdentifier:@"invTableCell"
                                                      forIndexPath:indexPath];
    //set up auto-sizing cells based on content
    tableCell.frame = tableView.bounds;
    [tableCell layoutIfNeeded];
    [tableCell.tableCollectionView reloadData];
    tableCell.collectionViewHeight.constant = tableCell.tableCollectionView.collectionViewLayout.collectionViewContentSize.height;
    //call tableviewCell methods
    [tableCell updateTableCell:[model.homeSections objectAtIndex:indexPath.row]];
    [tableCell setModel:model];
    if ([tableCell.sectionLbl.text  isEqual: @"Inventory"]){
        
    }
    return tableCell;
}



#pragma mark - CollectionView stuff

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return model.productList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    collCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"productCell"
                                                                  forIndexPath:indexPath];
    //get this particular product
    productCell *p = [model.productList objectAtIndex:indexPath.row];
    //update that particular product
    [collCell updateCollectionCell:[p productName] amountNeeded:0];
    return collCell;
}

@end
