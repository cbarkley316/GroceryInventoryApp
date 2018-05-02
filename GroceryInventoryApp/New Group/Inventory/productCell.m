//
//  productCell.m
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/3/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import "productCell.h"

@implementation productCell

@synthesize productNameLbl, amountNeededLbl, amountNeeded, productName, homeSection, storeSection;

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)updateCollectionCell:(NSString *)product amountNeeded:(NSInteger)amountNeeded{
    self.productNameLbl.text = product;
    self.amountNeededLbl.text = [NSString stringWithFormat: @"%ld", (long)amountNeeded];//convert int to string
}

-(id)initWithProductName:(NSString *)productName homeSection:(NSString *)homeSection storeSection:(NSString *)storeSection amountNeeded:(NSInteger)amountNeeded{
    if ((self = [super init])){
        self.productName = productName;
        self.homeSection = homeSection;
        self.storeSection = storeSection;
        self.amountNeeded = amountNeeded;
    }
    return self;
}


////Work in progress
//#pragma mark NSCoding
//
//#define kProductNameKey @"productName"
//#define kHomeSectionKey @"homeSection"
//#define kStoreSectionKey @"storeSection"
//#define kAmountNeededKey @"amountNeeded"
//
//- (void)encodeWithCoder:(NSCoder *)aCoder{
//    [aCoder encodeObject:productName forKey:kProductNameKey];
//    [aCoder encodeObject:homeSection forKey:kHomeSectionKey];
//    [aCoder encodeObject:storeSection forKey:kStoreSectionKey];
//    [aCoder encodeInteger:amountNeeded forKey:kAmountNeededKey];
//}
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    NSString *productName = [aDecoder decodeObjectForKey:kProductNameKey];
//    NSString *homeSection = [aDecoder decodeObjectForKey:kHomeSectionKey];
//    NSString *storeSection = [aDecoder decodeObjectForKey:kStoreSectionKey];
//    NSInteger amountNeeded = [aDecoder decodeIntegerForKey:kAmountNeededKey];
//    return [self initWithProductName:productName
//                         homeSection:homeSection
//                        storeSection:storeSection
//                        amountNeeded:amountNeeded];
//}


@end
