//
//  addStoreSectionViewController.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/27/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;

@interface addStoreSectionViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) Model *model;
@property (strong, nonatomic) IBOutlet UITextField *addStoreSectionField;


@end
