//
//  FrecuenciasTableViewCell.h
//  Aviacion
//
//  Created by Andres Abril on 10/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrecuenciasTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *vhfLabel;
@property (weak, nonatomic) IBOutlet UILabel *uhfLabel;
@property (weak, nonatomic) IBOutlet UILabel *hfLabel;
@property (weak, nonatomic) IBOutlet UILabel *fmLabel;
@property (weak, nonatomic) IBOutlet UILabel *llaveLabel;

@end
