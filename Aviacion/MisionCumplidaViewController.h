//
//  MisionCumplidaViewController.h
//  Aviacion
//
//  Created by Andres Abril on 16/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileSaver.h"
@interface MisionCumplidaViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate, UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) NSDictionary *ordenDic;
@property (weak, nonatomic) NSDictionary *requerimientoDic;
@property (weak, nonatomic) NSDictionary *fragmentariaDic;
@property (weak, nonatomic) NSDictionary *registroDic;

@property (weak, nonatomic) IBOutlet UITextField *noMisionCumplidaTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaMisionTF;
@property (weak, nonatomic) IBOutlet UITextField *registroVueloTF;

@property (weak, nonatomic) IBOutlet UITextField *ordenvueloTF;
@property (weak, nonatomic) IBOutlet UITextField *siglaTF;

@property (weak, nonatomic) IBOutlet UITextField *quienTF;
@property (weak, nonatomic) IBOutlet UITextField *queTF;
@property (weak, nonatomic) IBOutlet UITextField *cuandoTF;
@property (weak, nonatomic) IBOutlet UITextField *dondeTF;
@property (weak, nonatomic) IBOutlet UITextField *paraQueTF;

@property (weak, nonatomic) IBOutlet UISwitch *ifrSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *nocheSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *diaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *lvnSwitch;


@property (weak, nonatomic) IBOutlet UITextField *aeronaveTF;
@property (weak, nonatomic) IBOutlet UITextField *matriculaTF;
@property (weak, nonatomic) IBOutlet UITextField *firmaTF;

@property (weak, nonatomic) IBOutlet UITableView *tripulacionMisionTV;
@property (weak, nonatomic) IBOutlet UITextView *flujoMisionTextView;
@property (weak, nonatomic) IBOutlet UITextView *maniobraTextView;

@property (weak, nonatomic) IBOutlet UITableView *resumenMisionCumplidaTV;
@property (weak, nonatomic) IBOutlet UITableView *detallePaxTV;
@property (weak, nonatomic) IBOutlet UITableView *recuperacionDePersonalTV;
@property (weak, nonatomic) IBOutlet UITableView *aeronaveEscoltaTV;


@property (weak, nonatomic) IBOutlet UITableView *poblacionCivilTV;
@property (weak, nonatomic) IBOutlet UITableView *resumenGastoMunicionTV;

@property (weak, nonatomic) IBOutlet UITextView *municion3hTextView;
@property (weak, nonatomic) IBOutlet UITextView *municion3iTextView;
@property (weak, nonatomic) IBOutlet UITextView *municion3jTextView;

@property (weak, nonatomic) IBOutlet UITextView *registoFotoTextView;
@property (weak, nonatomic) IBOutlet UITextView *filmacionesTextView;
@property (weak, nonatomic) IBOutlet UITextView *recomendacionesTextView;

@end
