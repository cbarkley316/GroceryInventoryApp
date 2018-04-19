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

@synthesize productTableCell, model, productName, homeSection, storeSection, homeSectionPickerview, storeSectionPickerview, productNameTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    //set the defaults
    [self setHomeSection:[model.homeSections objectAtIndex:0]];
    [self setStoreSection:[model.storeSections objectAtIndex:0]];
}

- (IBAction)createProductButton:(id)sender {
    [self setProductName:productNameTextField.text];
    NSLog(@"\nProductName:%@\nhomeSection:%@\nstoreSection:%@", productName, homeSection, storeSection);
    [model createProduct:productName
             homeSection:homeSection
            storeSection:storeSection];
    [self.navigationController popToRootViewControllerAnimated:YES];
}



#pragma mark - Text Field stuff

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self setProductName:textField.text];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - PickerView stuff

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *rowTitle;
    if (pickerView == homeSectionPickerview){
        rowTitle = [model.homeSections objectAtIndex:row];
    } else if (pickerView == storeSectionPickerview){
        rowTitle = [model.storeSections objectAtIndex:row];
    }
    return rowTitle;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rowCount = 0;
    if (pickerView == homeSectionPickerview){
        rowCount = model.homeSections.count;
    } else if (pickerView == storeSectionPickerview){
        rowCount = model.storeSections.count;
    }
    return rowCount;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == homeSectionPickerview){
        homeSection = [model.homeSections objectAtIndex:row];
    } else if (pickerView == storeSectionPickerview){
        storeSection = [model.storeSections objectAtIndex:row];
    }
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
