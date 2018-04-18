//
//  productCell.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "productCell.h"

@implementation productCell

@synthesize productNameLbl, amountNeededLbl, productName, homeSection;

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)updateCollectionCell:(NSString *)product
               amountNeeded:(int)amountNeeded{
    self.productNameLbl.text = product;
    self.amountNeededLbl.text = [NSString stringWithFormat: @"%ld", (long)amountNeeded];//convert int to string

}


@end
