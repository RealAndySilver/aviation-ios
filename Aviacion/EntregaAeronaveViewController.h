//
//  EvaluacionAeronaveViewController.h
//  Aviacion
//
//  Created by Andres Abril on 15/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetalleEntregaAeronaveViewController.h"
#import "EntregaAeronaveCell.h"
#import "FileSaver.h"
@interface EntregaAeronaveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *aeronaveTV;
@property (weak, nonatomic) IBOutlet UITableView *armamentoTV;
@property (weak, nonatomic) IBOutlet UITableView *alseTV;

@property (weak, nonatomic) IBOutlet UITextField *lugarTF;
@property (weak, nonatomic) IBOutlet UITextField *actaTF;
@property (weak, nonatomic) IBOutlet UITextField *regFolioTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaTF;
@property (weak, nonatomic) IBOutlet UITextField *matriculaTF;
@property (weak, nonatomic) IBOutlet UITextField *pilotoSaliente;
@property (weak, nonatomic) IBOutlet UITextField *pilotoEntrante;
@property (weak, nonatomic) IBOutlet UITextField *jefeSaliente;
@property (weak, nonatomic) IBOutlet UITextField *jefeEntrante;
@property (weak, nonatomic) IBOutlet UITextView *observacionesTextView;
@property (weak, nonatomic) IBOutlet UIButton *enviarBtn;

@end
