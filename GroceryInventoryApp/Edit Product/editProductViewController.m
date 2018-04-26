//
//  editProductViewController.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/24/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "editProductViewController.h"
#import "productCell.h"
#import "Model.h"

@interface editProductViewController ()

@end

@implementation editProductViewController

@synthesize selectedProduct, model, productNameLbl, homeSectionLbl, storeSectionLbl, productNameField, homeSectionPickerview, storeSectionPickerview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    productNameLbl.text = selectedProduct.productName;
    productNameField.text = selectedProduct.productName;
    homeSectionLbl.text = selectedProduct.homeSection;
    storeSectionLbl.text = selectedProduct.storeSection;
}

- (IBAction)saveButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - PickerView stuff

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rowCount = 0;
    if (pickerView == homeSectionPickerview){
        rowCount = model.homeSections.count;
        return rowCount;
    } else if (pickerView == storeSectionPickerview){
        rowCount = model.storeSections.count;
        return rowCount;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *rowTitle;
    if (pickerView == homeSectionPickerview){
        rowTitle = [model.homeSections objectAtIndex:row];//return the key as a string
        return rowTitle;
    } else if (pickerView == storeSectionPickerview){
        rowTitle = [model.storeSections objectAtIndex:row];;//return the key as a string
        return rowTitle;
    }
    return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == homeSectionPickerview){
        selectedProduct.homeSection = [model.homeSections objectAtIndex:row];
        homeSectionLbl.text = selectedProduct.homeSection;
    } else if (pickerView == storeSectionPickerview){
        selectedProduct.storeSection = [model.storeSections objectAtIndex:row];
        storeSectionLbl.text = selectedProduct.storeSection;
    }
}

#pragma mark - Navigation

 /*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
