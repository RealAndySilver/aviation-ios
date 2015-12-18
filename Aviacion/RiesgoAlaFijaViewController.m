//
//  RiesgoAlaFijaViewController.m
//  Aviacion
//
//  Created by Andres Abril on 4/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "RiesgoAlaFijaViewController.h"
#import "ListasFijas.h"

@interface RiesgoAlaFijaViewController (){
    NSMutableArray *listaAmenaza;
    NSMutableArray *listaSupervision;
    NSMutableArray *listaPlaneamiento;
    NSMutableArray *listaDias;
    NSMutableArray *listaHoras;
    NSMutableArray *listaSalidaDestino;
    NSMutableArray *listaComplejidadDeLaMision;
    NSMutableArray *listaCondicionDePista;
    NSMutableArray *listaRendimientoTripulacion;
    NSMutableArray *listaTipoAeronave;
    
    //Pickers
    UIPickerView *pickerAmenaza;
    UIPickerView *pickerSupervision;
    UIPickerView *pickerPlaneamiento;
    UIPickerView *pickerDias;
    UIPickerView *pickerHoras;
    UIPickerView *pickerSalidaDestino;
    UIPickerView *pickerComplejidadDeLaMision;
    UIPickerView *pickerCondicionesdePista;
    UIPickerView *pickerRendimientoTripulacion;
    UIPickerView *pickerTipoAeronave;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
}

@end

@implementation RiesgoAlaFijaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Riesgo Ala Fija";
    [self cargarListasEnArreglos];
    [self setAllPickers];
    [self setAllTextFields];
}

#pragma mark - set pickers & textfields
- (void)setAllPickers{
   
    
    pickerAmenaza=[[UIPickerView alloc]init];
    pickerAmenaza.dataSource=self;
    pickerAmenaza.delegate=self;
    pickerAmenaza.showsSelectionIndicator = YES;
    pickerAmenaza.tag=9000;
    
    pickerSupervision=[[UIPickerView alloc]init];
    pickerSupervision.dataSource=self;
    pickerSupervision.delegate=self;
    pickerSupervision.showsSelectionIndicator = YES;
    pickerSupervision.tag=9001;
    
    pickerPlaneamiento=[[UIPickerView alloc]init];
    pickerPlaneamiento.dataSource=self;
    pickerPlaneamiento.delegate=self;
    pickerPlaneamiento.showsSelectionIndicator = YES;
    pickerPlaneamiento.tag=9002;
    
    pickerDias=[[UIPickerView alloc]init];
    pickerDias.dataSource=self;
    pickerDias.delegate=self;
    pickerDias.showsSelectionIndicator = YES;
    pickerDias.tag=9003;
    
    pickerHoras=[[UIPickerView alloc]init];
    pickerHoras.dataSource=self;
    pickerHoras.delegate=self;
    pickerHoras.showsSelectionIndicator = YES;
    pickerHoras.tag=9004;
    
    pickerSalidaDestino=[[UIPickerView alloc]init];
    pickerSalidaDestino.dataSource=self;
    pickerSalidaDestino.delegate=self;
    pickerSalidaDestino.showsSelectionIndicator = YES;
    pickerSalidaDestino.tag=9005;
    
    pickerComplejidadDeLaMision=[[UIPickerView alloc]init];
    pickerComplejidadDeLaMision.dataSource=self;
    pickerComplejidadDeLaMision.delegate=self;
    pickerComplejidadDeLaMision.showsSelectionIndicator = YES;
    pickerComplejidadDeLaMision.tag=9006;
    
    pickerCondicionesdePista=[[UIPickerView alloc]init];
    pickerCondicionesdePista.dataSource=self;
    pickerCondicionesdePista.delegate=self;
    pickerCondicionesdePista.showsSelectionIndicator = YES;
    pickerCondicionesdePista.tag=9007;
    
    pickerRendimientoTripulacion=[[UIPickerView alloc]init];
    pickerRendimientoTripulacion.dataSource=self;
    pickerRendimientoTripulacion.delegate=self;
    pickerRendimientoTripulacion.showsSelectionIndicator = YES;
    pickerRendimientoTripulacion.tag=9008;
    
    pickerTipoAeronave=[[UIPickerView alloc]init];
    pickerTipoAeronave.dataSource=self;
    pickerTipoAeronave.delegate=self;
    pickerTipoAeronave.showsSelectionIndicator = YES;
    pickerTipoAeronave.tag=9009;
    
}

