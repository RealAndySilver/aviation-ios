//
//  RequerimientoViewController.h
//  Aviacion
//
//  Created by Andres Abril on 12/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TanqueoArmamentoRequerimientoCell.h"
#import "PiernasRequerimientoCell.h"
@interface RequerimientoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) NSDictionary *requerimientoDic;

@property (weak, nonatomic) IBOutlet UITextField *consecutivoTF;
@property (weak, nonatomic) IBOutlet UITextField *mdn1TF;
@property (weak, nonatomic) IBOutlet UITextField *mdn2TF;
@property (weak, nonatomic) IBOutlet UITextField *antecedenteTF;
@property (weak, nonatomic) IBOutlet UITextField *lugarTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadOperativaMayorTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadOperativaMenorTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadApoyadaTF;

@property (weak, nonatomic) IBOutlet UITextField *enemigoTF;
@property (weak, nonatomic) IBOutlet UITextField *propiasTropasTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadDeSeguridadEnLaZonaTF;
@property (weak, nonatomic) IBOutlet UITextField *requiereHelicopteroDeSeguridadTF;
@property (weak, nonatomic) IBOutlet UISwitch *comunidadesIndigenasSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *comunidadesAfroSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *comunidadesDePazSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *caseriosSwitch;

@property (weak, nonatomic) IBOutlet UITextField *descripcionDeLaMisionTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaHoraEjecucionTF;
@property (weak, nonatomic) IBOutlet UITextField *misionTF;
@property (weak, nonatomic) IBOutlet UITextField *configuracionTF;
@property (weak, nonatomic) IBOutlet UISwitch *ifrSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *nocheSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *diaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *lvnSwitch;

@property (weak, nonatomic) IBOutlet UITableView *piernasTV;
@property (weak, nonatomic) IBOutlet UITextField *coordenadasDeTF;
@property (weak, nonatomic) IBOutlet UITextField *altitudDeTF;
@property (weak, nonatomic) IBOutlet UITextField *coordenadasATF;
@property (weak, nonatomic) IBOutlet UITextField *alititudATF;

@property (weak, nonatomic) IBOutlet UITableView *tanqueoTV;

@property (weak, nonatomic) IBOutlet UITableView *armamentoTV;

@property (weak, nonatomic) IBOutlet UITextField *comandanteUnidadSolicitanteTF;
@property (weak, nonatomic) IBOutlet UITextField *oficialDeOperacionesResponsableTF;
@property (weak, nonatomic) IBOutlet UITextField *telefonoTF;
@property (weak, nonatomic) IBOutlet UITextField *ubicacionTF;
@property (weak, nonatomic) IBOutlet UITextField *frecuenciasTF;
@property (weak, nonatomic) IBOutlet UITextField *indicativosTF;
@property (weak, nonatomic) IBOutlet UITextField *encargadoRequerimientoTF;
@property (weak, nonatomic) IBOutlet UITextField *telefonoEncargadoRequerimientoTF;
@property (weak, nonatomic) IBOutlet UITextView *observacionesTextView;
@property (weak, nonatomic) IBOutlet UITextField *firmaTF;
@property (weak, nonatomic) IBOutlet UITextField *cargoTF;

@end
