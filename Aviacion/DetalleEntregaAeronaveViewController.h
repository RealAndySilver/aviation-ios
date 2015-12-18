//
//  DetalleEntregaAeronaveViewController.h
//  Aviacion
//
//  Created by Andres Abril on 15/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileSaver.h"
@interface DetalleEntregaAeronaveViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) NSMutableArray *arrayForDetail;
@property (weak, nonatomic) NSString *type;

@property (weak, nonatomic) IBOutlet UITextField *materialTF;
@property (weak, nonatomic) IBOutlet UITextField *cantidadTF;
@property (weak, nonatomic) IBOutlet UITextField *serieTF;
@property (weak, nonatomic) IBOutlet UITextField *responsableTF;
@property (weak, nonatomic) IBOutlet UIButton *boton;
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *serieLabel;
@property (weak, nonatomic) IBOutlet UILabel *responsableLabel;
@end
