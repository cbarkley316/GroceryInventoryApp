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
#import "editProductViewController.h"
#import "addHomeSectionViewController.h"
#import "shoppingViewController.h"

@interface invViewController ()

@end

@implementation invViewController

@synthesize invTableView, tableCell, model, addProductORSectionOutlet, editButtonOutlet, collectionSelectedProduct;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (model == nil){
        model = [[Model alloc] init];
    }
    [model setInvEditWasPushed:NO];
    ////need one for default homeSection
    if (model.homeSections == nil){
        [model addHomeSection:@"Inventory"];
    }
    ////need one for default storeSection
    if (model.storeSections == nil){
        [model addStoreSection:@"Store"];
    }
    ////for tests Im making a dummy products
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"invToCreateProduct"]){
        // Get reference to the destination view controller
        newProductVC *vc = [segue destinationViewController];
        [vc setModel:model];
    }
    if([[segue identifier] isEqualToString:@"invToAddSection"]){
        // Get reference to the destination view controller
        addHomeSectionViewController *vc = [segue destinationViewController];
        [vc setModel:model];
    }
    if([[segue identifier] isEqualToString:@"invToEditProduct"]){
        [model setInvEditWasPushed:NO];
        editProductViewController *vc = [segue destinationViewController];
        [vc setSelectedProduct:collectionSelectedProduct];
        [vc setModel:model];
    }
    if([[segue identifier] isEqualToString:@"invToShop"]){
        // Get reference to the destination view controller
        shoppingViewController *vc = [segue destinationViewController];
        [vc setModel:model];
    }
}

////Used when I want the appearance of the VC to reload the data
- (void)viewWillAppear:(BOOL)animated{
    if (model.invEditWasPushed){
        [addProductORSectionOutlet setTitle:@"Add Section" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Inventory" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    } else {
        [addProductORSectionOutlet setTitle:@"Add Product" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Edit" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    SEL reloadSelector = NSSelectorFromString(@"reloadData");
    [invTableView performSelectorOnMainThread:reloadSelector
                                                withObject:nil
                                             waitUntilDone:YES];
}
    
- (IBAction)editButton:(id)sender {
    if (!model.invEditWasPushed){
        [model setInvEditWasPushed:YES];
        [addProductORSectionOutlet setTitle:@"Add Section" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Inventory" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    } else {
        [model setInvEditWasPushed:NO];
        [addProductORSectionOutlet setTitle:@"Add Product" forState:UIControlStateNormal];
        [editButtonOutlet setTitle:@"Edit" forState:UIControlStateNormal];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}

- (IBAction)productSectionButton:(id)sender {
    if (model.invEditWasPushed){
        [self performSegueWithIdentifier:@"invToAddSection" sender:self];
    } else {
        [self performSegueWithIdentifier:@"invToCreateProduct" sender:self];
    }
}

- (void)dealloc{
    NSLog(@"ViewController Dealocated");
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
    //call tableviewCell methods
    [tableCell setModel:model];
    tableCell.invVC = self;
    [tableCell updateTableCell:[model.homeSections objectAtIndex:indexPath.row]];//give the section as a string
    //set up auto-sizing cells based on content//PRETTY SURE THIS MAKES THE COLLECTIONVIEWS LOAD FIRST
    tableCell.frame = tableView.bounds;
    [tableCell layoutIfNeeded];
    [tableCell.invTableCollectionView reloadData];
    tableCell.collectionViewHeight.constant = tableCell.invTableCollectionView.collectionViewLayout.collectionViewContentSize.height;
    return tableCell;
}

@end
