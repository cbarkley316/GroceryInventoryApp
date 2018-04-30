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
@synthesize invEditWasPushed, homeSections, storeSections, productList;

- (void)createProduct:(NSString *)productName homeSection:(NSString *)homeSection storeSection:(NSString *)storeSection amountNeeded:(NSInteger)amountNeeded{
    //NSLog(@"Creating product");
    if (productList == nil){
        NSMutableArray *pl = [[NSMutableArray alloc] init];
        productList = pl;
    }
    //home and store section lists are initialized by the default sections. These next 2 'if' statements are here just in case I change the code.
    if (homeSections == nil){
        NSMutableArray *hs = [[NSMutableArray alloc] init];
        homeSections = hs;
    }
    if (storeSections == nil){
        NSMutableArray *ss = [[NSMutableArray alloc] init];
        storeSections = ss;
    }
    productCell *p = [[productCell alloc] init];
    [p setProductName:productName];
    [p setHomeSection:homeSection];
    [p setStoreSection:storeSection];
    [p setAmountNeeded:amountNeeded];
    [productList addObject:p];
}

- (void)addHomeSection:(NSString *)sectionName{
    ////Make an array\/
    if (homeSections == nil){
        NSMutableArray *hs = [[NSMutableArray alloc] init];
        homeSections = hs;
    }
    [homeSections addObject:sectionName];
}

- (void)addStoreSection:(NSString *)sectionName{
    if (storeSections == nil){
        NSMutableArray *ss = [[NSMutableArray alloc] init];
        storeSections = ss;
    }
    [storeSections addObject:sectionName];
}

- (void)dealloc{
    NSLog(@"Model Dealocated");
}

@end
