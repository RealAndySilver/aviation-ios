//
//  ListTableViewController.h
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PiernasDetailViewController.h"
@interface PiernasListTableViewController : UITableViewController<PiernasDetailDelegate>
@property(weak,nonatomic) NSString *numeroRegistro;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
