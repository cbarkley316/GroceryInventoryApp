//
//  shoppingViewController.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/26/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class shopTableViewCell;
@class productCell;
@class Model;

@interface shoppingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
    
@property (strong) shopTableViewCell *tableCell;
@property (strong, nonatomic) Model *model;
@property (strong) NSMutableArray *neededSections;
@property (strong, nonatomic) IBOutlet UITableView *shopTableView;
@property (weak) productCell *collectionSelectedProduct;
@property (strong, nonatomic) IBOutlet UIButton *editButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *productSectionButtonOutlet;

- (IBAction)editButton:(id)sender;
- (IBAction)productSectionButton:(id)sender;

    
    
    
    
    
@end
