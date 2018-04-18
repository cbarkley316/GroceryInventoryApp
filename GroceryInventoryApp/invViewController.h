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


@interface invViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong) NSMutableArray *sectionList;
@property (strong) NSMutableArray *fridgeProducts;
@property (strong) invTableViewCell *tableCell;
@property (strong) productCell *collCell;
@property (strong, nonatomic) Model *model;
@property int tableRowHeight;
@property (strong, nonatomic) IBOutlet UITableView *invTableView;

- (void)reloadTheData;

@end

