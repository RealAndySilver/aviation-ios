//
//  EvaluacionAeronaveViewController.m
//  Aviacion
//
//  Created by Andres Abril on 15/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "EntregaAeronaveViewController.h"

@interface EntregaAeronaveViewController (){
    NSMutableArray *aeronaveArray;
    NSMutableArray *armamentoArray;
    NSMutableArray *alseArray;
    FileSaver *file;
    NSArray *lugaresArray;
    NSArray *matriculasArray;
    NSArray *personasArray;
    
    UIPickerView *pickerLugares;
    UIPickerView *pickerMatriculas;
    UIPickerView *pickerPersonas;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
}

@end

@implementation EntregaAeronaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Entrega Aeronave";
    file = [[FileSaver alloc]init];
    
    lugaresArray = [[file getDictionary:@"ListaLugares"] objectForKey:@"array"];
    matriculasArray = [[file getDictionary:@"ListaMatriculasAeronaves"] objectForKey:@"array"];
    personasArray = [[file getDictionary:@"ListaPersonas"]objectForKey:@"array"];
    
    aeronaveArray = [[NSMutableArray alloc]init];
    armamentoArray = [[NSMutableArray alloc]init];
    alseArray = [[NSMutableArray alloc]init];
    
    NSLog(@"Matr:%@ ",[matriculasArray[1] objectForKey:@"Matricula"]);
    [self setAllPickers];
    [self setAllTextFields];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.aeronaveTV reloadData];
    [self.armamentoTV reloadData];
    [self.alseTV reloadData];
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetalleEntregaAeronaveViewController *dVC =  [segue destinationViewController];
    dVC.type = segue.identifier;
    
    if ([segue.identifier isEqualToString:@"aeronave"]) {
        dVC.arrayForDetail = aeronaveArray;
    }
    else if ([segue.identifier isEqualToString:@"armamento"]) {
        dVC.arrayForDetail = armamentoArray;
    }
    else if ([segue.identifier isEqualToString:@"alse"]) {
        dVC.arrayForDetail = alseArray;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return aeronaveArray.count;
    }
    else if (tableView.tag == 2) {
        return armamentoArray.count;
    }
    else if (tableView.tag == 3) {
        return alseArray.count;
    }
    else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1) {
        EntregaAeronaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aeronave" forIndexPath:indexPath];
        NSDictionary *dic = aeronaveArray[indexPath.row];
        cell.materialLabel.text = [dic objectForKey:@"Material"];
        cell.cantidadLabel.text = [dic objectForKey:@"Cantidad"];
        return cell;
    }
    else if (tableView.tag == 2) {
        EntregaAeronaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"armamento" forIndexPath:indexPath];
        NSDictionary *dic = armamentoArray[indexPath.row];
        cell.materialLabel.text = [dic objectForKey:@"Material"];
        cell.cantidadLabel.text = [dic objectForKey:@"Cantidad"];
        cell.serieLabel.text = [dic objectForKey:@"Serie"];
        cell.responsableLabel.text = [dic objectForKey:@"Responsable"];
        
        return cell;
    }
    else if (tableView.tag == 3) {
        EntregaAeronaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"alse" forIndexPath:indexPath];
        NSDictionary *dic = alseArray[indexPath.row];
        cell.materialLabel.text = [dic objectForKey:@"Material"];
        cell.cantidadLabel.text = [dic objectForKey:@"Cantidad"];
        cell.serieLabel.text = [dic objectForKey:@"Serie"];
        cell.responsableLabel.text = [dic objectForKey:@"Responsable"];
        return cell;
    }
    return nil;
}
#pragma mark - Picker delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    //listaAmenazaAlaRotatoria;
    if (pickerView.tag == 1) {
        return lugaresArray.count;
    }
    
    //listaSupervisionAlaRotatoria;
    else if (pickerView.tag == 2) {
        return matriculasArray.count;
    }
    
    //listaPlaneamientoAlaRotatoria;
    else if (pickerView.tag == 3) {
        return personasArray.count;
    }
    
    return 0;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //listaAmenazaAlaRotatoria;
    if (pickerView.tag == 1) {
        return [lugaresArray[row] objectForKey:@"Nombre"];
    }
    
    //listaSupervisionAlaRotatoria;
    else if (pickerView.tag == 2) {
        return [matriculasArray[row] objectForKey:@"Matricula"];
    }
    
    //listaPlaneamientoAlaRotatoria;
    else if (pickerView.tag == 3) {
        return [personasArray[row] objectForKey:@"NombreCompleto"];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //    listaLugaresa;
    if (pickerView.tag == 1) {
        currentTextField.text = [lugaresArray[row] objectForKey:@"Nombre"];
        currentTextField.tag = [[lugaresArray[row] objectForKey:@"IdLugar"] doubleValue];
    }
    //    listaMatriculas;
    else if (pickerView.tag == 2) {
        currentTextField.text = [matriculasArray[row] objectForKey:@"Matricula"];
        currentTextField.tag = [[matriculasArray[row] objectForKey:@"IdAeronave"] doubleValue];
    }
    //    listaPersonas;
    else if (pickerView.tag == 3) {
        currentTextField.text = [personasArray[row] objectForKey:@"NombreCompleto"];
        currentTextField.tag = [[personasArray[row] objectForKey:@"PersonaId"] doubleValue];
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
    [self initPickerInput:pickerLugares onTF:self.lugarTF withToolBar:toolBar];
    
    [self initPickerInput:pickerMatriculas onTF:self.matriculaTF withToolBar:toolBar];
    [self initPickerInput:pickerPersonas onTF:self.pilotoSaliente withToolBar:toolBar];
    [self initPickerInput:pickerPersonas onTF:self.pilotoEntrante withToolBar:toolBar];
    [self initPickerInput:pickerPersonas onTF:self.jefeSaliente withToolBar:toolBar];
    [self initPickerInput:pickerPersonas onTF:self.jefeEntrante withToolBar:toolBar];
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
    pickerLugares = [self createPickerWithTag:1];
    pickerMatriculas = [self createPickerWithTag:2];
    pickerPersonas = [self createPickerWithTag:3];
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
    NSInteger index = 0;
    NSArray *array;
    
    if (currentPicker.tag == 7001) {
        array = [lugaresArray valueForKey:@"Nombre"];
        assert(lugaresArray.count == array.count);
    }
    else if (currentPicker.tag == 7002) {
        array = [matriculasArray valueForKey:@"Matricula"];
        assert(matriculasArray.count == array.count);
    }
    else if (currentPicker.tag == 7003) {
        array = [personasArray valueForKey:@"NombreCompleto"];
        assert(personasArray.count == array.count);
    }
    index=[array indexOfObject:currentTextField.text];
    
    if(index != NSNotFound ){
        [currentPicker selectRow:index inComponent:0 animated:YES];
    }
    else{
        [currentPicker selectRow:0 inComponent:0 animated:YES];
    }
}
@end
