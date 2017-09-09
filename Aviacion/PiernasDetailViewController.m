//
//  PiernasDetailViewController.m
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "PiernasDetailViewController.h"
#import "FileSaver.h"
#import "GenericTableViewController.h"
@interface PiernasDetailViewController (){
    FileSaver *file;
    NSMutableDictionary *saveDic;
    
    NSMutableArray *tripulacionArray;
    NSMutableArray *municionArray;
    NSMutableArray *puntosArray;
    NSMutableArray *impactosArray;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
    UIDatePicker *datePicker;
}
@property (weak, nonatomic) IBOutlet UILabel *tripulacionCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *municionCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *puntosCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *impactosCountLabel;

@end

@implementation PiernasDetailViewController
@synthesize type, piernaNumber,delegate,piernaDic;
- (void)viewDidLoad {
    [super viewDidLoad];
    file = [[FileSaver alloc]init];
    
    [self setAllPickers];
    [self setAllTextFields];
    
    //Este snippet crea placeholders de arreglos para munición, tripulación etc.. si estos no existen
    //En caso que si existan, los extraemos de si mismos y creamos una copia mutable
    tripulacionArray = [piernaDic objectForKey:@"tripulacion"] ?
    [[piernaDic objectForKey:@"tripulacion"] mutableCopy]:
    [[NSMutableArray alloc]init];
    
    [piernaDic setObject:tripulacionArray forKey:@"tripulacion"];
    
    municionArray = [piernaDic objectForKey:@"municion"] ?
    [[piernaDic objectForKey:@"municion"] mutableCopy]:
    [[NSMutableArray alloc]init];
    
    [piernaDic setObject:municionArray forKey:@"municion"];
    
    puntosArray = [piernaDic objectForKey:@"puntos"] ?
    [[piernaDic objectForKey:@"puntos"] mutableCopy]:
    [[NSMutableArray alloc]init];
    
    [piernaDic setObject:puntosArray forKey:@"puntos"];
    
    impactosArray = [piernaDic objectForKey:@"impactos"] ?
    [[piernaDic objectForKey:@"impactos"] mutableCopy]:
    [[NSMutableArray alloc]init];
    
    [piernaDic setObject:impactosArray forKey:@"impactos"];
    
    [self fillInfoWithDictionary];
}
-(void)viewWillAppear:(BOOL)animated{
    if ([type isEqualToString:@"edit"]) {
        self.title = [NSString stringWithFormat:@"%@ -> %@", [piernaDic objectForKey:@"DescDe"], [piernaDic objectForKey:@"DescA"]];
    }
    else if([type isEqualToString:@"new"]){
        self.title = @"Nueva Pierna";
    }
    //[self fillInfoWithDictionary];
    [self fillCountLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    [self getTotals];
    [self setDictionaryForsave];
    if ([type isEqualToString:@"edit"]) {
        [self.delegate overwrite:piernaDic atIndex:[piernaNumber intValue]];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"Editing from piernasdetailvc");
    }
    else if ([type isEqualToString:@"new"]) {
        [self.delegate saveNew:piernaDic];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"Saving from piernasdetailvc");
    }
}
-(void)fillCountLabels{
    self.tripulacionCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)tripulacionArray.count];
    self.municionCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)municionArray.count];
    self.puntosCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)puntosArray.count];
    self.impactosCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)impactosArray.count];
}
-(void)fillInfoWithDictionary{
    self.numeroPierna.text = piernaNumber;
    
    self.deTF.text = [piernaDic objectForKey:@"DescDe"];
    self.deTF.tag = [[piernaDic objectForKey:@"De"] doubleValue];
    
    self.aTF.text = [piernaDic objectForKey:@"DescA"];
    self.aTF.tag = [[piernaDic objectForKey:@"A"] doubleValue];
    
    self.arranque1TF.text = [piernaDic objectForKey:@"arranque1"];
    self.arranque2TF.text = [piernaDic objectForKey:@"arranque2"];
    self.aterrTF.text = [piernaDic objectForKey:@"aterr"];
    self.autoTF.text = [piernaDic objectForKey:@"auto"];
    self.corridosTF.text = [piernaDic objectForKey:@"corridos"];
    
    self.misionTF.text = [piernaDic objectForKey:@"DescIdMision"];
    self.misionTF.tag = [[piernaDic objectForKey:@"IdMision"] doubleValue];
    
    self.stdTF.text = [piernaDic objectForKey:@"std"];
    
    self.configTF.text = [piernaDic objectForKey:@"DescIdConfiguracionMision"];
    self.configTF.tag = [[piernaDic objectForKey:@"IdConfiguracionMision"] doubleValue];
    
    self.uApoyadaTF.text = [piernaDic objectForKey:@"DescIdUnidadApoyada"];
    self.uApoyadaTF.tag = [[piernaDic objectForKey:@"IdUnidadApoyada"] doubleValue];
    
    //self.operacionTF.text = [piernaDic objectForKey:@"DescIdUnidadTacticaSale"];
    //self.operacionTF.tag = [[piernaDic objectForKey:@"IdUnidadTacticaSale"] doubleValue];
    
    self.operacionTF.text = [self.ordenDic objectForKey:@"NombreOperacion"];
    self.operacionTF.tag = [[self.ordenDic objectForKey:@"idOperacion"] doubleValue];
    
    self.pSalud1TF.text = [piernaDic objectForKey:@"pSalud1"];
    self.pSalud2TF.text = [piernaDic objectForKey:@"pSalud2"];
    self.ciclosTF.text = [piernaDic objectForKey:@"ciclos"];
    self.fcsTF.text = [piernaDic objectForKey:@"fcs"];
    self.tiemposAeronaveIniciaTF.text = [piernaDic objectForKey:@"tiemposAeronaveInicia"];
    self.tiemposAeronaveTerminaTF.text = [piernaDic objectForKey:@"tiemposAeronaveTermina"];
    self.tiemposAeronaveTotalTF.text = [piernaDic objectForKey:@"tiemposAeronaveTotal"];
    self.tiemposTripulacionIniciaTF.text = [piernaDic objectForKey:@"tiemposTripulacionInicia"];
    self.tiemposTripulacionTerminaTF.text = [piernaDic objectForKey:@"tiemposTripulacionTermina"];
    self.tiemposTripulacionTotalTF.text = [piernaDic objectForKey:@"tiemposTripulacionTotal"];
    self.cargaInternaTF.text = [piernaDic objectForKey:@"KilosEntran"];
    self.cargaExternaTF.text = [piernaDic objectForKey:@"cargaExterna"];
    self.cargaPaxTF.text = [piernaDic objectForKey:@"PaxEntran"];
    self.cargaHeridosTF.text = [piernaDic objectForKey:@"cargaHeridos"];
    self.cargaMuertosTF.text = [piernaDic objectForKey:@"cargaMuertos"];
    self.apuArranqueTF.text = [piernaDic objectForKey:@"apuArranque"];
    self.apuHorasTF.text = [piernaDic objectForKey:@"apuHoras"];
    self.apuTAireTF.text = [piernaDic objectForKey:@"apuTAire"];
    self.apuTGenTF.text = [piernaDic objectForKey:@"apuTGen"];
}
-(void)setDictionaryForsave{
    //[piernaDic setObject:piernaNumber forKey:@"numeroPierna"];
    
    [piernaDic setObject:self.deTF.text forKey:@"DescDe"];
    [piernaDic setObject:[NSString stringWithFormat:@"%li", (long)self.deTF.tag] forKey:@"De"];
    
    [piernaDic setObject:self.aTF.text forKey:@"DescA"];
    [piernaDic setObject:[NSString stringWithFormat:@"%li", (long)self.aTF.tag] forKey:@"A"];
    
    
    [piernaDic setObject:self.arranque1TF.text forKey:@"arranque1"];
    [piernaDic setObject:self.arranque2TF.text forKey:@"arranque2"];
    [piernaDic setObject:self.aterrTF.text forKey:@"aterr"];
    [piernaDic setObject:self.autoTF.text forKey:@"auto"];
    [piernaDic setObject:self.corridosTF.text forKey:@"corridos"];
    
    [piernaDic setObject:self.misionTF.text forKey:@"DescIdMision"];
    [piernaDic setObject:[NSString stringWithFormat:@"%li", (long)self.misionTF.tag] forKey:@"IdMision"];
    
    
    [piernaDic setObject:self.stdTF.text forKey:@"std"];
    
    
    [piernaDic setObject:self.configTF.text forKey:@"DescIdConfiguracionMision"];
    [piernaDic setObject:[NSString stringWithFormat:@"%li", (long)self.configTF.tag] forKey:@"IdConfiguracionMision"];
    
    [piernaDic setObject:self.uApoyadaTF.text forKey:@"DescIdUnidadApoyada"];
    [piernaDic setObject:[NSString stringWithFormat:@"%li", (long)self.uApoyadaTF.tag] forKey:@"IdUnidadApoyada"];
    
    //[piernaDic setObject:self.operacionTF.text forKey:@"DescIdUnidadTacticaSale"];
    //[piernaDic setObject:[NSString stringWithFormat:@"%li", (long)self.operacionTF.tag] forKey:@"IdUnidadTacticaSale"];

    [piernaDic setObject:self.operacionTF.text forKey:@"NombreOperacion"];
    [piernaDic setObject:self.ordenDic[@"IdOperacion"] forKey:@"idOperacion"];

    [piernaDic setObject:self.pSalud1TF.text forKey:@"pSalud1"];
    [piernaDic setObject:self.pSalud2TF.text forKey:@"pSalud2"];
    [piernaDic setObject:self.ciclosTF.text forKey:@"ciclos"];
    [piernaDic setObject:self.fcsTF.text forKey:@"fcs"];
    [piernaDic setObject:self.tiemposAeronaveIniciaTF.text forKey:@"tiemposAeronaveInicia"];
    [piernaDic setObject:self.tiemposAeronaveTerminaTF.text forKey:@"tiemposAeronaveTermina"];
    [piernaDic setObject:self.tiemposAeronaveTotalTF.text forKey:@"tiemposAeronaveTotal"];
    [piernaDic setObject:self.tiemposTripulacionIniciaTF.text forKey:@"tiemposTripulacionInicia"];
    [piernaDic setObject:self.tiemposTripulacionTerminaTF.text forKey:@"tiemposTripulacionTermina"];
    [piernaDic setObject:self.tiemposTripulacionTotalTF.text forKey:@"tiemposTripulacionTotal"];
    
    [piernaDic setObject:self.cargaInternaTF.text forKey:@"KilosEntran"];
    
    [piernaDic setObject:self.cargaExternaTF.text forKey:@"cargaExterna"];
    
    [piernaDic setObject:self.cargaPaxTF.text forKey:@"PaxEntran"];
    
    [piernaDic setObject:self.cargaHeridosTF.text forKey:@"cargaHeridos"];
    [piernaDic setObject:self.cargaMuertosTF.text forKey:@"cargaMuertos"];
    [piernaDic setObject:self.apuArranqueTF.text forKey:@"apuArranque"];
    [piernaDic setObject:self.apuHorasTF.text forKey:@"apuHoras"];
    [piernaDic setObject:self.apuTAireTF.text forKey:@"apuTAire"];
    [piernaDic setObject:self.apuTGenTF.text forKey:@"apuTGen"];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    GenericTableViewController *gTVC = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"Tripulacion"]) {
        gTVC.genericArray = tripulacionArray;
    }
    else if ([segue.identifier isEqualToString:@"Municion"]) {
        gTVC.genericArray = municionArray;
    }
    else if ([segue.identifier isEqualToString:@"Puntos"]) {
        gTVC.genericArray = puntosArray;
    }
    else if ([segue.identifier isEqualToString:@"Impactos"]) {
        gTVC.genericArray = impactosArray;
    }
    
    gTVC.type = segue.identifier;
    
    
}

