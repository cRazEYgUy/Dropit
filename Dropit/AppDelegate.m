//
//  AppDelegate.m
//  Dropit
//
//  Created by vampy on 11/6/15.
//  Copyright (c) 2015 Xenova. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
#import "PlayerViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
    // new instance variable named _players
    NSMutableArray *_players;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //implement some code for Player
    _players = [NSMutableArray arrayWithCapacity:20];
    
    Player *player= [[Player alloc] init];

    player.name= @"Vampire";
    player.game= @"Samurai Siege";
    player.rating= 6;
    [_players addObject: player];
    
    player= [[Player alloc] init];
    player.name= @"Phyoe Phyoe";
    player.game= @"Hay Day";
    player.rating= 6;
    [_players addObject: player];
    
    player= [[Player alloc] init];
    player.name= @"Dede";
    player.game= @"Candy Crush";
    player.rating= 5;
    [_players addObject: player];
    
    player= [[Player alloc] init];
    player.name= @"MB";
    player.game= @"Soda Crush";
    player.rating= 3;
    [_players addObject: player];
    
    player= [[Player alloc] init];
    player.name= @"Ken";
    player.game= @"FarmVille";
    player.rating= 2;
    [_players addObject: player];
    
    
    player= [[Player alloc] init];
    player.name= @"Xeon";
    player.game= @"Happy CHef 2";
    player.rating= 4;
    [_players addObject: player];
    
    player= [[Player alloc] init];
    player.name= @"Ko Chu Sein";
    player.game= @"Subway Surf";
    player.rating= 1;
    [_players addObject: player];
    
    player= [[Player alloc] init];
    player.name= @"Sho";
    player.game= @"Plant Vs Zombie";
    player.rating= 2;
    [_players addObject: player];
    
    
    player= [[Player alloc] init];
    player.name= @"Two Bull";
    player.game= @"Boom Beach";
    player.rating= 6;
    [_players addObject: player];
    
    //App Delegate gets the references programmatically from Top Level View Controller.
    //coz Storyboard's limitations.
    UITabBarController *myTabBarController= (UITabBarController *)self.window.rootViewController;
    UINavigationController *myNavigationController= [myTabBarController viewControllers][0];
    PlayerViewController *myPlayerViewController= [myNavigationController viewControllers][0];
    //set the MutableArray into PlayerViewController's players // Check in PlayerVi
    myPlayerViewController.players= _players;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.xenova.Dropit" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Dropit" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Dropit.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
