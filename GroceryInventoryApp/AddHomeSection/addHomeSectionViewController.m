//
//  addHomeSectionViewController.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/23/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "addHomeSectionViewController.h"
#import "Model.h"

@interface addHomeSectionViewController ()

@end

@implementation addHomeSectionViewController
@synthesize addSectionField, model;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [model.homeSections addObject:textField.text];
    [textField resignFirstResponder];
    [self.navigationController popToRootViewControllerAnimated:YES];
    return YES;
}

@end
