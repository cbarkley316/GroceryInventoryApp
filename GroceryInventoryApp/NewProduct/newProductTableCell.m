//
//  editProductTableCell.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/12/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "newProductTableCell.h"
#import "Model.h"
#import "productCell.h"

@implementation newProductTableCell
@synthesize model;

- (void)updateTableCell{
}


#pragma mark - Text Field stuff

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //NSLog(@"%@", textField.text);
    //[model createProduct:textField.text];
    [textField resignFirstResponder];
    return YES;
}

@end
