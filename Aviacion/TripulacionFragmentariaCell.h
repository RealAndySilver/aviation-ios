//
//  TripulacionFragmentariaCell.h
//  Aviacion
//
//  Created by Andres Abril on 11/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripulacionFragmentariaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *equipoLabel;
@property (weak, nonatomic) IBOutlet UILabel *matriculaLabel;
@property (weak, nonatomic) IBOutlet UILabel *indicativoLabel;
@property (weak, nonatomic) IBOutlet UILabel *cargoLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradoLabel;
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *configLabel;

@end
