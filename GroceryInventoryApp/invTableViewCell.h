//
//  invTableViewCell.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@class productCell;

@interface invTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

//@property NSInteger * _Nonnull rowHieght;
@property (weak) Model * _Nullable model;
@property (strong) productCell * _Nullable collCell;
@property (strong, nonatomic) IBOutlet UILabel * _Nonnull sectionLbl;
@property (strong, nonatomic) IBOutlet UICollectionView * _Nonnull tableCollectionView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint * _Nullable collectionViewHeight;


- (void)updateTableCell:(nonnull NSString *)string;


@end
