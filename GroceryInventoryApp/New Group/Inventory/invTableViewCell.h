//
//  invTableViewCell.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class invViewController;
@class Model;
@class productCell;

@interface invTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak) Model * _Nullable model;
@property (strong) productCell * _Nullable collCell;
@property (weak) invViewController * _Nullable invVC;
@property (strong, nonatomic) IBOutlet UILabel * _Nonnull sectionLbl;
@property (strong, nonatomic) IBOutlet UICollectionView * _Nonnull invTableCollectionView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint * _Nullable collectionViewHeight;
@property (strong, nonatomic) NSMutableArray * _Nullable sectionProducts;


- (void)updateTableCell:(nonnull NSString *)string;

@end
