//
//  BNRItemStore.h
//  Homepwner
//
//  Created by hyc on 2019/9/16.
//  Copyright © 2019 hyc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BNRItem;


@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray * allItems;

+(instancetype) sharedStore;

-(BNRItem *) createItem;

@end

NS_ASSUME_NONNULL_END
