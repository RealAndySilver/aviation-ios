//
//  RegistroDeVueloViewController.h
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistroDeVueloViewController : UIViewController <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) NSDictionary *requerimientoDic;
@property (weak, nonatomic) NSDictionary *ordenDic;


@property (weak, nonatomic) IBOutlet UITextField *consecutivoTF;
@property (weak, nonatomic) IBOutlet UITextField *fechaTF;
@property (weak, nonatomic) IBOutlet UITextField *noOrdenTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadAsumeHorasTF;
@property (weak, nonatomic) IBOutlet UITextField *serieAeronaveTF;
@property (weak, nonatomic) IBOutlet UITextField *modeloTF;
@property (weak, nonatomic) IBOutlet UITextField *matriculaTF;
@property (weak, nonatomic) IBOutlet UITextField *unidadAviacionTF;
@property (weak, nonatomic) IBOutlet UITextField *companiaVueloTF;
@property (weak, nonatomic) IBOutlet UITextView *observacionTF;




@end