-(void)getTotals{
    NSDate *date1 = [self returnDateWithStringDate:self.tiemposAeronaveIniciaTF.text andStringFormat:@"dd-MM-yyyy HH:mm"];
    NSDate *date2 = [self returnDateWithStringDate:self.tiemposAeronaveTerminaTF.text andStringFormat:@"dd-MM-yyyy HH:mm"];
    NSDate *date3 = [self returnDateWithStringDate:self.tiemposTripulacionIniciaTF.text andStringFormat:@"dd-MM-yyyy HH:mm"];
    NSDate *date4 = [self returnDateWithStringDate:self.tiemposTripulacionTerminaTF.text andStringFormat:@"dd-MM-yyyy HH:mm"];
    
    NSTimeInterval interval1=[date1 timeIntervalSince1970];
    NSTimeInterval interval2=[date2 timeIntervalSince1970];
    NSTimeInterval interval3=[date3 timeIntervalSince1970];
    NSTimeInterval interval4=[date4 timeIntervalSince1970];
    
    int totalAeronave = (interval2 - interval1)/60;
    int totalTripulacion = (interval4 - interval3)/60;
    
    if(totalAeronave<=0){
        totalAeronave = 0;
    }
    if(totalTripulacion<=0){
        totalTripulacion = 0;
    }
    
    self.tiemposAeronaveTotalTF.text = [NSString stringWithFormat:@"%i",totalAeronave];
    self.tiemposTripulacionTotalTF.text = [NSString stringWithFormat:@"%i",totalTripulacion];
}

#pragma mark - set pickers & textfields
- (void)setAllPickers{
    
    datePicker = [[UIDatePicker alloc]init];
    datePicker.tag = 5000;
    [datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    [datePicker addTarget:self action:@selector(displayDate:) forControlEvents:UIControlEventValueChanged];
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
    
    self.tiemposAeronaveIniciaTF.inputView = datePicker;
    self.tiemposAeronaveIniciaTF.inputAccessoryView = toolBar;
    self.tiemposAeronaveTerminaTF.inputView = datePicker;
    self.tiemposAeronaveTerminaTF.inputAccessoryView = toolBar;
    
    self.tiemposTripulacionIniciaTF.inputView = datePicker;
    self.tiemposTripulacionIniciaTF.inputAccessoryView = toolBar;
    self.tiemposTripulacionTerminaTF.inputView = datePicker;
    self.tiemposTripulacionTerminaTF.inputAccessoryView = toolBar;
}
#pragma mark - dismiss input view
-(void)dismissInputView{
    [self getTotals];
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *expression = @"^-?[0-9]*((\\.|,)[0-9]{0,2})?$";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:newString options:0 range:NSMakeRange(0, [newString length])];
    return numberOfMatches != 0;
}
@end
