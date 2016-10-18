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
    NSMutableDictionary *registroDictionary;
    NSString *numeroRegistro;
    //Pickers
    UIPickerView *pickerCompania;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
    NSArray *organizacionesArray;
}

@end

@implementation RegistroDeVueloViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Registro De Vuelo";
    numeroRegistro = @"10";
    [self setAllPickers];
    [self setAllTextFields];
    //[self setPersistance];
    [self fillAllInfo];
    [self initializeArrays];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillDisappear:(BOOL)animated{
    file = [[FileSaver alloc]init];
    [file setDictionary:@{@"IdOrganizacion":[NSString stringWithFormat:@"%ld", (long)self.companiaVueloTF.tag],
                          @"Fecha":self.fechaTF.text,
                          @"IdAeronave":self.modeloTF.text,
                          @"NoOrden":self.noOrdenTF.text,
                          @"IdUnidadHoras":[NSString stringWithFormat:@"%ld", (long)self.unidadAsumeHorasTF.tag],
                          @"IdAeronave":[NSString stringWithFormat:@"%ld", (long)self.modeloTF.tag],
                          @"IdAeronave":[NSString stringWithFormat:@"%ld", (long)self.modeloTF.tag],
                          @"Matricula":[NSString stringWithFormat:@"%ld", (long)self.matriculaTF.tag],
                          @"SiglaUnidadAviacion":[NSString stringWithFormat:@"%ld", (long)self.unidadAviacionTF.tag],
                          @"SiglaOrganizacion":self.companiaVueloTF.text,
                          @"IdOrganizacion":[NSString stringWithFormat:@"%ld", (long)self.companiaVueloTF.tag],
                          @"Observacion":self.observacionTF.text} withKey:@"CabeceraRegistro"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - set pickers & textfields
- (void)setAllPickers{
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
        plVC.numeroRegistro = numeroRegistro;
        plVC.ordenDic = self.ordenDic;
        plVC.requerimientoDic = self.requerimientoDic;
    }
    
}
- (void)initializeArrays{
    file = [[FileSaver alloc]init];
    //NSLog(@"Organizaciones %@",[file getDictionary:@"ListaOrganizaciones"]);
    organizacionesArray = [[file getDictionary:@"ListaOrganizaciones"] objectForKey:@"array"];
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

@end
