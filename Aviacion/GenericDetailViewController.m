//
//  GenericDetailViewController.m
//  Aviacion
//
//  Created by Andres Abril on 16/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "GenericDetailViewController.h"
#import "FileSaver.h"
@interface GenericDetailViewController (){
    FileSaver *file;
    NSArray *lista;
    NSArray *lista2;
    NSArray *lista3;
    NSArray *lista4;
    NSArray *lista5;
    NSArray *responsablesArray;
    NSMutableArray *cantidadesArray;
    
    UIPickerView *pickerMunicion;
    UIPickerView *pickerEstadosMunicion;
    UIPickerView *pickerPuntos;
    UIPickerView *pickerImpactos;
    UIPickerView *pickerCantidades;
    UIPickerView *pickerDerechaCentroIzquierda;
    UIPickerView *pickerNS;
    UIPickerView *pickerWE;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
}
@end
@implementation GenericDetailViewController
@synthesize itemSeleccionadoDic, itemSeleccionado, saveType, itemType;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"State of Dic: %@", itemType);
    file =[[FileSaver alloc]init];
    if ([itemType isEqualToString:@"Municion"]) {
        lista = [[file getDictionary:@"ListaMunicionesUsadas"] objectForKey:@"array"];
        lista2 = [[file getDictionary:@"ListaEstadosMuniciones"] objectForKey:@"array"];
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        lista = [[file getDictionary:@"ListaPuntosVuelos"] objectForKey:@"array"];
        lista4 = @[@"N",@"S"];
        lista5 = @[@"W",@"E"];
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        lista = [[file getDictionary:@"ListaMunicionesUsadas"] objectForKey:@"array"];
        lista2 = [[file getDictionary:@"ListaEstadosMuniciones"] objectForKey:@"array"];
    }
    lista3 = @[@"D",@"C",@"I"];
    cantidadesArray = [[NSMutableArray alloc]init];
    for (int i=0; i<101; i++) {
        [cantidadesArray addObject:[NSString stringWithFormat:@"%i",i]];
    }
    [self setAllPickers];
    [self setAllTextFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    if ([saveType isEqualToString:@"edit"]) {
        self.title = [NSString stringWithFormat:@"Editando %@ No. %@", itemType,itemSeleccionado];
    }
    else if([saveType isEqualToString:@"new"]){
        self.title = [NSString stringWithFormat:@"Nuevo item para %@",itemType];
    }
    [self fillDispatcherWithType];
    
}
-(void)saveDispatcherWithType{
    if ([itemType isEqualToString:@"Tripulacion"]) {
        [self setTripulacionForSave];
    }
    else if ([itemType isEqualToString:@"Municion"]) {
        [self setMunicionForSave];
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        [self setPuntosForSave];
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        [self setImpactosForSave];
    }
}
-(void)fillDispatcherWithType{
    if ([itemType isEqualToString:@"Tripulacion"]) {
        [self fillTripulacion];
    }
    else if ([itemType isEqualToString:@"Municion"]) {
        [self fillMunicion];
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        [self fillPuntos];
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        [self fillImpactos];
    }
}
-(void)fillTripulacion{
    NSLog(@"Filling tripulacion %@", itemSeleccionadoDic);
    _nombreTF.text = [itemSeleccionadoDic objectForKey:@"NombrePersona"];
    _nombreTF.tag = [[itemSeleccionadoDic objectForKey:@"IdPersona"] doubleValue];
    _gradoTF.text = [itemSeleccionadoDic objectForKey:@"Grado"];
    _codigoMilitarTF.text = [itemSeleccionadoDic objectForKey:@"CodigoMilitar"];
    _c1TF.text = [itemSeleccionadoDic objectForKey:@"Cargo"];
    _c1TF.tag = [[itemSeleccionadoDic objectForKey:@"IdCargo"] doubleValue];
    _tt1TF.text = [itemSeleccionadoDic objectForKey:@"ttIFR"];
    _s1TF.text = [itemSeleccionadoDic objectForKey:@"sIFR"];
    
    _c2TF.text = [itemSeleccionadoDic objectForKey:@"Cargo"];
    _c2TF.tag = [[itemSeleccionadoDic objectForKey:@"IdCargo"] doubleValue];
    _tt2TF.text = [itemSeleccionadoDic objectForKey:@"ttDia"];
    _s2TF.text = [itemSeleccionadoDic objectForKey:@"sDia"];
    
    _c3TF.text = [itemSeleccionadoDic objectForKey:@"Cargo"];
    _c3TF.tag = [[itemSeleccionadoDic objectForKey:@"IdCargo"] doubleValue];
    _tt3TF.text = [itemSeleccionadoDic objectForKey:@"ttNoche"];
    _s3TF.text = [itemSeleccionadoDic objectForKey:@"sNoche"];
    
    _c4TF.text = [itemSeleccionadoDic objectForKey:@"Cargo"];
    _c4TF.tag = [[itemSeleccionadoDic objectForKey:@"IdCargo"] doubleValue];
    _tt4TF.text = [itemSeleccionadoDic objectForKey:@"ttLVN"];
    _s4TF.text = [itemSeleccionadoDic objectForKey:@"sLVN"];
    
//    if([[itemSeleccionadoDic objectForKey:@"IFR"] isEqualToString:@"1"]){
//        [_IFRSwitch setOn: YES];
//    }
//    if([[itemSeleccionadoDic objectForKey:@"Noche"] isEqualToString:@"1"]){
//        [_nocheSwitch setOn:YES];
//    }
//    if([[itemSeleccionadoDic objectForKey:@"Dia"] isEqualToString:@"1"]){
//        [_diaSwitch setOn:YES];
//    }
//    if([[itemSeleccionadoDic objectForKey:@"LVN"] isEqualToString:@"1"]){
//        [_LVNSwitch setOn:YES];
//    }
}
-(void)setTripulacionForSave{
    //[itemSeleccionadoDic setObject:itemSeleccionado forKey:@"numero"];
    [itemSeleccionadoDic setObject:_nombreTF.text forKey:@"NombrePersona"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_nombreTF.tag] forKey:@"IdPersona"];
    [itemSeleccionadoDic setObject:_gradoTF.text forKey:@"Grado"];
    [itemSeleccionadoDic setObject:_codigoMilitarTF.text forKey:@"CodigoMilitar"];
    [itemSeleccionadoDic setObject:_c1TF.text forKey:@"Cargo"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_c1TF.tag] forKey:@"IdCargo"];
    [itemSeleccionadoDic setObject:_tt1TF.text forKey:@"ttIFR"];
    [itemSeleccionadoDic setObject:_s1TF.text forKey:@"sIFR"];
    
    [itemSeleccionadoDic setObject:_c2TF.text forKey:@"Cargo"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_c2TF.tag] forKey:@"IdCargo"];
    [itemSeleccionadoDic setObject:_tt2TF.text forKey:@"ttDia"];
    [itemSeleccionadoDic setObject:_s2TF.text forKey:@"sDia"];
    
    [itemSeleccionadoDic setObject:_c3TF.text forKey:@"Cargo"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_c3TF.tag] forKey:@"IdCargo"];
    [itemSeleccionadoDic setObject:_tt3TF.text forKey:@"ttNoche"];
    [itemSeleccionadoDic setObject:_s3TF.text forKey:@"sNoche"];
    
    [itemSeleccionadoDic setObject:_c4TF.text forKey:@"Cargo"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_c4TF.tag] forKey:@"IdCargo"];
    [itemSeleccionadoDic setObject:_tt4TF.text forKey:@"ttLVN"];
    [itemSeleccionadoDic setObject:_s4TF.text forKey:@"sLVN"];
    
