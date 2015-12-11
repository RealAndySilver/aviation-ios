//
//  OrdenDeVueloViewController.h
//  Aviacion
//
//  Created by Andres Abril on 8/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripulacionOrdenCell.h"
@interface OrdenDeVueloViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *consecutivoTF;
@property (weak, nonatomic) IBOutlet UITextField *ordOpFragTF;
@property (weak, nonatomic) IBOutlet UITextField *misionTF;
@property (weak, nonatomic) IBOutlet UITextField *confMision;
@property (weak, nonatomic) IBOutlet UITextField *matriculaTF;
@property (weak, nonatomic) IBOutlet UITextField *tipoAeronaveTF;
@property (weak, nonatomic) IBOutlet UITextField *lugarSalidaTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaHoraSalidaTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadAviacionTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadApoyadaTF;
@property (weak, nonatomic) IBOutlet UITextField *operacionTF;
@property (weak, nonatomic) IBOutlet UITextField *rutaTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaTF;
@property (weak, nonatomic) IBOutlet UITextField *elaboroTF;
@property (weak, nonatomic) IBOutlet UITextView *observacionesTV;





@property (weak, nonatomic) NSDictionary *ordenDic;
@end
