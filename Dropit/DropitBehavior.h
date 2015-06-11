//
//  DropitBehavior.h
//  Dropit
//
//  Created by vampy on 11/6/15.
//  Copyright (c) 2015 Xenova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;
@end
