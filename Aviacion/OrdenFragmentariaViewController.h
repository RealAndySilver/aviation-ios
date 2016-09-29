//
//  OrdenFragmentariaViewController.h
//  Aviacion
//
//  Created by Andres Abril on 8/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrecuenciasTableViewCell.h"
#import "RestriccionCell.h"
#import "TripulacionFragmentariaCell.h"
@interface OrdenFragmentariaViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) NSDictionary *ordenFragmentariaDic;

@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
//Section 1
@property (weak, nonatomic) IBOutlet UITextField *tipoOperacionTF;
@property (weak, nonatomic) IBOutlet UITextField *requerimientoTF;
@property (weak, nonatomic) IBOutlet UITextField *clasificacionOFragmentariaTF;
@property (weak, nonatomic) IBOutlet UITextField *noConsecutivoTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaTF;
@property (weak, nonatomic) IBOutlet UITextField *nombreYNoORDOPTF;

//Section 2
@property (weak, nonatomic) IBOutlet UITextField *enemigoTF;
@property (weak, nonatomic) IBOutlet UITextField *propiasTropasTF;
@property (weak, nonatomic) IBOutlet UITextField *tiempoMeteorologicoTF;
@property (weak, nonatomic) IBOutlet UITextField *agregacionesYSegregacionesTF;
@property (weak, nonatomic) IBOutlet UISwitch *comunidadesIndigenasSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *comunidadesDePazSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *comunidadesAfroSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *caseriosPoblacionesSwitch;

//Section 3
@property (weak, nonatomic) IBOutlet UITextField *quienTF;
@property (weak, nonatomic) IBOutlet UITextField *dondeTF;
@property (weak, nonatomic) IBOutlet UITextField *cuandoTF;
@property (weak, nonatomic) IBOutlet UITextField *queTF;
@property (weak, nonatomic) IBOutlet UITextField *paraQueTF;

//Section 4
@property (weak, nonatomic) IBOutlet UITextView *intencionesTextView;
@property (weak, nonatomic) IBOutlet UITextView *instruccionesCoordinacionTextView;
@property (weak, nonatomic) IBOutlet UITextField *pasajerosTF;
@property (weak, nonatomic) IBOutlet UITextField *equipoEspecialTF;
@property (weak, nonatomic) IBOutlet UITextField *rutaVueloTF;
@property (weak, nonatomic) IBOutlet UITextField *misionTF;
@property (weak, nonatomic) IBOutlet UISwitch *manifiestoSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ifrSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *nocheSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *diaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *lvnSwitch;

//Section 5
//Table view tripulación
@property (weak, nonatomic) IBOutlet UITableView *tripulacionTV;

//Section 6
//Table view restricción
@property (weak, nonatomic) IBOutlet UITableView *resticcionTV;

//Section 7
@property (weak, nonatomic) IBOutlet UITextField *comandanteMisionAreaTF;
@property (weak, nonatomic) IBOutlet UITextField *armamentoTF;
@property (weak, nonatomic) IBOutlet UITextField *mantenimientoTF;
@property (weak, nonatomic) IBOutlet UITextField *combustibleTF;
@property (weak, nonatomic) IBOutlet UITableView *frecuenciasTV;

//Section 8
@property (weak, nonatomic) IBOutlet UITextField *puedeSerCumplidaOrientacionTF;
@property (weak, nonatomic) IBOutlet UITextField *requiereCambioTF;
@property (weak, nonatomic) IBOutlet UITextView *observacionesTextView;
@property (weak, nonatomic) IBOutlet UITableView *planeamientoTV;
@property (weak, nonatomic) IBOutlet UITextField *tarjetasTF;
@property (weak, nonatomic) IBOutlet UITextField *nivelRiesgoIzqTF;
@property (weak, nonatomic) IBOutlet UITextField *nivelRiesgoDerTF;

//Section 9
@property (weak, nonatomic) IBOutlet UITextField *comandanteOficialOperacionesTF;
@property (weak, nonatomic) IBOutlet UITextField *comandanteMisionTF;
@property (weak, nonatomic) IBOutlet UITextField *voBoComandantePdmaTF;


@end
