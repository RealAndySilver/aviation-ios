//
//  PuntosCell.h
//  Aviacion
//
//  Created by Andres Abril on 16/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PuntosCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numeroLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipoDePuntoLabel;
@property (weak, nonatomic) IBOutlet UILabel *descripcionLabel;
@property (weak, nonatomic) IBOutlet UILabel *latLabel;
@property (weak, nonatomic) IBOutlet UILabel *grLatLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLatLabel;
@property (weak, nonatomic) IBOutlet UILabel *segLatLabel;
@property (weak, nonatomic) IBOutlet UILabel *lonLabel;
@property (weak, nonatomic) IBOutlet UILabel *grLonLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLonLabel;
@property (weak, nonatomic) IBOutlet UILabel *segLonLabel;
@property (weak, nonatomic) IBOutlet UILabel *puntoLabel;
@end
