//
//  editProductViewController.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/24/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class productCell;
@class Model;

@interface editProductViewController : UIViewController <UITextFieldDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak) productCell *selectedProduct;
@property (weak) Model *model;
@property (strong, nonatomic) IBOutlet UILabel *productNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *homeSectionLbl;
@property (strong, nonatomic) IBOutlet UILabel *storeSectionLbl;
@property (strong, nonatomic) IBOutlet UITextField *productNameField;
@property (strong, nonatomic) IBOutlet UITextField *amountNeededField;
@property (strong, nonatomic) IBOutlet UIPickerView *homeSectionPickerview;
@property (strong, nonatomic) IBOutlet UIPickerView *storeSectionPickerview;
- (IBAction)saveButton:(id)sender;

@end
