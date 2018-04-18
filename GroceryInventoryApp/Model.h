//
//  Model.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 4/11/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <Foundation/Foundation.h>
@class invViewController;

@interface Model : NSObject

@property (strong) NSMutableArray *homeSections;
@property (strong) NSMutableArray *storeSections;
@property (strong) NSMutableArray *productList;
@property (weak) invViewController *holderObject;

- (void)addHomeSection:(NSString *)sectionName;
- (void)createProduct:(NSString *)productName;

@end
