//
//  editProductTableCell.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/12/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;

@interface newProductTableCell : UITableViewCell <UITextFieldDelegate>

@property (weak) Model * _Nullable model;
- (void)updateTableCell;


@end
