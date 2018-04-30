//
//  ViewController.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 3/28/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class invTableViewCell;
@class productCell;
@class Model;


@interface invViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong) invTableViewCell *tableCell;
@property (strong, nonatomic) Model *model;
@property (strong, nonatomic) IBOutlet UITableView *invTableView;
@property (weak) productCell *collectionSelectedProduct;
@property (strong, nonatomic) IBOutlet UIButton *addProductORSectionOutlet;
@property (strong, nonatomic) IBOutlet UIButton *editButtonOutlet;



- (IBAction)editButton:(id)sender;
- (IBAction)productSectionButton:(id)sender;


@end

