//
//  Model.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/11/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "Model.h"
#import "productCell.h"
#import "invViewController.h"

@implementation Model
@synthesize homeSections, storeSections, productList, holderObject;

- (void)createProduct:(NSString *)productName{
    NSLog(@"Creating product");
    if (productList == nil){
        NSMutableArray *pl = [[NSMutableArray alloc] init];
        productList = pl;
    }
    productCell *p = [[productCell alloc] init];
    [p setProductName:productName];
    [productList addObject:p];
}

- (void)addHomeSection:(NSString *)sectionName{
    if (homeSections == nil){
        NSMutableArray *hs = [[NSMutableArray alloc] init];
        homeSections = hs;
    }
    [homeSections addObject:sectionName];
}

- (void)dealloc{
    NSLog(@"Model Dealocated");
}

@end