//    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%i", _IFRSwitch.isOn ? 1:0] forKey:@"IFR"];
//    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%i", _nocheSwitch.isOn ? 1:0] forKey:@"Noche"];
//    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%i", _diaSwitch.isOn ? 1:0] forKey:@"Dia"];
//    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%i", _LVNSwitch.isOn ? 1:0] forKey:@"LVN"];
}
-(void)fillMunicion{
    NSLog(@"Filling munición %@", itemSeleccionadoDic);
    _municionTipoTF.text = [itemSeleccionadoDic objectForKey:@"municionTipo"];
    _municionTipoTF.tag = [[itemSeleccionadoDic objectForKey:@"IdMunicionTipo"] doubleValue];
    _municionCargadaTF.text = [itemSeleccionadoDic objectForKey:@"municionCargada"];
    _municionDisparadaTF.text = [itemSeleccionadoDic objectForKey:@"municionDisparada"];
    _municionEstadoTF.text = [itemSeleccionadoDic objectForKey:@"municionEstado"];
    _municionEstadoTF.tag = [[itemSeleccionadoDic objectForKey:@"IdMunicionEstado"] doubleValue];
}
-(void)setMunicionForSave{
    [itemSeleccionadoDic setObject:_municionTipoTF.text forKey:@"municionTipo"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_municionTipoTF.tag] forKey:@"IdMunicionTipo"];
    [itemSeleccionadoDic setObject:_municionCargadaTF.text forKey:@"municionCargada"];
    [itemSeleccionadoDic setObject:_municionDisparadaTF.text forKey:@"municionDisparada"];
    [itemSeleccionadoDic setObject:_municionEstadoTF.text forKey:@"municionEstado"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_municionEstadoTF.tag] forKey:@"IdMunicionEstado"];
}
-(void)fillPuntos{
    NSLog(@"Filling puntos %@", itemSeleccionadoDic);
    _numeroTF.text = [itemSeleccionadoDic objectForKey:@"numero"];
    _tipoDePuntoTF.text = [itemSeleccionadoDic objectForKey:@"tipoDePunto"];
    _descripcionTF.text = [itemSeleccionadoDic objectForKey:@"descripcion"];
    _latTF.text = [itemSeleccionadoDic objectForKey:@"lat"];
    _grLatTF.text = [itemSeleccionadoDic objectForKey:@"grLat"];
    _minLatTF.text = [itemSeleccionadoDic objectForKey:@"minLat"];
    _segLatTF.text = [itemSeleccionadoDic objectForKey:@"segLat"];
    _lonTF.text = [itemSeleccionadoDic objectForKey:@"lon"];
    _grLonTF.text = [itemSeleccionadoDic objectForKey:@"grLon"];
    _minLonTF.text = [itemSeleccionadoDic objectForKey:@"minLon"];
    _segLonTF.text = [itemSeleccionadoDic objectForKey:@"segLon"];
    _puntoTF.text = [itemSeleccionadoDic objectForKey:@"punto"];
}
-(void)setPuntosForSave{
    //[itemSeleccionadoDic setObject:itemSeleccionado forKey:@"numero"];
    [itemSeleccionadoDic setObject:_numeroTF.text forKey:@"numero"];
    [itemSeleccionadoDic setObject:_tipoDePuntoTF.text forKey:@"tipoDePunto"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_tipoDePuntoTF.tag] forKey:@"IdTipoDePunto"];
    [itemSeleccionadoDic setObject:_descripcionTF.text forKey:@"descripcion"];
    [itemSeleccionadoDic setObject:_latTF.text forKey:@"lat"];
    [itemSeleccionadoDic setObject:_grLatTF.text forKey:@"grLat"];
    [itemSeleccionadoDic setObject:_minLatTF.text forKey:@"minLat"];
    [itemSeleccionadoDic setObject:_segLatTF.text forKey:@"segLat"];
    [itemSeleccionadoDic setObject:_lonTF.text forKey:@"lon"];
    [itemSeleccionadoDic setObject:_grLonTF.text forKey:@"grLon"];
    [itemSeleccionadoDic setObject:_minLonTF.text forKey:@"minLon"];
    [itemSeleccionadoDic setObject:_segLonTF.text forKey:@"segLon"];
    [itemSeleccionadoDic setObject:_puntoTF.text forKey:@"punto"];
}
-(void)fillImpactos{
    NSLog(@"Filling impactos %@", itemSeleccionadoDic);
    _impactosTipoTF.text = [itemSeleccionadoDic objectForKey:@"impactosTipo"];
    _impactosTipoTF.tag = [[itemSeleccionadoDic objectForKey:@"IdImpactosTipo"] doubleValue];
    _impactosCargadaTF.text = [itemSeleccionadoDic objectForKey:@"impactosCargada"];
    _impactosDisparadaTF.text = [itemSeleccionadoDic objectForKey:@"impactosDisparada"];
    _impactosEstadoTF.text = [itemSeleccionadoDic objectForKey:@"impactosEstado"];
    _impactosEstadoTF.tag = [[itemSeleccionadoDic objectForKey:@"IdImpactosEstado"] doubleValue];
}
-(void)setImpactosForSave{
    [itemSeleccionadoDic setObject:_impactosTipoTF.text forKey:@"impactosTipo"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_impactosTipoTF.tag] forKey:@"IdImpactosTipo"];
    [itemSeleccionadoDic setObject:_impactosCargadaTF.text forKey:@"impactosCargada"];
    [itemSeleccionadoDic setObject:_impactosDisparadaTF.text forKey:@"impactosDisparada"];
    [itemSeleccionadoDic setObject:_impactosEstadoTF.text forKey:@"impactosEstado"];
    [itemSeleccionadoDic setObject:[NSString stringWithFormat:@"%ld",(long)_impactosEstadoTF.tag] forKey:@"IdImpactosEstado"];
}
- (IBAction)save:(id)sender {
    [self saveDispatcherWithType];
    if ([saveType isEqualToString:@"edit"]) {
        [self.delegate overwrite:itemSeleccionadoDic atIndex:[itemSeleccionado intValue]];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"Editing from genericdetailvc");
    }
    else if ([saveType isEqualToString:@"new"]) {
        [self.delegate saveNew:itemSeleccionadoDic];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"Saving from genericdetailvc");
    }
}

