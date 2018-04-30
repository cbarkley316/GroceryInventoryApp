//
//  shopTableViewCell.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/26/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class shoppingViewController;
@class Model;
@class productCell;

@interface shopTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>


@property (weak) Model * _Nullable model;
@property (strong) productCell * _Nullable collCell;
@property (weak) shoppingViewController * _Nullable shopVC;
@property (strong, nonatomic) IBOutlet UICollectionView * _Nonnull shopTableCollectionView;
@property (strong, nonatomic) IBOutlet UILabel * _Nonnull sectionLbl;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint * _Nullable collectionViewHeight;
@property (strong, nonatomic) NSMutableArray * _Nullable sectionProducts;

- (void)updateTableCell:(nonnull NSString *)string;

@end
