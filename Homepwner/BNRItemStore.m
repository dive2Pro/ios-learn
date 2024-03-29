//
//  BNRItemStore.m
//  Homepwner
//
//  Created by hyc on 2019/9/16.
//  Copyright © 2019 hyc. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()

@property (nonatomic) NSMutableArray* privateItems;

@end

@implementation BNRItemStore

+ (instancetype) sharedStore {
    static BNRItemStore * sharedStore = nil;
    
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"use + [BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype) initPrivate {
    self = [super init];
    
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BNRItem *) createItem {
    BNRItem* item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}
- (NSArray*) allItems {
    return self.privateItems;
}

@end
