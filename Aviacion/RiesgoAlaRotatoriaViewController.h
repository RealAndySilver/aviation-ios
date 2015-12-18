//
//  AlaRotatoriaViewController.h
//  Aviacion
//
//  Created by Andres Abril on 14/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListasFijas.h"
@interface RiesgoAlaRotatoriaViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (weak, nonatomic) IBOutlet UITextField *amenazaTF;
@property (weak, nonatomic) IBOutlet UITextField *personalOrganicoTF;
@property (weak, nonatomic) IBOutlet UITextField *personalAgregadoTF;
@property (weak, nonatomic) IBOutlet UITextField *infoSuperficialTF;
@property (weak, nonatomic) IBOutlet UITextField *infoEspecificaTF;
@property (weak, nonatomic) IBOutlet UITextField *diasDisponibilidadTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *supervisionSC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *planeamientoSC;


@property (weak, nonatomic) IBOutlet UITextField *pam0a25TF;
@property (weak, nonatomic) IBOutlet UITextField *pam25a50TF;
@property (weak, nonatomic) IBOutlet UITextField *pamMasDe505TF;
@property (weak, nonatomic) IBOutlet UITextField *p0a25TF;
@property (weak, nonatomic) IBOutlet UITextField *p25a50TF;
@property (weak, nonatomic) IBOutlet UITextField *pMasDe505TF;
@property (weak, nonatomic) IBOutlet UITextField *tripulante0a25TF;
@property (weak, nonatomic) IBOutlet UITextField *tripulante25a50TF;
@property (weak, nonatomic) IBOutlet UITextField *tripulanteMasDe505TF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pamSC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pSC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tripulanteSC;


@property (weak, nonatomic) IBOutlet UITextField *diasSinRealizarMismoTipoTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rendimientoSC;
@property (weak, nonatomic) IBOutlet UITextField *rendimientoTripAdecuadoTF;
@property (weak, nonatomic) IBOutlet UITextField *rendimientoTripNoAdecuadoTF;
@property (weak, nonatomic) IBOutlet UITextField *rendimientoTripDiaTF;
@property (weak, nonatomic) IBOutlet UITextField *rendimientoTripNocheTF;
@property (weak, nonatomic) IBOutlet UITextField *rendimientoTripLVN;

@property (weak, nonatomic) IBOutlet UILabel *riesgoLabel;

@property (weak, nonatomic) IBOutlet UITextField *multiplesAeronavesTF;
@property (weak, nonatomic) IBOutlet UITextField *vueloInternacionalTF;
@property (weak, nonatomic) IBOutlet UITextField *aRasDeTierraTF;
@property (weak, nonatomic) IBOutlet UITextField *bajoNivelTF;
@property (weak, nonatomic) IBOutlet UITextField *cargaExternaTF;
@property (weak, nonatomic) IBOutlet UITextField *gruaRescateTF;

@property (weak, nonatomic) IBOutlet UITextField *rapelTF;
@property (weak, nonatomic) IBOutlet UITextField *asaltoAereoTF;
@property (weak, nonatomic) IBOutlet UITextField *apoyoDeFuegoTF;
@property (weak, nonatomic) IBOutlet UITextField *reconocimientoTF;
@property (weak, nonatomic) IBOutlet UITextField *seguridadTF;
@property (weak, nonatomic) IBOutlet UITextField *paracaidismoTF;

@property (weak, nonatomic) IBOutlet UITextField *casevacTF;
@property (weak, nonatomic) IBOutlet UITextField *recuperacionAeronavesTF;
@property (weak, nonatomic) IBOutlet UITextField *rescateRehenesTF;
@property (weak, nonatomic) IBOutlet UITextField *vueloVIPTF;
@property (weak, nonatomic) IBOutlet UITextField *diaTF;
@property (weak, nonatomic) IBOutlet UITextField *oneTimeFlightTF;

@property (weak, nonatomic) IBOutlet UITextField *movimientoAereoTF;
@property (weak, nonatomic) IBOutlet UITextField *reposicionamientoAeronavesTF;
@property (weak, nonatomic) IBOutlet UITextField *entrenamientoEmergenciasTF;
@property (weak, nonatomic) IBOutlet UITextField *vueloPruebaManttoTF;
@property (weak, nonatomic) IBOutlet UITextField *entrenamientoNOEmergenciasTF;
@property (weak, nonatomic) IBOutlet UITextField *ceremoniasDemostracionesTF;

@property (weak, nonatomic) IBOutlet UITextField *pam0a6000TF;
@property (weak, nonatomic) IBOutlet UITextField *pam6001a10000TF;
@property (weak, nonatomic) IBOutlet UITextField *pam10001a12000TF;
@property (weak, nonatomic) IBOutlet UITextField *pamSobre12000TF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *factoresGeograficosSC;
@property (weak, nonatomic) IBOutlet UITextField *aguaAMasDe10TF;
@property (weak, nonatomic) IBOutlet UITextField *selvaTF;
@property (weak, nonatomic) IBOutlet UITextField *terrenoPlanoTF;


@property (weak, nonatomic) IBOutlet UISwitch *aeronaveSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *movilidadSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *transporteSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *operacionesSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *puertasAbiertasSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *cargasSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *helipuertoSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *extencionHoraSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *extencionTiempoSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *aeronaveSolaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *chalecosALSESwitch;
@property (weak, nonatomic) IBOutlet UISwitch *equipoSupervivenciaSwitch;

@property (weak, nonatomic) IBOutlet UITextField *seleccionPamTF;
@property (weak, nonatomic) IBOutlet UITextField *seleccionPTF;
@property (weak, nonatomic) IBOutlet UITextField *tripAdicionalTF;
@property (weak, nonatomic) IBOutlet UITextField *porcentajeIluminacionTF;
@property (weak, nonatomic) IBOutlet UITextField *anguloLunaPamTF;

//total 1 labels
@property (weak, nonatomic) IBOutlet UILabel *amenazaTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *supervisionTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *planeamientoTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *diasDisponibilidadTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *frecuenciaPamTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *frecuenciaPTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *frecuenciaTripulanteTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *diasSinRealizarTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *descansoTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *condicionesTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *complejidadTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *factoresGeograficosTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *factoresRiesgoTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalValoresMisionLabel;

@property (weak, nonatomic) IBOutlet UILabel *seleccionPamTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *seleccionPTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *seleccionTripulacionTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *porcentajeTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *anguloTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLvnLabel;
@end