- (void)setAllTextFields{
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(self.view.frame.size.width-320,0,320,44)];
    [toolBar setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStylePlain target:self action:@selector(dismissInputView)];
    UIBarButtonItem *spacerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *spacerButton2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolBar.items = @[spacerButton,spacerButton2,barButtonDone];
    
    _situacionEnemigaTF.inputView = pickerAmenaza;
    _situacionEnemigaTF.inputAccessoryView = toolBar;
    
    _personalOrganicoTF.inputView = pickerSupervision;
    _personalOrganicoTF.inputAccessoryView = toolBar;
    
    _personalAgredadoTF.inputView = pickerSupervision;
    _personalAgredadoTF.inputAccessoryView = toolBar;
    
    _infoSuperficialTF.inputView = pickerPlaneamiento;
    _infoSuperficialTF.inputAccessoryView = toolBar;
    
    _infoEspecificaTF.inputView = pickerPlaneamiento;
    _infoEspecificaTF.inputAccessoryView = toolBar;
    
    _pamDiasSinVolarTF.inputView = pickerDias;
    _pamDiasSinVolarTF.inputAccessoryView = toolBar;
    
    _pam60DiasTF.inputView = pickerHoras;
    _pam60DiasTF.inputAccessoryView = toolBar;
    
    _pDiasSinVolarTF.inputView = pickerDias;
    _pDiasSinVolarTF.inputAccessoryView = toolBar;
    
    _p60DiasTF.inputView = pickerHoras;
    _p60DiasTF.inputAccessoryView = toolBar;

    _tvDiasSinVolarTF.inputView = pickerDias;
    _tvDiasSinVolarTF.inputAccessoryView = toolBar;
    
    _tv60DiasTF.inputView = pickerHoras;
    _tv60DiasTF.inputAccessoryView = toolBar;
    
    _cmSalidaTF.inputView = pickerSalidaDestino;
    _cmSalidaTF.inputAccessoryView = toolBar;
    
    _cmDestinoTF.inputView = pickerSalidaDestino;
    _cmDestinoTF.inputAccessoryView = toolBar;
    
    _transporteExplosivosTF.inputView = pickerComplejidadDeLaMision;
    _transporteExplosivosTF.inputAccessoryView = toolBar;
    
    _movimientoAereoTF.inputView = pickerComplejidadDeLaMision;
    _movimientoAereoTF.inputAccessoryView = toolBar;
    
    _mantenimientoTF.inputView = pickerComplejidadDeLaMision;
    _mantenimientoTF.inputAccessoryView = toolBar;
    
    _sostAviacionTF.inputView = pickerComplejidadDeLaMision;
    _sostAviacionTF.inputAccessoryView = toolBar;
    
    _reconocimientoTF.inputView = pickerComplejidadDeLaMision;
    _reconocimientoTF.inputAccessoryView = toolBar;
    
    _entrenamientoTF.inputView = pickerComplejidadDeLaMision;
    _entrenamientoTF.inputAccessoryView = toolBar;
    
    _vueloInternacionalTF.inputView = pickerComplejidadDeLaMision;
    _vueloInternacionalTF.inputAccessoryView = toolBar;
    
    _trpTF.inputView = pickerComplejidadDeLaMision;
    _trpTF.inputAccessoryView = toolBar;
    
    _comandoYControlTF.inputView = pickerComplejidadDeLaMision;
    _comandoYControlTF.inputAccessoryView = toolBar;
    
    _inteligenciaTecnicaTF.inputView = pickerComplejidadDeLaMision;
    _inteligenciaTecnicaTF.inputAccessoryView = toolBar;
    
    _medevacTF.inputView = pickerComplejidadDeLaMision;
    _medevacTF.inputAccessoryView = toolBar;
    
    _paracaidismoTF.inputView = pickerComplejidadDeLaMision;
    _paracaidismoTF.inputAccessoryView = toolBar;
    
    _secaTF.inputView = pickerCondicionesdePista;
    _secaTF.inputAccessoryView = toolBar;
    
    _humedaTF.inputView = pickerCondicionesdePista;
    _humedaTF.inputAccessoryView = toolBar;
    
    _noPreparadaTF.inputView = pickerCondicionesdePista;
    _noPreparadaTF.inputAccessoryView = toolBar;
    
    _combustibleTF.inputView = pickerCondicionesdePista;
    _combustibleTF.inputAccessoryView = toolBar;
    
    _sinCombustibleTF.inputView = pickerCondicionesdePista;
    _sinCombustibleTF.inputAccessoryView = toolBar;
    
    _atcTF.inputView = pickerCondicionesdePista;
    _atcTF.inputAccessoryView = toolBar;
    
    _sinAtcTF.inputView = pickerCondicionesdePista;
    _sinAtcTF.inputAccessoryView = toolBar;
    
    _adecuadoTF.inputView = pickerRendimientoTripulacion;
    _adecuadoTF.inputAccessoryView = toolBar;
    
    _noAdecuadoTF.inputView = pickerRendimientoTripulacion;
    _noAdecuadoTF.inputAccessoryView = toolBar;
    
    _tipoDeAeronaveTF.inputView = pickerTipoAeronave;
    _tipoDeAeronaveTF.inputAccessoryView = toolBar;

}

