//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by hyc on 2019/9/16.
//  Copyright © 2019 hyc. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
@interface BNRItemsViewController() {
}
    @property (nonatomic) NSMutableArray* privateArrays;
@end

@implementation BNRItemsViewController

- (instancetype)  init {
    // 返回的是一个 UITableView
    self = [super initWithStyle: UITableViewStylePlain];
    
    if(self) {
        for(int i = 0; i< 51; i ++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return [self.privateArrays[0] count];
    } else {
        return [self.privateArrays[1] count];
    }
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"Greter than 50.00$";
    }
        return @"Less than 50.00$";
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray* items = [[BNRItemStore sharedStore] allItems];
//    BNRItem* item = items[indexPath.row];
    NSLog(@" %d %d, ---  ", indexPath.section, indexPath.row);
    BNRItem* item = self.privateArrays[indexPath.section][indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}


- (instancetype) initWithStyle:(UITableViewStyle)style {
    return [self init];
}


- (void) viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.privateArrays = [[NSMutableArray alloc] init];
    
    NSArray* items = [[BNRItemStore sharedStore] allItems];
    [self.privateArrays addObject:[[NSMutableArray alloc] init]];
    [self.privateArrays addObject:[[NSMutableArray alloc] init]];
    for(int i = 0 ; i < [items count] ; i ++ ) {
        BNRItem* item = items[i];
        if(item.valueInDollars > 50) {
            [self.privateArrays[0] addObject:item];
        } else {
            [self.privateArrays[1] addObject:item];
        }
    }
    
}
@end
