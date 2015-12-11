//
//  RestriccionCell.h
//  Aviacion
//
//  Created by Andres Abril on 11/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestriccionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *restriccionLabel;
@property (weak, nonatomic) IBOutlet UILabel *seguridadLabel;
@property (weak, nonatomic) IBOutlet UILabel *aacFacLabel;
@property (weak, nonatomic) IBOutlet UILabel *contingenciasLabel;

@end
