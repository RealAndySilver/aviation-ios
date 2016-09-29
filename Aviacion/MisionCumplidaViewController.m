//
//  MisionCumplidaViewController.m
//  Aviacion
//
//  Created by Andres Abril on 16/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "MisionCumplidaViewController.h"

@interface MisionCumplidaViewController (){
    FileSaver *file;
    NSArray *siglasArray;
    NSArray *aeronavesArray;
    NSMutableArray *matriculasArray;
    NSMutableArray *firmasArray;
    
    UIPickerView *pickerSiglas;
    UIPickerView *pickerAeronaves;
    UIPickerView *pickerMatriculas;
    UIPickerView *pickerFirmas;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
}

@end

@implementation MisionCumplidaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    file = [[FileSaver alloc]init];
    siglasArray = [[file getDictionary:@"ListaUnidadesApoyadas"] objectForKey:@"array"];
    aeronavesArray = [[file getDictionary:@"ListaAeronaves"] objectForKey:@"array"];
    matriculasArray = [[file getDictionary:@"ListaMatriculasAeronaves"] objectForKey:@"array"];
    firmasArray = [[file getDictionary:@"ListaPersonas"] objectForKey:@"array"];
    
    self.mainScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mainScrollView.contentSize=CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height*3.7);
    [self.mainScrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:self.mainScrollView];
    [self setAllPickers];
    [self setAllTextFields];
    [self fillTextFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    //listaMaterialesAeronave;
    if (pickerView.tag == 1) {
        return siglasArray.count;
    }
    //listaCantidad;
    else if (pickerView.tag == 2) {
        return aeronavesArray.count;
    }
    //listaResponsables;
    else if (pickerView.tag == 3) {
        return matriculasArray.count;
    }
    else if (pickerView.tag == 4) {
        return firmasArray.count;
    }
    return 0;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //listaMaterialesAeronave;
    if (pickerView.tag == 1) {
        return [siglasArray[row] objectForKey:@"Nombre"];
    }
    //listaCantidades;
    else if (pickerView.tag == 2) {
        return [aeronavesArray[row] objectForKey:@"Nombre"];
    }
    //listaResponsables;
    else if (pickerView.tag == 3) {
        return [matriculasArray[row] objectForKey:@"Matricula"];
    }
    else if (pickerView.tag == 4) {
        return [firmasArray[row] objectForKey:@"NombreCompleto"];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView.tag == 1) {
        currentTextField.text = [siglasArray[row] objectForKey:@"Nombre"];
        currentTextField.tag = [[siglasArray[row] objectForKey:@"Id"] doubleValue];
    }
    else if (pickerView.tag == 2) {
        currentTextField.text = [aeronavesArray[row] objectForKey:@"Nombre"];
        currentTextField.tag = [[aeronavesArray[row] objectForKey:@"IdAeronave"] doubleValue];
    }
    else if (pickerView.tag == 3) {
        currentTextField.text = [matriculasArray[row] objectForKey:@"Matricula"];
        currentTextField.tag = [[matriculasArray[row] objectForKey:@"IdAeronave"] doubleValue];
    }
    else if (pickerView.tag == 4) {
        currentTextField.text = [firmasArray[row] objectForKey:@"NombreCompleto"];
        currentTextField.tag = [[firmasArray[row] objectForKey:@"PersonaId"] doubleValue];
    }
    return;
}
#pragma mark - set texfields
-(void)fillTextFields{
    self.fechaMisionTF.text = [self.ordenDic objectForKey:@"FechaSalida"];
    self.ordenvueloTF.text = [self.ordenDic objectForKey:@"NroOrden"];
    
    self.quienTF.text = [self.fragmentariaDic objectForKey:@"MisionQuien"];
    self.queTF.text = [self.fragmentariaDic objectForKey:@"MisionQue"];
    self.cuandoTF.text = [self.fragmentariaDic objectForKey:@"MisionCuando"];
    self.dondeTF.text = [self.fragmentariaDic objectForKey:@"MisionDonde"];
    self.paraQueTF.text = [self.fragmentariaDic objectForKey:@"MisionParaque"];
}
-(void)setAllTextFields{
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(self.view.frame.size.width-320,0,320,44)];
    [toolBar setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStylePlain target:self action:@selector(dismissInputView)];
    UIBarButtonItem *spacerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *spacerButton2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolBar.items = @[spacerButton,spacerButton2,barButtonDone];
    [self initPickerInput:pickerSiglas onTF:self.siglaTF withToolBar:toolBar];
    [self initPickerInput:pickerAeronaves onTF:self.aeronaveTF withToolBar:toolBar];
    [self initPickerInput:pickerMatriculas onTF:self.matriculaTF withToolBar:toolBar];
    [self initPickerInput:pickerFirmas onTF:self.firmaTF withToolBar:toolBar];
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
    pickerSiglas = [self createPickerWithTag:1];
    pickerAeronaves = [self createPickerWithTag:2];
    pickerMatriculas = [self createPickerWithTag:3];
    pickerFirmas = [self createPickerWithTag:4];
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

@end
