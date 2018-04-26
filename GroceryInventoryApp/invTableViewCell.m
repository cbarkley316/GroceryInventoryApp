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
#import "editProductViewController.h"
#import "invViewController.h"

@implementation invTableViewCell

@synthesize sectionLbl, invViewController, invTableCollectionView, model, collCell, sectionProducts;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)updateTableCell:(nonnull NSString *)string{//} sectionArray:(NSMutableArray *_Nullable)sectionArray{
    self.sectionLbl.text = string;
    if (sectionProducts == nil){
        NSMutableArray *sp = [[NSMutableArray alloc] init];
        sectionProducts = sp;
    }
    [sectionProducts removeAllObjects];//Clear the sectionProducts array
    for (productCell *p in model.productList){//and fill it up again
        if(string == p.homeSection){
            [sectionProducts addObject:p];
        }
    }
}

#pragma mark - CollectionView stuff

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"ColletionView numberOfItemsInSection called");
    return sectionProducts.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    collCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"productCell"
                                                         forIndexPath:indexPath];
        productCell *p = [sectionProducts objectAtIndex:indexPath.row];//get this particular product
        //update that particular product
        [collCell updateCollectionCell:[p productName] amountNeeded:[p amountNeeded]];
        return collCell;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
////This code prints selected productName
    productCell *selectedProduct = [sectionProducts objectAtIndex:indexPath.row];
//    NSString *selectedProductName = selectedProduct.productName;
//    NSLog(@"%@ tapped", selectedProductName);
    if (model.invEditWasPushed){
        
    } else {
        selectedProduct.amountNeeded += 1;
        [collectionView reloadData];
    }
}



@end