#pragma mark - dismiss input view
-(void)dismissInputView{
    [currentTextField becomeFirstResponder];
    [currentTextField resignFirstResponder];
}

#pragma mark - Update Total Labels
-(void)updateLabels{
    _amenazaTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_situacionEnemigaTF.tag FromString:@"situacionEnemiga"]];
    
    if (_supervisionSC.selectedSegmentIndex == 0) {
        _supervisionTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_personalOrganicoTF.tag FromString:@"personalOrganico"]];
    }
    else{
        _supervisionTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_personalAgredadoTF.tag FromString:@"personalAgredado"]];
    }
    
    if (_planeamientoSC.selectedSegmentIndex == 0) {
        _planeamientoTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_infoSuperficialTF.tag FromString:@"infoSuperficial"]];
    }
    else{
        _planeamientoTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_infoEspecificaTF.tag FromString:@"infoEspecifica"]];
    }
    
    _nivelDePericiaTotalLabel.text = [NSString stringWithFormat:@"%i",
                                      [self evaluateTag:_pamDiasSinVolarTF.tag FromString:@"pamDiasSinVolar"] +
                                      [self evaluateTag:_pam60DiasTF.tag FromString:@"pam60Dias"] +
                                      [self evaluateTag:_pDiasSinVolarTF.tag FromString:@"pDiasSinVolar"]+
                                      [self evaluateTag:_p60DiasTF.tag FromString:@"p60Dias"]+
                                      [self evaluateTag:_tvDiasSinVolarTF.tag FromString:@"tvDiasSinVolar"]+
                                      [self evaluateTag:_tv60DiasTF.tag FromString:@"tv60Dias"]];
    
    _condicionesMeteorologicasTotalLabel.text = [NSString stringWithFormat:@"%i",
                                                 [self evaluateTag:_cmSalidaTF.tag FromString:@"cmSalida"] +
                                                 [self evaluateTag:_cmDestinoTF.tag FromString:@"cmDestino"]];
    
    _complejidadDeLaMisionTotalLabel.text = [NSString stringWithFormat:@"%i",
                                            [self evaluateTag:_transporteExplosivosTF.tag FromString:@"transporteExplosivos"] +
                                            [self evaluateTag:_movimientoAereoTF.tag FromString:@"movimientoAereo"] +
                                            [self evaluateTag:_mantenimientoTF.tag FromString:@"mantenimiento"] +
                                            [self evaluateTag:_sostAviacionTF.tag FromString:@"sostAviacion"] +
                                            [self evaluateTag:_reconocimientoTF.tag FromString:@"reconocimiento"]+
                                            [self evaluateTag:_entrenamientoTF.tag FromString:@"entrenamiento"]+
                                            [self evaluateTag:_vueloInternacionalTF.tag FromString:@"vueloInternacional"] +
                                            [self evaluateTag:_trpTF.tag FromString:@"trp"] +
                                            [self evaluateTag:_comandoYControlTF.tag FromString:@"comandoYControl"] +
                                            [self evaluateTag:_inteligenciaTecnicaTF.tag FromString:@"inteligenciaTecnica"] +
                                            [self evaluateTag:_medevacTF.tag FromString:@"medevac"] +
                                            [self evaluateTag:_paracaidismoTF.tag FromString:@"paracaidismo"]];
    
    int contadorCondicionDePista1 = 0;
    int contadorCondicionDePista2 = 0;
    int contadorCondicionDePista3 = 0;
    
    if (_cpSC1.selectedSegmentIndex==0) {
        contadorCondicionDePista1 = [self evaluateTag:_secaTF.tag FromString:@"seca"];
    }
    else if (_cpSC1.selectedSegmentIndex==1) {
        contadorCondicionDePista1 = [self evaluateTag:_humedaTF.tag FromString:@"humeda"];
    }
    else if (_cpSC1.selectedSegmentIndex==2) {
        contadorCondicionDePista1 = [self evaluateTag:_noPreparadaTF.tag FromString:@"noPreparada"];
    }
    
    if (_cpSC2.selectedSegmentIndex==0) {
        contadorCondicionDePista2 = [self evaluateTag:_combustibleTF.tag FromString:@"combustible"];
    }
    else if (_cpSC2.selectedSegmentIndex==1) {
        contadorCondicionDePista2 = [self evaluateTag:_sinCombustibleTF.tag FromString:@"sinCombustible"];
    }
    
    if (_cpSC3.selectedSegmentIndex==0) {
        contadorCondicionDePista3 = [self evaluateTag:_atcTF.tag FromString:@"atc"];
    }
    else if (_cpSC3.selectedSegmentIndex==1) {
        contadorCondicionDePista3 = [self evaluateTag:_sinAtcTF.tag FromString:@"sinAtc"];
    }
    
    _condicionDeLaPistaTotalLabel.text = [NSString stringWithFormat:@"%i", contadorCondicionDePista1+contadorCondicionDePista2+contadorCondicionDePista3];
    
    
    if (_rendimientoDeTripulacionSC.selectedSegmentIndex==0) {
        _rendimientoDeLaTripulacionTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_adecuadoTF.tag FromString:@"adecuado"]];
    }
    else if (_rendimientoDeTripulacionSC.selectedSegmentIndex==1) {
        _rendimientoDeLaTripulacionTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_noAdecuadoTF.tag FromString:@"noAdecuado"]];
    }
    
    _tipoDeAeronaveTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:_tipoDeAeronaveTF.tag FromString:@"tipoDeAeronave"]];
    
    int amenazaTotalInt = [_amenazaTotalLabel.text intValue];
    int supervisionTotalInt = [_supervisionTotalLabel.text intValue];
    int planeamientoTotalInt = [_planeamientoTotalLabel.text intValue];
    int nivelDePericiaTotalint = [_nivelDePericiaTotalLabel.text intValue];
    int condicionesMeteorologicasTotalInt = [_condicionesMeteorologicasTotalLabel.text intValue];
    int complejidaddeLaMisionTotalInt = [_complejidadDeLaMisionTotalLabel.text intValue];
    int condicionDeLaPistaTotalInt = [_condicionDeLaPistaTotalLabel.text intValue];
    int tipoDeAeronaveTotalInt = [_tipoDeAeronaveTotalLabel.text intValue];
    int rendimientoDeLaTripulacionTotalInt = [_rendimientoDeLaTripulacionTotalLabel.text intValue];
    
    int total = amenazaTotalInt+
                supervisionTotalInt+
                planeamientoTotalInt+
                nivelDePericiaTotalint+
                condicionesMeteorologicasTotalInt+
                complejidaddeLaMisionTotalInt+
                condicionDeLaPistaTotalInt+
                tipoDeAeronaveTotalInt+
                rendimientoDeLaTripulacionTotalInt;
    
    _totalLabel.text = [NSString stringWithFormat:@"%i",total];
    
    if (_situacionEnemigaTF.tag == 0 ||
        _personalOrganicoTF.tag + _personalAgredadoTF.tag == 0 ||
        _infoSuperficialTF.tag + _infoEspecificaTF.tag == 0 ||
        _pamDiasSinVolarTF.tag == 0 ||
        _pam60DiasTF.tag == 0 ||
        _pDiasSinVolarTF.tag == 0 ||
        _p60DiasTF.tag == 0 ||
        _tvDiasSinVolarTF.tag == 0 ||
        _tv60DiasTF.tag == 0 ||
        _cmSalidaTF.tag == 0 ||
        _cmDestinoTF.tag == 0 ||
        _transporteExplosivosTF.tag == 0 ||
        _movimientoAereoTF.tag == 0 ||
        _mantenimientoTF.tag == 0 ||
        _sostAviacionTF.tag == 0 ||
        _reconocimientoTF.tag == 0 ||
        _entrenamientoTF.tag == 0 ||
        _vueloInternacionalTF.tag == 0 ||
        _trpTF.tag == 0 ||
        _comandoYControlTF.tag == 0 ||
        _inteligenciaTecnicaTF.tag == 0 ||
        _medevacTF.tag == 0 ||
        _paracaidismoTF.tag == 0 ||
        _secaTF.tag + _humedaTF.tag + _noPreparadaTF.tag == 0 ||
        _combustibleTF.tag + _sinCombustibleTF.tag == 0 ||
        _atcTF.tag + _sinAtcTF.tag == 0 ||
        _adecuadoTF.tag + _noAdecuadoTF.tag == 0 ||
        _tipoDeAeronaveTF.tag == 0){
        
        _riesgoLabel.text = @"···";
        _riesgoLabel2.text = @"···";
    }
    else{
        if (total<38) {
            _riesgoLabel.text = @"BAJO";
            _riesgoLabel2.text = @"BAJO";
        }
        else if (total>=38 && total<55) {
            _riesgoLabel.text = @"MEDIO";
            _riesgoLabel2.text = @"MEDIO";
        }
        else if (total>=55) {
            _riesgoLabel.text = @"ALTO";
            _riesgoLabel2.text = @"ALTO";
        }
       
    }
    
}
-(int)evaluateTag:(int)tag FromString:(NSString*)string{
    int result = 0;
    if ([string isEqualToString:@"situacionEnemiga"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"personalOrganico"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 1;
        }
        else if (tag == 3) {
            result = 2;
        }
    }
    else if ([string isEqualToString:@"personalAgredado"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"infoSuperficial"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"infoEspecifica"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"pamDiasSinVolar"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 7;
        }
    }
    else if ([string isEqualToString:@"pam60Dias"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"pDiasSinVolar"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 7;
        }
    }
    else if ([string isEqualToString:@"p60Dias"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"tvDiasSinVolar"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 7;
        }
    }
    else if ([string isEqualToString:@"tv60Dias"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"cmSalida"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 1;
        }
        else if (tag == 3) {
            result = 2;
        }
        else if (tag == 4) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"cmDestino"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"transporteExplosivos"]) {
        if (tag == 1) {
            result =9;
        }
        else if (tag == 2) {
            result = 10;
        }
        else if (tag == 3) {
            result = 10;
        }
    }
    else if ([string isEqualToString:@"reconocimiento"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"comandoYControl"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 2;
        }
    }
    else if ([string isEqualToString:@"movimientoAereo"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 2;
        }
    }
    else if ([string isEqualToString:@"sostAviacion"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 2;
        }
    }
    else if ([string isEqualToString:@"inteligenciaTecnica"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 6;
        }
        else if (tag == 3) {
            result = 6;
        }
    }
    else if ([string isEqualToString:@"mantenimiento"]) {
        if (tag == 1) {
            result =4;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"vueloInternacional"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"medevac"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"entrenamiento"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"trp"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"paracaidismo"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 6;
        }
        else if (tag == 3) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"seca"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"humeda"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"noPreparada"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 6;
        }
    }
    else if ([string isEqualToString:@"atc"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"sinAtc"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"combustible"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"sinCombustible"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"adecuado"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 7;
        }
    }
    else if ([string isEqualToString:@"noAdecuado"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 5;
        }
        else if (tag == 3) {
            result = 6;
        }
    }
    else if ([string isEqualToString:@"tipoDeAeronave"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 1;
        }
    }
    return result;
}
#pragma mark - Cargar Listas
-(void)cargarListasEnArreglos{
    /////////////////////////
    //Inicializa listas fijas
    /////////////////////////
    listaAmenaza = [ListasFijas listaAmenazaAlaFija];
    listaSupervision = [ListasFijas listaSupervisionAlaFija];
    listaPlaneamiento = [ListasFijas listaPlaneamientoAlaFija];
    listaDias = [ListasFijas listaDiasAlaFija];
    listaHoras = [ListasFijas listaHorasAlaFija];
    listaSalidaDestino = [ListasFijas listaSalidaDestinoAlaFija];
    listaComplejidadDeLaMision = [ListasFijas listaComplejidadDeLaMisionAlaFija];
    listaCondicionDePista = [ListasFijas listaCondicionDePistaAlaFija];
    listaRendimientoTripulacion = [ListasFijas listaRendimientoTripulacionAlaFija];
    listaTipoAeronave = [ListasFijas listaTipoAeronaveAlaFija];
    /////////////////////////
    /////////////////////////
    /////////////////////////
}

