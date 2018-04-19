//
//  invTableViewCell.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//
// Did this transfer from Github?

#import "invTableViewCell.h"
#import "productCell.h"
#import "Model.h"

@implementation invTableViewCell

@synthesize sectionLbl, tableCollectionView, model, collCell;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)updateTableCell:(nonnull NSString *)string{
    self.sectionLbl.text = string;
    [tableCollectionView reloadData];
}

#pragma mark - CollectionView stuff

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return model.productList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"This collectionview cellForItemAtIndexPath got called");
    collCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"productCell"
                                                         forIndexPath:indexPath];
    //get this particular product
    productCell *p = [model.productList objectAtIndex:indexPath.row];
    //update that particular product
    [collCell updateCollectionCell:[p productName] amountNeeded:0];
    return collCell;
}


@end
