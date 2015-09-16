//
//  PiernasCell.h
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PiernasCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numeroRegistroLabel;
@property (weak, nonatomic) IBOutlet UILabel *deLabel;
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
@property (weak, nonatomic) IBOutlet UILabel *arranques1Label;
@property (weak, nonatomic) IBOutlet UILabel *arranques2Label;
@property (weak, nonatomic) IBOutlet UILabel *ciclosLabel;
@property (weak, nonatomic) IBOutlet UILabel *fcsLabel;
@property (weak, nonatomic) IBOutlet UILabel *pSalud1Label;
@property (weak, nonatomic) IBOutlet UILabel *pSalud2Label;
@property (weak, nonatomic) IBOutlet UILabel *aterrLabel;
@property (weak, nonatomic) IBOutlet UILabel *autoLabel;
@property (weak, nonatomic) IBOutlet UILabel *corridosLabel;
@property (weak, nonatomic) IBOutlet UILabel *misionLabel;
@property (weak, nonatomic) IBOutlet UILabel *stdLabel;
@property (weak, nonatomic) IBOutlet UILabel *configLabel;
@property (weak, nonatomic) IBOutlet UILabel *uApoyadaLabel;
@property (weak, nonatomic) IBOutlet UILabel *operacionLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiemposAeronaveIniciaLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiemposAeronaveTerminaLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiemposAeronaveTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiempoTripulacionIniciaLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiempoTripulacionTerminaLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiempoTripulacionTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *cargaInternaLabel;
@property (weak, nonatomic) IBOutlet UILabel *cargaExternaLabel;
@property (weak, nonatomic) IBOutlet UILabel *cargaPaxLabel;
@property (weak, nonatomic) IBOutlet UILabel *cargaHeridosLabel;
@property (weak, nonatomic) IBOutlet UILabel *cargaMuertosLabel;
@property (weak, nonatomic) IBOutlet UILabel *apuArranqueLabel;
@property (weak, nonatomic) IBOutlet UILabel *apuHorasLabel;
@property (weak, nonatomic) IBOutlet UILabel *apuTAireLabel;
@property (weak, nonatomic) IBOutlet UILabel *apuTGenLabel;
@property (weak, nonatomic) IBOutlet UILabel *tripulacionCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *municionCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *puntosCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *impactosCountLabel;

@end