#pragma mark - SegmentedControl Actions and Related Functions
- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender {
    NSLog(@"[RiesgoAlaFija] SupervisionSCChanged to: %i for tag: %ld",sender.selectedSegmentIndex, (long)sender.tag);
    [self dismissInputView];
    //Tag 200 SupervisionSC
    if (sender.tag == 200) {
        if (sender.selectedSegmentIndex == 0) {
            self.personalOrganicoTF.hidden = NO;
            self.personalAgredadoTF.hidden = YES;
            self.personalAgredadoTF.text = @"";
            self.personalAgredadoTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.personalOrganicoTF.hidden = YES;
            self.personalOrganicoTF.text = @"";
            self.personalOrganicoTF.tag = 0;
            self.personalAgredadoTF.hidden = NO;
        }
        
    }
    //Tag 201 PlaneamientoSC
    else if (sender.tag == 201) {
        if (sender.selectedSegmentIndex == 0) {
            self.infoSuperficialTF.hidden = NO;
            self.infoEspecificaTF.hidden = YES;
            self.infoEspecificaTF.text = @"";
            self.infoEspecificaTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.infoSuperficialTF.hidden = YES;
            self.infoSuperficialTF.text = @"";
            self.infoSuperficialTF.tag = 0;
            self.infoEspecificaTF.hidden = NO;
        }
    }
    //Tag 202 CPSC1
    else if (sender.tag == 202) {
        if (sender.selectedSegmentIndex == 0) {
            self.secaTF.hidden = NO;
            self.humedaTF.hidden = YES;
            self.humedaTF.text = @"";
            self.humedaTF.tag = 0;
            self.noPreparadaTF.hidden = YES;
            self.noPreparadaTF.text = @"";
            self.noPreparadaTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.secaTF.hidden = YES;
            self.secaTF.text = @"";
            self.secaTF.tag = 0;
            self.humedaTF.hidden = NO;
            self.noPreparadaTF.hidden = YES;
            self.noPreparadaTF.text = @"";
            self.noPreparadaTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 2) {
            self.secaTF.hidden = YES;
            self.secaTF.text = @"";
            self.secaTF.tag = 0;
            self.humedaTF.hidden = YES;
            self.humedaTF.text = @"";
            self.humedaTF.tag = 0;
            self.noPreparadaTF.hidden = NO;
        }
    }
    //Tag 203 CPSC2
    else if (sender.tag == 203) {
        if (sender.selectedSegmentIndex == 0) {
            self.combustibleTF.hidden = NO;
            self.sinCombustibleTF.hidden = YES;
            self.sinCombustibleTF.text = @"";
            self.sinCombustibleTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.combustibleTF.hidden = YES;
            self.combustibleTF.text = @"";
            self.combustibleTF.tag = 0;
            self.sinCombustibleTF.hidden = NO;
        }
    }
    //Tag 204 CPSC3
    else if (sender.tag == 204) {
        if (sender.selectedSegmentIndex == 0) {
            self.atcTF.hidden = NO;
            self.sinAtcTF.hidden = YES;
            self.sinAtcTF.text = @"";
            self.sinAtcTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.atcTF.hidden = YES;
            self.atcTF.text = @"";
            self.atcTF.tag = 0;
            self.sinAtcTF.hidden = NO;
        }
    }
    //Tag 205 RendimientoDeTripulacionSC
    else if (sender.tag == 205) {
        if (sender.selectedSegmentIndex == 0) {
            self.adecuadoTF.hidden = NO;
            self.noAdecuadoTF.hidden = YES;
            self.noAdecuadoTF.text = @"";
            self.noAdecuadoTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.adecuadoTF.hidden = YES;
            self.adecuadoTF.text = @"";
            self.adecuadoTF.tag = 0;
            self.noAdecuadoTF.hidden = NO;
        }
    }
    
    [self updateLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    //listaAmenaza;
    if (pickerView.tag == 9000) {
        return listaAmenaza.count;
    }
    
    //listaSupervision;
    else if (pickerView.tag == 9001) {
        return listaSupervision.count;
    }
    
    //listaPlaneamiento;
    else if (pickerView.tag == 9002) {
        return listaPlaneamiento.count;
    }
    
    //listaDias;
    else if (pickerView.tag == 9003) {
        return listaDias.count;
    }
    
    //listaHoras;
    else if (pickerView.tag == 9004) {
        return listaHoras.count;
    }
    
    //listaSalidaDestino;
    else if (pickerView.tag == 9005) {
        return listaSalidaDestino.count;
    }
    
    //listaComplejidadDeLaMision;
    else if (pickerView.tag == 9006) {
        return listaComplejidadDeLaMision.count;
    }
    
    //listaCondicionDePista;
    else if (pickerView.tag == 9007) {
        return listaCondicionDePista.count;
    }
    
    //listaRendimientoTripulacion;
    else if (pickerView.tag == 9008) {
        return listaRendimientoTripulacion.count;
    }
    
    //listaTipoAeronave;
    else if (pickerView.tag == 9009) {
        return listaTipoAeronave.count;
    }
    return 0;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //    listaAmenaza;
    if (pickerView.tag == 9000) {
        return [listaAmenaza[row] objectForKey:@"name"];
    }
    //    listaSupervision;
    else if (pickerView.tag == 9001) {
        return [listaSupervision[row] objectForKey:@"name"];
    }
    //    listaPlaneamiento;
    else if (pickerView.tag == 9002) {
        return [listaPlaneamiento[row] objectForKey:@"name"];
    }
    //    listaDias;
    else if (pickerView.tag == 9003) {
        return [listaDias[row] objectForKey:@"name"];
    }
    //    listaHoras;
    else if (pickerView.tag == 9004) {
        return [listaHoras[row] objectForKey:@"name"];
    }
    //    listaSalidaDestino;
    else if (pickerView.tag == 9005) {
        return [listaSalidaDestino[row] objectForKey:@"name"];
    }
    //    listaComplejidadDeLaMision;
    else if (pickerView.tag == 9006) {
        return [listaComplejidadDeLaMision[row] objectForKey:@"name"];
    }
    //    listaCondicionDePista;
    else if (pickerView.tag == 9007) {
        return [listaCondicionDePista[row] objectForKey:@"name"];
    }
    //    listaRendimientoTripulacion;
    else if (pickerView.tag == 9008) {
        return [listaRendimientoTripulacion[row] objectForKey:@"name"];
    }
    //    listaTipoAeronave;
    else if (pickerView.tag == 9009) {
        return [listaTipoAeronave[row] objectForKey:@"name"];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //    listaAmenaza;
    if (pickerView.tag == 9000) {
        currentTextField.text = [listaAmenaza[row] objectForKey:@"name"];
        currentTextField.tag = [[listaAmenaza[row] objectForKey:@"value"] doubleValue];
    }
    //    listaSupervision;
    else if (pickerView.tag == 9001) {
        currentTextField.text = [listaSupervision[row] objectForKey:@"name"];
        currentTextField.tag = [[listaSupervision[row] objectForKey:@"value"] doubleValue];
    }
    //    listaPlaneamiento;
    else if (pickerView.tag == 9002) {
        currentTextField.text = [listaPlaneamiento[row] objectForKey:@"name"];
        currentTextField.tag = [[listaPlaneamiento[row] objectForKey:@"value"] doubleValue];
    }
    //    listaDias;
    else if (pickerView.tag == 9003) {
        currentTextField.text = [listaDias[row] objectForKey:@"name"];
        currentTextField.tag = [[listaDias[row] objectForKey:@"value"] doubleValue];
    }
    //    listaHoras;
    else if (pickerView.tag == 9004) {
        currentTextField.text = [listaHoras[row] objectForKey:@"name"];
        currentTextField.tag = [[listaHoras[row] objectForKey:@"value"] doubleValue];
    }
    //    listaSalidaDestino;
    else if (pickerView.tag == 9005) {
        currentTextField.text = [listaSalidaDestino[row] objectForKey:@"name"];
        currentTextField.tag = [[listaSalidaDestino[row] objectForKey:@"value"] doubleValue];
    }
    //    listaComplejidadDeLaMision;
    else if (pickerView.tag == 9006) {
        currentTextField.text = [listaComplejidadDeLaMision[row] objectForKey:@"name"];
        currentTextField.tag = [[listaComplejidadDeLaMision[row] objectForKey:@"value"] doubleValue];
    }
    //    listaCondicionDePista;
    else if (pickerView.tag == 9007) {
        currentTextField.text = [listaCondicionDePista[row] objectForKey:@"name"];
        currentTextField.tag = [[listaCondicionDePista[row] objectForKey:@"value"] doubleValue];
    }
    //    listaRendimientoTripulacion;
    else if (pickerView.tag == 9008) {
        currentTextField.text = [listaRendimientoTripulacion[row] objectForKey:@"name"];
        currentTextField.tag = [[listaRendimientoTripulacion[row] objectForKey:@"value"] doubleValue];
    }
    //    listaTipoAeronave;
    else if (pickerView.tag == 9009) {
        currentTextField.text = [listaTipoAeronave[row] objectForKey:@"name"];
        currentTextField.tag = [[listaTipoAeronave[row] objectForKey:@"value"] doubleValue];
    }
    
    //overlayLabel.text = currentTextField.text;
    return;
}

#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    currentTextField = textField;
    
    currentPicker = (UIPickerView*)currentTextField.inputView;
    NSInteger index = 0;
    NSArray *array;
    if (currentPicker.tag == 9000) {
        array = [listaAmenaza valueForKey:@"name"];
        assert(listaAmenaza.count == array.count);
    }
    else if (currentPicker.tag == 9001) {
        array = [listaSupervision valueForKey:@"name"];
        assert(listaSupervision.count == array.count);
    }
    else if (currentPicker.tag == 9002) {
        array = [listaPlaneamiento valueForKey:@"name"];
        assert(listaPlaneamiento.count == array.count);
    }
    else if (currentPicker.tag == 9003) {
        array = [listaDias valueForKey:@"name"];
        assert(listaDias.count == array.count);
    }
    else if (currentPicker.tag == 9004) {
        array = [listaHoras valueForKey:@"name"];
        assert(listaHoras.count == array.count);
    }
    else if (currentPicker.tag == 9005) {
        array = [listaSalidaDestino valueForKey:@"name"];
        assert(listaSalidaDestino.count == array.count);
    }
    else if (currentPicker.tag == 9006) {
        array = [listaComplejidadDeLaMision valueForKey:@"name"];
        assert(listaComplejidadDeLaMision.count == array.count);
    }
    
    index=[array indexOfObject:currentTextField.text];
    
    if(index != NSNotFound ){
        [currentPicker selectRow:index inComponent:0 animated:YES];
    }
    else{
        [currentPicker selectRow:0 inComponent:0 animated:YES];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self updateLabels];
}
- (void)textFieldDidChange:(UITextField *)textField{
    //overlayLabel.text = currentTextField.text;
}
@end
