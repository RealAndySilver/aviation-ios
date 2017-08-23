//
//  PiernasDetailViewController.h
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PiernasDetailDelegate
@optional
-(void)saveNew:(NSDictionary*)dictionary;
-(void)overwrite:(NSDictionary*)dictionary atIndex:(int)index;
@end
@interface PiernasDetailViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) NSString *type;
@property (weak, nonatomic) NSString *piernaNumber;
@property (weak, nonatomic) NSMutableArray *piernaArray;
@property (retain, nonatomic) NSMutableDictionary *piernaDic;
@property (weak, nonatomic) NSDictionary *ordenDic;
@property (nonatomic,retain) id<PiernasDetailDelegate> delegate;

//Outlets
@property (weak, nonatomic) IBOutlet UILabel *numeroPierna;
@property (weak, nonatomic) IBOutlet UITextField *deTF;
@property (weak, nonatomic) IBOutlet UITextField *aTF;
@property (weak, nonatomic) IBOutlet UITextField *arranque1TF;
@property (weak, nonatomic) IBOutlet UITextField *arranque2TF;
@property (weak, nonatomic) IBOutlet UITextField *aterrTF;
@property (weak, nonatomic) IBOutlet UITextField *autoTF;
@property (weak, nonatomic) IBOutlet UITextField *corridosTF;
@property (weak, nonatomic) IBOutlet UITextField *misionTF;
@property (weak, nonatomic) IBOutlet UITextField *stdTF;
@property (weak, nonatomic) IBOutlet UITextField *configTF;
@property (weak, nonatomic) IBOutlet UITextField *uApoyadaTF;
@property (weak, nonatomic) IBOutlet UITextField *operacionTF;
@property (weak, nonatomic) IBOutlet UITextField *pSalud1TF;
@property (weak, nonatomic) IBOutlet UITextField *pSalud2TF;
@property (weak, nonatomic) IBOutlet UITextField *ciclosTF;
@property (weak, nonatomic) IBOutlet UITextField *fcsTF;
@property (weak, nonatomic) IBOutlet UITextField *tiemposAeronaveIniciaTF;
@property (weak, nonatomic) IBOutlet UITextField *tiemposAeronaveTerminaTF;
@property (weak, nonatomic) IBOutlet UITextField *tiemposAeronaveTotalTF;
@property (weak, nonatomic) IBOutlet UITextField *tiemposTripulacionIniciaTF;
@property (weak, nonatomic) IBOutlet UITextField *tiemposTripulacionTerminaTF;
@property (weak, nonatomic) IBOutlet UITextField *tiemposTripulacionTotalTF;
@property (weak, nonatomic) IBOutlet UITextField *cargaInternaTF;
@property (weak, nonatomic) IBOutlet UITextField *cargaExternaTF;
@property (weak, nonatomic) IBOutlet UITextField *cargaPaxTF;
@property (weak, nonatomic) IBOutlet UITextField *cargaHeridosTF;
@property (weak, nonatomic) IBOutlet UITextField *cargaMuertosTF;
@property (weak, nonatomic) IBOutlet UITextField *apuArranqueTF;
@property (weak, nonatomic) IBOutlet UITextField *apuHorasTF;
@property (weak, nonatomic) IBOutlet UITextField *apuTAireTF;
@property (weak, nonatomic) IBOutlet UITextField *apuTGenTF;




@end
