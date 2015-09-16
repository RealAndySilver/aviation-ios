//
//  MunicionImpactosCell.h
//  Aviacion
//
//  Created by Andres Abril on 16/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MunicionImpactosCell : UITableViewCell
//Outlets Munición
@property (weak, nonatomic) IBOutlet UILabel *municionTipoLabel;
@property (weak, nonatomic) IBOutlet UILabel *municionCargadaLabel;
@property (weak, nonatomic) IBOutlet UILabel *municionDisparadaLabel;
@property (weak, nonatomic) IBOutlet UILabel *municionEstadoLabel;

//Outlets Impactos
@property (weak, nonatomic) IBOutlet UILabel *impactosTipoLabel;
@property (weak, nonatomic) IBOutlet UILabel *impactosCargadaLabel;
@property (weak, nonatomic) IBOutlet UILabel *impactosDisparadaLabel;
@property (weak, nonatomic) IBOutlet UILabel *impactosEstadoLabel;

@end
