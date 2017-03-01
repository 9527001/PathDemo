//
//  AppDelegate.h
//  PathDemo
//
//  Created by 中企互联 on 17/3/1.
//  Copyright © 2017年 中企互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

