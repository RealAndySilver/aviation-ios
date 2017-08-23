//
//  RegistroDeVueloViewController.m
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "RegistroDeVueloViewController.h"
#import "FileSaver.h"
#import "PiernasListTableViewController.h"

@interface RegistroDeVueloViewController (){
    FileSaver *file;
    MBProgressHUD *hud;
    NSMutableDictionary *registroDictionary;
    NSString *numeroRegistro;
    //Pickers
    UIPickerView *pickerCompania;
    ServerCommunicator *server;
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
    UIDatePicker *datePicker;
    NSArray *organizacionesArray;
}

@end

@implementation RegistroDeVueloViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Registro De Vuelo";
    server = [[ServerCommunicator alloc]init];
    server.delegate = self;
    
    numeroRegistro = @"10";
    [self setAllPickers];
    [self setAllTextFields];
    //[self setPersistance];
    [self fillAllInfo];
    [self initializeArrays];
    
   
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    self.jsonFinalTV.text = @"";
}
- (void)viewWillDisappear:(BOOL)animated{
    file = [[FileSaver alloc]init];
    [file setDictionary:[self getHeaderDictionary] withKey:@"CabeceraRegistro"];
    NSLog(@"Cabecera %@",[self getHeaderDictionary]);
}
-(NSString*)createJsonWithHeader:(NSDictionary*)header andRegistro:(NSDictionary*)registro{
    NSDictionary *registroDic = @{@"Cabecera":header,@"Registro":registro};
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:registroDic
                                                       options:0 //NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
-(NSDictionary*)getHeaderDictionary{
    NSDictionary *tempDic = @{@"Fecha":self.fechaTF.text,
                              @"NoOrden":self.noOrdenTF.text,
                              @"IdOrden":[NSString stringWithFormat:@"%ld", (long)self.noOrdenTF.tag],
                              @"UnidadHoras":self.unidadAsumeHorasTF.text,
                              @"IdUnidadHoras":[NSString stringWithFormat:@"%ld", (long)self.unidadAsumeHorasTF.tag],
                              @"TipoAeronave":self.modeloTF.text,
                              @"IdAeronave":[NSString stringWithFormat:@"%ld", (long)self.modeloTF.tag],
                              @"Matricula":self.matriculaTF.text,
                              @"IdUnidadAviacion":[NSString stringWithFormat:@"%ld", (long)self.unidadAviacionTF.tag],
                              @"SiglaUnidadAviacion":self.unidadAviacionTF.text,
                              @"SiglaOrganizacion":self.companiaVueloTF.text,
                              @"IdOrganizacion":[NSString stringWithFormat:@"%ld", (long)self.companiaVueloTF.tag],
                              @"Observacion":self.observacionTF.text,
                              @"IdOperacion":[NSString stringWithFormat:@"%@", self.ordenDic[@"IdOperacion"]]};
    return tempDic;
}
-(NSDictionary*)getRegistroDictionary{
    file = [[FileSaver alloc]init];
    NSString *nameForFile = [NSString stringWithFormat:@"Piernas%@", [self.ordenDic objectForKey:@"NroOrden"]];
    NSDictionary *tempDic = [file getDictionary:nameForFile];
    return tempDic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - set pickers & textfields
- (void)setAllPickers{
    
    datePicker = [[UIDatePicker alloc]init];
    datePicker.tag = 5001;
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(displayDate:) forControlEvents:UIControlEventValueChanged];
    
    pickerCompania=[[UIPickerView alloc]init];
    pickerCompania.dataSource=self;
    pickerCompania.delegate=self;
    pickerCompania.showsSelectionIndicator = YES;
    pickerCompania.tag=9000;
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"piernas"]) {
        PiernasListTableViewController *plVC =  [segue destinationViewController];
        plVC.ordenDic = self.ordenDic;
        plVC.numeroRegistro = numeroRegistro;
        plVC.requerimientoDic = self.requerimientoDic;
    }
    
}
- (void)initializeArrays{
    file = [[FileSaver alloc]init];
    //NSLog(@"Organizaciones %@",[file getDictionary:@"ListaOrganizaciones"]);
    organizacionesArray = [[file getDictionary:@"ListaOrganizaciones"] objectForKey:@"array"];
    //Orden alfabético
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"Sigla" ascending: YES];
    organizacionesArray = [organizacionesArray sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
}

