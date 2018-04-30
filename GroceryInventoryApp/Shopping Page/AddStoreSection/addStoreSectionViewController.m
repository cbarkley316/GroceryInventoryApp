//
//  addStoreSectionViewController.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/27/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "addStoreSectionViewController.h"
#import "Model.h"

@interface addStoreSectionViewController ()

@end

@implementation addStoreSectionViewController
@synthesize addStoreSectionField, model;

- (void)viewDidLoad {
    [super viewDidLoad];
    [model setInvEditWasPushed:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [model.storeSections addObject:textField.text];
    [textField resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

@end