#pragma mark - Picker delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    //Lista 1;
    if (pickerView.tag == 1) {
        return lista.count;
    }
    //lista 2;
    else if (pickerView.tag == 2) {
        return lista2.count;
    }
    //listaCantidad;
    else if (pickerView.tag == 3) {
        return cantidadesArray.count;
    }
    //listaCantidad;
    else if (pickerView.tag == 4) {
        return lista3.count;
    }
    //listaCantidad;
    else if (pickerView.tag == 5) {
        return lista4.count;
    }
    //listaCantidad;
    else if (pickerView.tag == 6) {
        return lista5.count;
    }
    return 0;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //Lusta 1;
    if (pickerView.tag == 1) {
        NSString *text = @"";
        if ([itemType isEqualToString:@"Municion"]) {
            text = [lista[row] objectForKey:@"Armamento"];
        }
        else if ([itemType isEqualToString:@"Puntos"]) {
            text = [lista[row] objectForKey:@"Descripcion"];
        }
        else if ([itemType isEqualToString:@"Impactos"]) {
            text = [lista[row] objectForKey:@"Armamento"];
        }
        return text;
    }
    //Lista 2
    else if (pickerView.tag == 2) {
        NSString *text = @"";
        if ([itemType isEqualToString:@"Municion"]) {
            text = [lista2[row] objectForKey:@"Descripcion"];
        }
        else if ([itemType isEqualToString:@"Impactos"]) {
            text = [lista2[row] objectForKey:@"Descripcion"];
        }
        return text;
    }
    //listaCantidades;
    else if (pickerView.tag == 3) {
        return cantidadesArray[row];
    }
    //Lista 3;
    else if (pickerView.tag == 4) {
        return lista3[row];
    }
    
    //Lista 4;
    else if (pickerView.tag == 5) {
        return lista4[row];
    }
    
    //Lista 5;
    else if (pickerView.tag == 6) {
        return lista5[row];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView.tag == 1) {
        NSString *text = @"";
        double tag = 0;
        if ([itemType isEqualToString:@"Municion"]) {
            text = [lista[row] objectForKey:@"Armamento"];
            tag = [[lista[row] objectForKey:@"ValorFlexibleId"] doubleValue];
        }
        else if ([itemType isEqualToString:@"Puntos"]) {
            text = [lista[row] objectForKey:@"Descripcion"];
            tag = [[lista[row] objectForKey:@"ValoresFlexiblesId"] doubleValue];
        }
        else if ([itemType isEqualToString:@"Impactos"]) {
            text = [lista[row] objectForKey:@"Armamento"];
            tag = [[lista[row] objectForKey:@"ValorFlexibleId"] doubleValue];
        }
        currentTextField.text = text;
        currentTextField.tag = tag;
    }
    else if (pickerView.tag == 2) {
        NSString *text = @"";
        double tag = 0;
        if ([itemType isEqualToString:@"Municion"]) {
            text = [lista2[row] objectForKey:@"Descripcion"];
            tag = [[lista2[row] objectForKey:@"ValorFlexibleId"] doubleValue];
        }
        else if ([itemType isEqualToString:@"Impactos"]) {
            text = [lista2[row] objectForKey:@"Descripcion"];
            tag = [[lista2[row] objectForKey:@"ValorFlexibleId"] doubleValue];
        }
        currentTextField.text = text;
        currentTextField.tag = tag;
    }
    else if (pickerView.tag == 3) {
        currentTextField.text = cantidadesArray[row];
    }
    
    else if (pickerView.tag == 4) {
        currentTextField.text = lista3[row];
    }
    
    else if (pickerView.tag == 5) {
        currentTextField.text = lista4[row];
    }
    
    else if (pickerView.tag == 6) {
        currentTextField.text = lista5[row];
    }
    return;
}
#pragma mark - set texfields
-(void)setAllTextFields{
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(self.view.frame.size.width-320,0,320,44)];
    [toolBar setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStylePlain target:self action:@selector(dismissInputView)];
    UIBarButtonItem *spacerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *spacerButton2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolBar.items = @[spacerButton,spacerButton2,barButtonDone];
    
    if ([itemType isEqualToString:@"Municion"]) {
        [self initPickerInput:pickerMunicion onTF:self.municionTipoTF withToolBar:toolBar];
        [self initPickerInput:pickerEstadosMunicion onTF:self.municionEstadoTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.municionCargadaTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.municionDisparadaTF withToolBar:toolBar];
    }
    else if ([itemType isEqualToString:@"Tripulacion"]) {
        //[self initPickerInput:pickerCantidades onTF:self.tt1TF withToolBar:toolBar];
        //[self initPickerInput:pickerCantidades onTF:self.s1TF withToolBar:toolBar];
        [self initPickerInput:pickerDerechaCentroIzquierda onTF:self.s1TF withToolBar:toolBar];
        [self initPickerInput:pickerDerechaCentroIzquierda onTF:self.s2TF withToolBar:toolBar];
        [self initPickerInput:pickerDerechaCentroIzquierda onTF:self.s3TF withToolBar:toolBar];
        [self initPickerInput:pickerDerechaCentroIzquierda onTF:self.s4TF withToolBar:toolBar];
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        [self initPickerInput:pickerPuntos onTF:self.tipoDePuntoTF withToolBar:toolBar];
        
        [self initPickerInput:pickerCantidades onTF:self.numeroTF withToolBar:toolBar];
        [self initPickerInput:pickerNS onTF:self.latTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.grLatTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.minLatTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.segLatTF withToolBar:toolBar];
        [self initPickerInput:pickerWE onTF:self.lonTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.grLonTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.minLonTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.segLonTF withToolBar:toolBar];
//        [self initPickerInput:pickerCantidades onTF:self.puntoTF withToolBar:toolBar];
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        [self initPickerInput:pickerMunicion onTF:self.impactosTipoTF withToolBar:toolBar];
        [self initPickerInput:pickerEstadosMunicion onTF:self.impactosEstadoTF withToolBar:toolBar];
        [self initPickerInput:pickerCantidades onTF:self.impactosCargadaTF withToolBar:toolBar];
        [self initPickerInput:pickerCantidades onTF:self.impactosDisparadaTF withToolBar:toolBar];
    }
}
-(void)initPickerInput:(UIPickerView*)picker onTF:(UITextField*)textField withToolBar:(UIToolbar*)toolBar{
    textField.inputView = picker;
    textField.inputAccessoryView = toolBar;
}
#pragma mark - dismiss input view
-(void)dismissInputView{
    [currentTextField becomeFirstResponder];
    [currentTextField resignFirstResponder];
}
#pragma mark - set pickers
-(void)setAllPickers{
    pickerMunicion = [self createPickerWithTag:1];
    pickerEstadosMunicion = [self createPickerWithTag:2];
    
    pickerImpactos = [self createPickerWithTag:1];
    
    pickerPuntos = [self createPickerWithTag:1];
    
    pickerCantidades = [self createPickerWithTag:3];
    
    pickerDerechaCentroIzquierda = [self createPickerWithTag:4];
    
    pickerNS = [self createPickerWithTag:5];
    
    pickerWE = [self createPickerWithTag:6];
}
-(UIPickerView*)createPickerWithTag:(double)tag{
    UIPickerView *picker=[[UIPickerView alloc]init];
    picker.dataSource=self;
    picker.delegate=self;
    picker.showsSelectionIndicator = YES;
    picker.tag=tag;
    return picker;
}
#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    currentTextField = textField;
    currentPicker = (UIPickerView*)currentTextField.inputView;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *expression;
    if(textField.tag == 0){
        NSLog(@"Tag 0 %ld", textField.tag);
        expression = @"^[0-9]*((\\.|,)[0-9]{0,2})?$";
    }
    else if(textField.tag == 1){
        NSLog(@"Tag 1 %ld", textField.tag);
        expression = @"^[0-9 ]*$";
    }
    
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:newString options:0 range:NSMakeRange(0, [newString length])];
    return numberOfMatches != 0;
}

- (IBAction)switchChanged:(UISwitch *)sender {
    if(sender.isOn){
        if(sender.tag == 101){
            [self.diaSwitch setOn:NO];
            [self.LVNSwitch setOn:NO];
        }
        else if(sender.tag == 102){
            [self.nocheSwitch setOn:NO];
            [self.LVNSwitch setOn:NO];
        }
        else if(sender.tag == 103){
            [self.nocheSwitch setOn:NO];
            [self.diaSwitch setOn:NO];
        }
    }
}



@end
