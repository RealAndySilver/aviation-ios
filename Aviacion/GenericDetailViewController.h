//
//  GenericDetailViewController.h
//  Aviacion
//
//  Created by Andres Abril on 16/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GenericDetailDelegate
@optional
-(void)saveNew:(NSDictionary*)dictionary;
-(void)overwrite:(NSDictionary*)dictionary atIndex:(int)index;
@end
@interface GenericDetailViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property (nonatomic,retain) id<GenericDetailDelegate> delegate;
@property (weak, nonatomic) NSString *itemSeleccionado;
@property (retain, nonatomic) NSMutableDictionary *itemSeleccionadoDic;
@property (weak, nonatomic) NSString *saveType;
@property (weak, nonatomic) NSString *itemType;

//Outlets para tripulación
@property (weak, nonatomic) IBOutlet UITextField *nombreTF;
@property (weak, nonatomic) IBOutlet UITextField *gradoTF;
@property (weak, nonatomic) IBOutlet UITextField *codigoMilitarTF;
@property (weak, nonatomic) IBOutlet UITextField *c1TF;
@property (weak, nonatomic) IBOutlet UITextField *tt1TF;
@property (weak, nonatomic) IBOutlet UITextField *s1TF;
@property (weak, nonatomic) IBOutlet UISwitch *IFRSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *nocheSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *diaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *LVNSwitch;
@property (weak, nonatomic) IBOutlet UITextField *c2TF;
@property (weak, nonatomic) IBOutlet UITextField *tt2TF;
@property (weak, nonatomic) IBOutlet UITextField *s2TF;
@property (weak, nonatomic) IBOutlet UITextField *c3TF;
@property (weak, nonatomic) IBOutlet UITextField *tt3TF;
@property (weak, nonatomic) IBOutlet UITextField *s3TF;
@property (weak, nonatomic) IBOutlet UITextField *c4TF;
@property (weak, nonatomic) IBOutlet UITextField *tt4TF;
@property (weak, nonatomic) IBOutlet UITextField *s4TF;


//Outlets para munición
@property (weak, nonatomic) IBOutlet UITextField *municionTipoTF;
@property (weak, nonatomic) IBOutlet UITextField *municionCantidadTF;
@property (weak, nonatomic) IBOutlet UITextField *municionCargadaTF;
@property (weak, nonatomic) IBOutlet UITextField *municionDisparadaTF;
@property (weak, nonatomic) IBOutlet UITextField *municionEstadoTF;

@property (weak, nonatomic) IBOutlet UITextField *municionDepartamentoTF;
@property (weak, nonatomic) IBOutlet UITextField *municionMunicipioTF;
@property (weak, nonatomic) IBOutlet UITextField *municionSitioTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLatTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLatGrTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLatMinTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLatSecTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLonTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLonGrTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLonMinTF;
@property (weak, nonatomic) IBOutlet UITextField *municionLonSecTF;



//Outlets para impactos
@property (weak, nonatomic) IBOutlet UITextField *impactosTipoTF;
@property (weak, nonatomic) IBOutlet UITextField *impactosCargadaTF;
@property (weak, nonatomic) IBOutlet UITextField *impactosDisparadaTF;
@property (weak, nonatomic) IBOutlet UITextField *impactosEstadoTF;

//Outlets para puntos
@property (weak, nonatomic) IBOutlet UITextField *numeroTF;
@property (weak, nonatomic) IBOutlet UITextField *tipoDePuntoTF;
@property (weak, nonatomic) IBOutlet UITextField *descripcionTF;
@property (weak, nonatomic) IBOutlet UITextField *latTF;
@property (weak, nonatomic) IBOutlet UITextField *grLatTF;
@property (weak, nonatomic) IBOutlet UITextField *minLatTF;
@property (weak, nonatomic) IBOutlet UITextField *segLatTF;
@property (weak, nonatomic) IBOutlet UITextField *lonTF;
@property (weak, nonatomic) IBOutlet UITextField *grLonTF;
@property (weak, nonatomic) IBOutlet UITextField *minLonTF;
@property (weak, nonatomic) IBOutlet UITextField *segLonTF;
@property (weak, nonatomic) IBOutlet UITextField *puntoTF;
@end
