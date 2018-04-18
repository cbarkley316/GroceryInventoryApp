//
//  invTableViewCell.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "invTableViewCell.h"
#import "productCell.h"

@implementation invTableViewCell

@synthesize sectionLbl, collectionView;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)updateTableCell:(nonnull NSString *)string{
    self.sectionLbl.text = string;
    [collectionView reloadData];
}



@end
