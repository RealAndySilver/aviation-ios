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
@property (weak, nonatomic) NSDictionary *requerimientoDic;
@property (weak, nonatomic) NSDictionary *ordenDic;
@property(weak,nonatomic) NSString *numeroRegistro;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

//Totales
@property (strong, nonatomic) IBOutlet UIView *totalView;

@property (strong, nonatomic) IBOutlet UILabel *totalInternaLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalExternaLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalPasajerosLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalHeridosLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalMuertosLabel;

@property (strong, nonatomic) IBOutlet UILabel *totalArranquesLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalHorasLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalAireLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalGenLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalNo1Label;
@property (strong, nonatomic) IBOutlet UILabel *totalNo2Label;

@property (strong, nonatomic) IBOutlet UILabel *totalAterrLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalAutoLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalCorridosLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalCiclosLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalFCSLabel;
@property (strong, nonatomic) IBOutlet UILabel *total20Label;
@property (strong, nonatomic) IBOutlet UILabel *totalPTotal1Label;
@property (strong, nonatomic) IBOutlet UILabel *totalPTotal2Label;

@end
