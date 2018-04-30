//
//  shoppingViewController.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/26/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "shoppingViewController.h"
#import "shopTableViewCell.h"
#import "newProductVC.h"
#import "productCell.h"
#import "Model.h"
#import "editProductViewController.h"
#import "addStoreSectionViewController.h"

@interface shoppingViewController ()

@end

@implementation shoppingViewController

@synthesize shopTableView, tableCell, neededSections, model, productSectionButtonOutlet, editButtonOutlet, collectionSelectedProduct;

- (void)viewDidLoad {
    [super viewDidLoad];
    [model setInvEditWasPushed:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"shopToCreateProduct"]){
        // Get reference to the destination view controller
        newProductVC *vc = [segue destinationViewController];
        [vc setModel:model];
    }
    if([[segue identifier] isEqualToString:@"shopToAddSection"]){
        // Get reference to the destination view controller
        addStoreSectionViewController *vc = [segue destinationViewController];
        [vc setModel:model];
    }
    if([[segue identifier] isEqualToString:@"shopToEditProduct"]){
        [model setInvEditWasPushed:NO];
        editProductViewController *vc = [segue destinationViewController];
        [vc setSelectedProduct:collectionSelectedProduct];
        [vc setModel:model];
    }
   
}

- (void)viewWillAppear:(BOOL)animated{
    [model setInvEditWasPushed:NO];
    if (neededSections == nil){
        NSMutableArray *ns = [[NSMutableArray alloc] init];
        neededSections = ns;
    }
    [neededSections removeAllObjects];
    ////build neededSections array
    for (productCell *p in model.productList){//for every product in productList
        if (p.amountNeeded > 0 && ![neededSections containsObject:p.storeSection]){//if the product's amount needed is great than 0 AND the array does not already include this string
            [neededSections addObject:p.storeSection];//add the "storeSection" string to the "neededSections" list
        }
    }
    if (model.invEditWasPushed){
        [productSectionButtonOutlet setTitle:@"Add Section" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Inventory" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    } else {
        [productSectionButtonOutlet setTitle:@"Add Product" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Edit" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    SEL reloadSelector = NSSelectorFromString(@"reloadData");
    [shopTableView performSelectorOnMainThread:reloadSelector
                                   withObject:nil
                                waitUntilDone:YES];
}

- (IBAction)editButton:(id)sender {
    if (!model.invEditWasPushed){
        [model setInvEditWasPushed:YES];
        [productSectionButtonOutlet setTitle:@"Add Section" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Shop" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    } else {
        [model setInvEditWasPushed:NO];
        [productSectionButtonOutlet setTitle:@"Add Product" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Edit" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}

- (IBAction)productSectionButton:(id)sender {
    if (model.invEditWasPushed){
        [self performSegueWithIdentifier:@"shopToAddSection" sender:self];
    } else {
        [self performSegueWithIdentifier:@"shopToCreateProduct" sender:self];
    }
}

- (void)dealloc{
    NSLog(@"Shop ViewController Dealocated");
}

#pragma mark tableview stuff

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return neededSections.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //for each row create a invTableViewCell
    tableCell = [tableView dequeueReusableCellWithIdentifier:@"shopTableCell"
                                                forIndexPath:indexPath];
    //call tableviewCell methods
    [tableCell setModel:model];
    [tableCell setShopVC:self];
    [tableCell updateTableCell:[neededSections objectAtIndex:indexPath.row]];//give the section as a string
    //set up auto-sizing cells based on content//PRETTY SURE THIS MAKES THE COLLECTIONVIEWS LOAD FIRST
    tableCell.frame = tableView.bounds;
    [tableCell layoutIfNeeded];
    [tableCell.shopTableCollectionView reloadData];
    tableCell.collectionViewHeight.constant = tableCell.shopTableCollectionView.collectionViewLayout.collectionViewContentSize.height;
    return tableCell;
}


@end
