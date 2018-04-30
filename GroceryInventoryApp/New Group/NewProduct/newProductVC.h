//
//  newProductVC.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/12/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class newProductTableCell;
@class Model;

@interface newProductVC : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *homeSection;
@property (strong, nonatomic) NSString *storeSection;
@property NSInteger amountNeeded;
@property (weak) Model *model;
@property (strong) newProductTableCell *productTableCell;
@property (strong, nonatomic) IBOutlet UIPickerView *homeSectionPickerview;
@property (strong, nonatomic) IBOutlet UIPickerView *storeSectionPickerview;
@property (strong, nonatomic) IBOutlet UITextField *productNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountNeededField;

- (IBAction)createProductButton:(id)sender;


@end
