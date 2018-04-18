//
//  invTableViewCell.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface invTableViewCell : UITableViewCell

//@property NSInteger * _Nonnull rowHieght;
@property (strong, nonatomic) IBOutlet UILabel * _Nonnull sectionLbl;
@property (strong, nonatomic) IBOutlet UICollectionView * _Nonnull collectionView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint * _Nullable collectionViewHeight;

- (void)updateTableCell:(nonnull NSString *)string;


@end
