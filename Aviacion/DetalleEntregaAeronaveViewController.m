//
//  DetalleEntregaAeronaveViewController.m
//  Aviacion
//
//  Created by Andres Abril on 15/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "DetalleEntregaAeronaveViewController.h"

@interface DetalleEntregaAeronaveViewController (){
    FileSaver *file;
    NSArray *materiales;
    NSArray *responsablesArray;
    NSMutableArray *cantidadesArray;
    
    UIPickerView *pickerMateriales;
    UIPickerView *pickerCantidades;
    UIPickerView *pickerResponsables;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
}

@end

@implementation DetalleEntregaAeronaveViewController
@synthesize arrayForDetail,type;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    file =[[FileSaver alloc]init];
    if ([type isEqualToString:@"aeronave"]) {
        self.tituloLabel.text = @"Materiales Aeronave";
        self.serieLabel.hidden = YES;
        self.serieTF.hidden = YES;
        self.responsableLabel.hidden = YES;
        self.responsableTF.hidden = YES;
        materiales = [[file getDictionary:@"ListaMaterialesAeronave"] objectForKey:@"array"];
    }
    else if ([type isEqualToString:@"armamento"]) {
        self.tituloLabel.text = @"Armamento";
        materiales = [[file getDictionary:@"ListaArmamentos"] objectForKey:@"array"];
    }
    else if ([type isEqualToString:@"alse"]) {
        self.tituloLabel.text = @"Materiales Alse";
        materiales = [[file getDictionary:@"ListaEquiposAlseAeronave"] objectForKey:@"array"];
    }
    cantidadesArray = [[NSMutableArray alloc]init];
    for (int i=0; i<101; i++) {
        [cantidadesArray addObject:[NSString stringWithFormat:@"%i",i]];
    }
    responsablesArray = [[file getDictionary:@"ListaPersonas"] objectForKey:@"array"];
    
    NSLog(@"Materiales %@:",[file getDictionary:@"ListaEquiposAlseAeronave"]);
    [self setAllPickers];
    [self setAllTextFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)create:(id)sender{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:self.materialTF.text forKey:@"Material"];
    [dic setObject:[NSString stringWithFormat:@"%li",(long)self.materialTF.tag] forKey:@"IdMaterial"];
    
    [dic setObject:self.cantidadTF.text forKey:@"Cantidad"];

    if ([type isEqualToString:@"armamento"] || [type isEqualToString:@"alse"]) {
        [dic setObject:self.serieTF.text forKey:@"Serie"];
        [dic setObject:self.responsableTF.text forKey:@"Responsable"];
        [dic setObject:[NSString stringWithFormat:@"%li",(long)self.responsableTF.tag] forKey:@"IdResponsable"];
    }
    [arrayForDetail addObject:dic];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Picker delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    //listaMaterialesAeronave;
    if (pickerView.tag == 1) {
        return materiales.count;
    }
    //listaCantidad;
    else if (pickerView.tag == 2) {
        return cantidadesArray.count;
    }
    //listaResponsables;
    else if (pickerView.tag == 3) {
        return responsablesArray.count;
    }
    return 0;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //listaMaterialesAeronave;
    if (pickerView.tag == 1) {
        NSString *text = @"";
        if ([type isEqualToString:@"aeronave"]) {
            text = [materiales[row] objectForKey:@"ValorFlexible"];
        }
        else if ([type isEqualToString:@"armamento"]) {
            text = [materiales[row] objectForKey:@"Nombre"];
        }
        else if ([type isEqualToString:@"alse"]) {
            text = [materiales[row] objectForKey:@"ValorFlexible"];
        }
        return text;
    }
    //listaCantidades;
    else if (pickerView.tag == 2) {
        return cantidadesArray[row];
    }
    //listaResponsables;
    else if (pickerView.tag == 3) {
        return [responsablesArray[row] objectForKey:@"NombreCompleto"];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView.tag == 1) {
        NSString *text = @"";
        double tag = 0;
        if ([type isEqualToString:@"aeronave"]) {
            text = [materiales[row] objectForKey:@"ValorFlexible"];
            tag = [[materiales[row] objectForKey:@"ValorFlexibleId"] doubleValue];
        }
        else if ([type isEqualToString:@"armamento"]) {
            text = [materiales[row] objectForKey:@"Nombre"];
            tag = [[materiales[row] objectForKey:@"IdArmamento"] doubleValue];
        }
        else if ([type isEqualToString:@"alse"]) {
            text = [materiales[row] objectForKey:@"ValorFlexible"];
            tag = [[materiales[row] objectForKey:@"ValorFlexibleId"] doubleValue];
        }
        currentTextField.text = text;
        currentTextField.tag = tag;
    }
    else if (pickerView.tag == 2) {
        currentTextField.text = cantidadesArray[row];
    }
    else if (pickerView.tag == 3) {
        currentTextField.text = [responsablesArray[row] objectForKey:@"NombreCompleto"];
        currentTextField.tag = [[responsablesArray[row] objectForKey:@"PersonaId"] doubleValue];
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
    [self initPickerInput:pickerMateriales onTF:self.materialTF withToolBar:toolBar];
    
    [self initPickerInput:pickerCantidades onTF:self.cantidadTF withToolBar:toolBar];
    [self initPickerInput:pickerResponsables onTF:self.responsableTF withToolBar:toolBar];
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
    pickerMateriales = [self createPickerWithTag:1];
    pickerCantidades = [self createPickerWithTag:2];
    pickerResponsables = [self createPickerWithTag:3];
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
