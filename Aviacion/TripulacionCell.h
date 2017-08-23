//
//  TripulacionCell.h
//  Aviacion
//
//  Created by Andres Abril on 16/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripulacionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradoLabel;
@property (weak, nonatomic) IBOutlet UILabel *codigoMilitarLabel;
@property (weak, nonatomic) IBOutlet UILabel *c1Label;
@property (weak, nonatomic) IBOutlet UILabel *tt1Label;
@property (weak, nonatomic) IBOutlet UILabel *s1Label;
@property (weak, nonatomic) IBOutlet UISwitch *IFRSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *nocheSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *diaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *LVNSwitch;
@property (weak, nonatomic) IBOutlet UILabel *c2Label;
@property (weak, nonatomic) IBOutlet UILabel *tt2Label;
@property (weak, nonatomic) IBOutlet UILabel *s2Label;
@property (weak, nonatomic) IBOutlet UILabel *c3Label;
@property (weak, nonatomic) IBOutlet UILabel *tt3Label;
@property (weak, nonatomic) IBOutlet UILabel *s3Label;
@property (weak, nonatomic) IBOutlet UILabel *c4Label;
@property (weak, nonatomic) IBOutlet UILabel *tt4Label;
@property (weak, nonatomic) IBOutlet UILabel *s4Label;

@end
