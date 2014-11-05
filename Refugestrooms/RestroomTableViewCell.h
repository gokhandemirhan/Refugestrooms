//
//  RestroomTableViewCell.h
//  Refugestrooms
//
//  Created by Elena on 11/4/14.
//  Copyright (c) 2014 gokhandemirhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestroomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *unisexText;
@property (weak, nonatomic) IBOutlet UILabel *nameText;
@property (weak, nonatomic) IBOutlet UILabel *accessibleText;
@property (weak, nonatomic) IBOutlet UILabel *dateText;
@end
