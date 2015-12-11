//
//  TripulacionOrdenCellTableViewCell.h
//  Aviacion
//
//  Created by Andres Abril on 8/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripulacionOrdenCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *personaLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradoLabel;
@property (weak, nonatomic) IBOutlet UILabel *codigoMilitarLabel;
@property (weak, nonatomic) IBOutlet UILabel *cargoLabel;
@end
