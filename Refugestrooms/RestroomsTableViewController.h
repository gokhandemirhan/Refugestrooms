//
//  RestroomsTableViewController.h
//  Refugestrooms
//
//  Created by Elena on 11/4/14.
//  Copyright (c) 2014 gokhandemirhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestroomsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *restroomsTableView;
@property (nonatomic, retain) IBOutlet NSMutableArray *restroomsDataForTable;


@end
