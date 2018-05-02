//
//  productCell.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productCell : UICollectionViewCell ////<NSCoding>

@property (strong, nonatomic) IBOutlet UILabel *productNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *amountNeededLbl;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *homeSection;
@property (strong, nonatomic) NSString *storeSection;
@property NSInteger amountNeeded;


-(void)updateCollectionCell:(NSString *)product amountNeeded:(NSInteger)amountNeeded;
//-(id)initWithProductName:(NSString *)productName homeSection:(NSString *)homeSection storeSection:(NSString *)storeSection amountNeeded:(NSInteger)amountNeeded;

@end
