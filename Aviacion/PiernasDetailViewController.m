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
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    if ([type isEqualToString:@"edit"]) {
        self.title = [NSString stringWithFormat:@"Editando Pierna No. %@", piernaNumber];
    }
    else if([type isEqualToString:@"new"]){
        self.title = @"Nueva Pierna";
    }
    [self fillInfoWithDictionary];
    [self fillCountLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
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
    _tripulacionCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)tripulacionArray.count];
    _municionCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)municionArray.count];
    _puntosCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)puntosArray.count];
    _impactosCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)impactosArray.count];
}
-(void)fillInfoWithDictionary{
    _numeroPierna.text = piernaNumber;
    _deTF.text = [piernaDic objectForKey:@"de"];
    _aTF.text = [piernaDic objectForKey:@"a"];
    _arranque1TF.text = [piernaDic objectForKey:@"arranque1"];
    _arranque2TF.text = [piernaDic objectForKey:@"arranque2"];
    _aterrTF.text = [piernaDic objectForKey:@"aterr"];
    _autoTF.text = [piernaDic objectForKey:@"auto"];
    _corridosTF.text = [piernaDic objectForKey:@"corridos"];
    _misionTF.text = [piernaDic objectForKey:@"mision"];
    _stdTF.text = [piernaDic objectForKey:@"std"];
    _configTF.text = [piernaDic objectForKey:@"config"];
    _uApoyadaTF.text = [piernaDic objectForKey:@"uApoyada"];
    _operacionTF.text = [piernaDic objectForKey:@"operacion"];
    _pSalud1TF.text = [piernaDic objectForKey:@"pSalud1"];
    _pSalud2TF.text = [piernaDic objectForKey:@"pSalud2"];
    _ciclosTF.text = [piernaDic objectForKey:@"ciclos"];
    _fcsTF.text = [piernaDic objectForKey:@"fcs"];
    _tiemposAeronaveIniciaTF.text = [piernaDic objectForKey:@"tiemposAeronaveInicia"];
    _tiemposAeronaveTerminaTF.text = [piernaDic objectForKey:@"tiemposAeronaveTermina"];
    _tiemposAeronaveTotalTF.text = [piernaDic objectForKey:@"tiemposAeronaveTotal"];
    _tiemposTripulacionIniciaTF.text = [piernaDic objectForKey:@"tiemposTripulacionInicia"];
    _tiemposTripulacionTerminaTF.text = [piernaDic objectForKey:@"tiemposTripulacionTermina"];
    _tiemposTripulacionTotalTF.text = [piernaDic objectForKey:@"tiemposTripulacionTotal"];
    _cargaInternaTF.text = [piernaDic objectForKey:@"cargaInterna"];
    _cargaExternaTF.text = [piernaDic objectForKey:@"cargaExterna"];
    _cargaPaxTF.text = [piernaDic objectForKey:@"cargaPax"];
    _cargaHeridosTF.text = [piernaDic objectForKey:@"cargaHeridos"];
    _cargaMuertosTF.text = [piernaDic objectForKey:@"cargaMuertos"];
    _apuArranqueTF.text = [piernaDic objectForKey:@"apuArranque"];
    _apuHorasTF.text = [piernaDic objectForKey:@"apuHoras"];
    _apuTAireTF.text = [piernaDic objectForKey:@"apuTAire"];
    _apuTGenTF.text = [piernaDic objectForKey:@"apuTGen"];
}
-(void)setDictionaryForsave{
    //[piernaDic setObject:piernaNumber forKey:@"numeroPierna"];
    [piernaDic setObject:_deTF.text forKey:@"de"];
    [piernaDic setObject:_aTF.text forKey:@"a"];
    [piernaDic setObject:_arranque1TF.text forKey:@"arranque1"];
    [piernaDic setObject:_arranque2TF.text forKey:@"arranque2"];
    [piernaDic setObject:_aterrTF.text forKey:@"aterr"];
    [piernaDic setObject:_autoTF.text forKey:@"auto"];
    [piernaDic setObject:_corridosTF.text forKey:@"corridos"];
    [piernaDic setObject:_misionTF.text forKey:@"mision"];
    [piernaDic setObject:_stdTF.text forKey:@"std"];
    [piernaDic setObject:_configTF.text forKey:@"config"];
    [piernaDic setObject:_uApoyadaTF.text forKey:@"uApoyada"];
    [piernaDic setObject:_operacionTF.text forKey:@"operacion"];
    [piernaDic setObject:_pSalud1TF.text forKey:@"pSalud1"];
    [piernaDic setObject:_pSalud2TF.text forKey:@"pSalud2"];
    [piernaDic setObject:_ciclosTF.text forKey:@"ciclos"];
    [piernaDic setObject:_fcsTF.text forKey:@"fcs"];
    [piernaDic setObject:_tiemposAeronaveIniciaTF.text forKey:@"tiemposAeronaveInicia"];
    [piernaDic setObject:_tiemposAeronaveTerminaTF.text forKey:@"tiemposAeronaveTermina"];
    [piernaDic setObject:_tiemposAeronaveTotalTF.text forKey:@"tiemposAeronaveTotal"];
    [piernaDic setObject:_tiemposTripulacionIniciaTF.text forKey:@"tiemposTripulacionInicia"];
    [piernaDic setObject:_tiemposTripulacionTerminaTF.text forKey:@"tiemposTripulacionTermina"];
    [piernaDic setObject:_tiemposTripulacionTotalTF.text forKey:@"tiemposTripulacionTotal"];
    [piernaDic setObject:_cargaInternaTF.text forKey:@"cargaInterna"];
    [piernaDic setObject:_cargaExternaTF.text forKey:@"cargaExterna"];
    [piernaDic setObject:_cargaPaxTF.text forKey:@"cargaPax"];
    [piernaDic setObject:_cargaHeridosTF.text forKey:@"cargaHeridos"];
    [piernaDic setObject:_cargaMuertosTF.text forKey:@"cargaMuertos"];
    [piernaDic setObject:_apuArranqueTF.text forKey:@"apuArranque"];
    [piernaDic setObject:_apuHorasTF.text forKey:@"apuHoras"];
    [piernaDic setObject:_apuTAireTF.text forKey:@"apuTAire"];
    [piernaDic setObject:_apuTGenTF.text forKey:@"apuTGen"];
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


@end
