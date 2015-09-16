//
//  GenericTableViewController.h
//  Aviacion
//
//  Created by Andres Abril on 15/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericDetailViewController.h"
@interface GenericTableViewController : UITableViewController<GenericDetailDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(retain, nonatomic)NSMutableArray *genericArray;
@property(weak, nonatomic)NSString *type;
@end