-(void)setPersistance{
    file = [[FileSaver alloc]init];
    [file setDictionary:@{@"id":numeroRegistro} withKey:@"RegistroActual"];
    
    registroDictionary = (NSMutableDictionary*)[file getDictionary:@"RegistroDeVuelo"];
    
    if (![registroDictionary objectForKey:@"Piernas"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Piernas"];
    }
    if (![registroDictionary objectForKey:@"Tripulacion"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Tripulacion"];
    }
    if (![registroDictionary objectForKey:@"Municion"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Municion"];
    }
    if (![registroDictionary objectForKey:@"Servicios"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Servicios"];
    }
    if (![registroDictionary objectForKey:@"Puntos"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Puntos"];
    }
    if (![registroDictionary objectForKey:@"Impactos"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Impactos"];
    }
}

-(void)fillAllInfo{
    file = [[FileSaver alloc]init];
    NSDictionary *tempDic = [file getDictionary:@"CabeceraRegistro"];
    //Fecha
    self.fechaTF.text = [tempDic objectForKey:@"Fecha"];
    
    //No Orden
    self.noOrdenTF.text = [self.ordenDic objectForKey:@"NroOrden"];
    self.noOrdenTF.tag = [[self.ordenDic objectForKey:@"IdOrden"] doubleValue];
    
    //Unidad Asume
    self.unidadAsumeHorasTF.text = [self.ordenDic objectForKey:@"UnidadHoras"];
    self.unidadAsumeHorasTF.tag = [[self.ordenDic objectForKey:@"IdUnidadHoras"] doubleValue];
    
    //Modelo
    self.modeloTF.text = [self.ordenDic objectForKey:@"TipoAeronave"];
    self.modeloTF.tag = [[self.ordenDic objectForKey:@"IdAeronave"] doubleValue];
    
    //Matrícula
    self.matriculaTF.text = [self.ordenDic objectForKey:@"Matricula"];
    self.matriculaTF.tag = [[self.ordenDic objectForKey:@"Matricula"] doubleValue];
    
    //Unidad Aviación
    self.unidadAviacionTF.text = [self.ordenDic objectForKey:@"SiglaUnidadAviacion"];
    self.unidadAviacionTF.tag = [[self.ordenDic objectForKey:@"IdUnidadAviacion"] doubleValue];
    
    //Unidad Aviación
    self.companiaVueloTF.text = [tempDic objectForKey:@"SiglaOrganizacion"];
    self.companiaVueloTF.tag = [[tempDic objectForKey:@"IdOrganizacion"] doubleValue];
    
    //Observaciones
    self.observacionTF.text = [tempDic objectForKey:@"Observacion"];
}
#pragma mark - set textfields
- (void)setAllTextFields{
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(self.view.frame.size.width-320,0,320,44)];
    [toolBar setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStylePlain target:self action:@selector(dismissInputView)];
    UIBarButtonItem *spacerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *spacerButton2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolBar.items = @[spacerButton,spacerButton2,barButtonDone];
    
    self.companiaVueloTF.inputView = pickerCompania;
    self.companiaVueloTF.inputAccessoryView = toolBar;
    self.fechaTF.inputView = datePicker;
    self.fechaTF.inputAccessoryView = toolBar;

}
#pragma mark - dismiss input view
-(void)dismissInputView{
    [currentTextField becomeFirstResponder];
    [currentTextField resignFirstResponder];
}
#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    currentTextField = textField;
    currentPicker = (UIPickerView*)currentTextField.inputView;
    if([currentTextField.inputView isKindOfClass:[UIDatePicker class]]){
        if(currentTextField.text.length>0){
            [(UIDatePicker *)currentPicker setDate:[self returnDateWithStringDate:currentTextField.text
                                                                  andStringFormat:[self getStringFormatFromDatePicker:(UIDatePicker *)currentPicker]] animated:YES];
        }
        return;
    }
    else{
        NSInteger index = 0;
        NSArray *array;
        
        if (currentPicker.tag == 9000) {
            array = [organizacionesArray valueForKey:@"Sigla"];
            assert(organizacionesArray.count == array.count);
        }
        
        index=[array indexOfObject:currentTextField.text];
        
        if(index != NSNotFound ){
            [currentPicker selectRow:index inComponent:0 animated:YES];
        }
        else{
            [currentPicker selectRow:0 inComponent:0 animated:YES];
        }
    }
}

#pragma mark - Picker delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    //listaAmenaza;
    if (pickerView.tag == 9000) {
        return organizacionesArray.count;
    }
    
    return 0;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //    Organización;
    if (pickerView.tag == 9000) {
        return [organizacionesArray[row] objectForKey:@"Sigla"];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //    Organización;
    if (pickerView.tag == 9000) {
        currentTextField.text = [organizacionesArray[row] objectForKey:@"Sigla"];
        currentTextField.tag = [[organizacionesArray[row] objectForKey:@"Organizacion"] doubleValue];
    }
    //overlayLabel.text = currentTextField.text;
    return;
}

-(void)displayDate:(id)sender {
    NSDate * selected = [datePicker date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[self getStringFormatFromDatePicker:datePicker]];
    
    NSString *strDate = [formatter stringFromDate:selected];
    currentTextField.text = strDate;
}
- (NSDate*)returnDateWithStringDate:(NSString*)date andStringFormat:(NSString*)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:format];
    NSDate *finalDate = [dateFormatter dateFromString:date];
    return finalDate;
}
- (NSString*)getStringFormatFromDatePicker:(UIDatePicker*)picker{
    NSString *format = @"";
    if (picker.tag == 5000) {
        format = @"dd-MM-yyyy HH:mm";
    }
    else if (picker.tag == 5001){
        format = @"dd-MM-yyyy";
    }
    else if (picker.tag == 5002){
        format = @"HH:mm";
    }
    return format;
}

-(IBAction)enviarRegistro:(id)sender{
    if([self getRegistroDictionary]){
        hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.labelText = @"Enviando Registro De Vuelo";
        
        NSString *json = [self createJsonWithHeader:[self getHeaderDictionary] andRegistro:[self getRegistroDictionary]];
        self.jsonFinalTV.text = json;
        NSLog(@"Registro %@", json);
        [server callRESTServerWithPOSTMethod:@"registroVuelo/ios"
                                andParameter:[NSString stringWithFormat:@"json=%@", json]
                                    endpoint:@"WS_SICCA2/webresources"];
    }
    else{
        self.jsonFinalTV.text = @"No se ha generado información para el registro de vuelo. Por favor ingrese a Vuelos y guarde el registro.";
    }
}

#pragma mark - server delegate
-(void)receivedDataFromServer:(NSDictionary *)dictionary withMethodName:(NSString *)methodName{
    if ([methodName isEqualToString:@"registroVuelo/ios"]) {
        
        if([dictionary[@"codigoError"] isEqualToString:@"0"]){
            NSLog(@"sin error %@", dictionary);
            [self changeHUDTextAndHideWithDelay:@"Registro de vuelo enviado con éxito"];
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Registro de vuelo enviado con éxito"
                                         message:[NSString stringWithFormat:@"Número de Registro: %@", dictionary[@"numeroRegistroVuelo"]]
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction* yesButton = [UIAlertAction
                                        actionWithTitle:@"Ok"
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action) {
                                            [self.navigationController popViewControllerAnimated:YES];
                                        }];
            
            [alert addAction:yesButton];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
        else if([dictionary[@"codigoError"] isEqualToString:@"1"]){
            NSLog(@"sin error %@", dictionary);
            [self changeHUDTextAndHideWithDelay:@"Registro de vuelo enviado con advertencias."];
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Registro de vuelo enviado con advertencias"
                                         message:[NSString stringWithFormat:@"Número de Registro: %@, %@", dictionary[@"numeroRegistroVuelo"],dictionary[@"mensajeError"]]
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction* yesButton = [UIAlertAction
                                        actionWithTitle:@"Ok"
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action) {
                                            [self.navigationController popViewControllerAnimated:YES];
                                        }];
            
            [alert addAction:yesButton];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
        else if([dictionary[@"codigoError"] isEqualToString:@"2"]){
            [self changeHUDTextAndHideWithDelay:@"Error al enviar el registro de vuelo."];
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Error al enviar el registro de vuelo"
                                         message:[NSString stringWithFormat:@"Error: %@",dictionary[@"mensajeError"]]
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction* yesButton = [UIAlertAction
                                        actionWithTitle:@"Cancelar"
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action) {
                                        }];
            
            [alert addAction:yesButton];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            [self changeHUDTextAndHideWithDelay:@"Error"];
        }
    }
    else{
        [self changeHUDTextAndHideWithDelay:@"Finalizado"];
    }
    //[self checkSavedOrder];
}
-(void)serverError:(NSError *)error withMethodName:(NSString *)method{
    NSLog(@"Error: %@",error);
    [self changeHUDTextAndHideWithDelay:@"Error al cargar información"];
}
#pragma mark delayed hud
-(void)changeHUDTextAndHideWithDelay:(NSString*)text{
    hud.labelText=text;
    [self performSelector:@selector(hideHud) withObject:nil afterDelay:2.0];
}
-(void)hideHud{
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
}

@end
