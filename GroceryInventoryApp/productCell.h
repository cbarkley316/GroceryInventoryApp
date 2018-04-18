//
//  productCell.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *productNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *amountNeededLbl;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *homeSection;

-(void)updateCollectionCell:(NSString *)product amountNeeded:(int)amountNeeded;

@end
