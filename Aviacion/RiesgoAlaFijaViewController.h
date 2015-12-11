//
//  RiesgoAlaFijaViewController.h
//  Aviacion
//
//  Created by Andres Abril on 4/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface RiesgoAlaFijaViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

#pragma mark - Amenaza
@property (weak, nonatomic) IBOutlet UITextField *situacionEnemigaTF;

#pragma mark - Supervision
@property (weak, nonatomic) IBOutlet UISegmentedControl *supervisionSC;
@property (weak, nonatomic) IBOutlet UITextField *personalOrganicoTF;
@property (weak, nonatomic) IBOutlet UITextField *personalAgredadoTF;

#pragma mark - Planeamiento
@property (weak, nonatomic) IBOutlet UISegmentedControl *planeamientoSC;
@property (weak, nonatomic) IBOutlet UITextField *infoSuperficialTF;
@property (weak, nonatomic) IBOutlet UITextField *infoEspecificaTF;

#pragma mark - Nivel de Pericia PAM
@property (weak, nonatomic) IBOutlet UITextField *pamDiasSinVolarTF;
@property (weak, nonatomic) IBOutlet UITextField *pam60DiasTF;

#pragma mark - Nivel de Pericia P
@property (weak, nonatomic) IBOutlet UITextField *pDiasSinVolarTF;
@property (weak, nonatomic) IBOutlet UITextField *p60DiasTF;

#pragma mark - Nivel de Pericia TV
@property (weak, nonatomic) IBOutlet UITextField *tvDiasSinVolarTF;
@property (weak, nonatomic) IBOutlet UITextField *tv60DiasTF;

#pragma mark - Condiciones Meteorologicas
@property (weak, nonatomic) IBOutlet UITextField *cmSalidaTF;
@property (weak, nonatomic) IBOutlet UITextField *cmDestinoTF;

#pragma mark - Complejidad de la Mision
@property (weak, nonatomic) IBOutlet UITextField *transporteExplosivosTF;
@property (weak, nonatomic) IBOutlet UITextField *movimientoAereoTF;
@property (weak, nonatomic) IBOutlet UITextField *mantenimientoTF;
@property (weak, nonatomic) IBOutlet UITextField *sostAviacionTF;
@property (weak, nonatomic) IBOutlet UITextField *reconocimientoTF;
@property (weak, nonatomic) IBOutlet UITextField *entrenamientoTF;
@property (weak, nonatomic) IBOutlet UITextField *vueloInternacionalTF;
@property (weak, nonatomic) IBOutlet UITextField *trpTF;
@property (weak, nonatomic) IBOutlet UITextField *comandoYControlTF;
@property (weak, nonatomic) IBOutlet UITextField *inteligenciaTecnicaTF;
@property (weak, nonatomic) IBOutlet UITextField *medevacTF;
@property (weak, nonatomic) IBOutlet UITextField *paracaidismoTF;

#pragma mark - Condicion de Pista
@property (weak, nonatomic) IBOutlet UISegmentedControl *cpSC1;
@property (weak, nonatomic) IBOutlet UITextField *secaTF;
@property (weak, nonatomic) IBOutlet UITextField *humedaTF;
@property (weak, nonatomic) IBOutlet UITextField *noPreparadaTF;

@property (weak, nonatomic) IBOutlet UISegmentedControl *cpSC2;
@property (weak, nonatomic) IBOutlet UITextField *combustibleTF;
@property (weak, nonatomic) IBOutlet UITextField *sinCombustibleTF;

@property (weak, nonatomic) IBOutlet UISegmentedControl *cpSC3;
@property (weak, nonatomic) IBOutlet UITextField *atcTF;
@property (weak, nonatomic) IBOutlet UITextField *sinAtcTF;


#pragma mark - Rendimiento de Tripulacion
@property (weak, nonatomic) IBOutlet UISegmentedControl *rendimientoDeTripulacionSC;
@property (weak, nonatomic) IBOutlet UITextField *adecuadoTF;
@property (weak, nonatomic) IBOutlet UITextField *noAdecuadoTF;


#pragma mark - Tipo de Aeronave
@property (weak, nonatomic) IBOutlet UITextField *tipoDeAeronaveTF;

#pragma mark - Riesgo
@property (weak, nonatomic) IBOutlet UITextField *riesgoTF;

#pragma mark - Valores de Riesgo
@property (weak, nonatomic) IBOutlet UILabel *amenazaTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *supervisionTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *planeamientoTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *nivelDePericiaTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *condicionesMeteorologicasTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *complejidadDeLaMisionTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *condicionDeLaPistaTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipoDeAeronaveTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *rendimientoDeLaTripulacionTotalLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *riesgoLabel;
@property (weak, nonatomic) IBOutlet UILabel *riesgoLabel2;

@end
