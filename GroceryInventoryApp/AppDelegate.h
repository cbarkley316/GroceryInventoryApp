//
//  AppDelegate.h
//  GroceryInventoryApp
//
//  Created by Catherine Kreamer on 3/28/18.
//  Copyright © 2018 Camden Barkley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
////properties Came by default
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

////my methods


- (void)saveContext;


@end

