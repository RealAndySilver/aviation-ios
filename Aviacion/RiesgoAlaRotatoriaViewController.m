//
//  AlaRotatoriaViewController.m
//  Aviacion
//
//  Created by Andres Abril on 14/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "RiesgoAlaRotatoriaViewController.h"

@interface RiesgoAlaRotatoriaViewController (){

    NSMutableArray *listaAmenazaAlaRotatoria;
    NSMutableArray *listaSupervisionAlaRotatoria;
    NSMutableArray *listaPlaneamientoAlaRotatoria;
    NSMutableArray *listaDiasDisponibilidadDeVueloAlaRotatoria;
    NSMutableArray *listaExperienciaPAMAlaRotatoria;
    NSMutableArray *listaExperienciaPAlaRotatoria;
    NSMutableArray *listaExperienciaTripulanteAdicionalAlaRotatoria;
    NSMutableArray *listaDiasSinRealisarElMismoTipoAlaRotatoria;
    NSMutableArray *listaRendimientoTripulacionAlaRotatoria;
    NSMutableArray *listaCondicionesMeteorologicasAlaRotatoria;
    NSMutableArray *listaComplejidadAlaRotatoria;
    NSMutableArray *listaFactoresGeograficosAlaRotatoria;
    NSMutableArray *listaSeleccionAlaRotatoria;
    NSMutableArray *listaPorcentajeIluminacionAlaRotatoria;
    NSMutableArray *listaAnguloLunaAlaRotatoria;
    
    //Pickers
    UIPickerView *pickerAmenazaAlaRotatoria;
    UIPickerView *pickerSupervisionAlaRotatoria;
    UIPickerView *pickerPlaneamientoAlaRotatoria;
    UIPickerView *pickerDiasDisponibilidadDeVueloAlaRotatoria;
    UIPickerView *pickerExperienciaPAMAlaRotatoria;
    UIPickerView *pickerExperienciaPAlaRotatoria;
    UIPickerView *pickerExperienciaTripulanteAdicionalAlaRotatoria;
    UIPickerView *pickerDiasSinRealisarElMismoTipoAlaRotatoria;
    UIPickerView *pickerRendimientoTripulacionAlaRotatoria;
    UIPickerView *pickerCondicionesMeteorologicasAlaRotatoria;
    UIPickerView *pickerComplejidadAlaRotatoria;
    UIPickerView *pickerFactoresGeograficosAlaRotatoria;
    UIPickerView *pickerSeleccionAlaRotatoria;
    UIPickerView *pickerPorcentajeIluminacionAlaRotatoria;
    UIPickerView *pickerAnguloLunaAlaRotatoria;
    
    //Current textfield & current picker
    UITextField *currentTextField;
    UIPickerView *currentPicker;
}

@end

@implementation RiesgoAlaRotatoriaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Riesgo Ala Rotatoria";
    [self cargarListasEnArreglos];
    [self setAllPickers];
    [self setAllTextFields];
    self.mainScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mainScrollView.contentSize=CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height*2.35);
    [self.mainScrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:self.mainScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Cargar Listas
-(void)cargarListasEnArreglos{
    /////////////////////////
    //Inicializa listas fijas
    /////////////////////////
    listaAmenazaAlaRotatoria = [ListasFijas listaAmenazaAlaRotatoria];
    listaSupervisionAlaRotatoria = [ListasFijas listaSupervisionAlaRotatoria];
    listaPlaneamientoAlaRotatoria = [ListasFijas listaPlaneamientoAlaRotatoria];
    listaDiasDisponibilidadDeVueloAlaRotatoria = [ListasFijas listaDiasDisponibilidadDeVueloAlaRotatoria];
    listaExperienciaPAMAlaRotatoria = [ListasFijas listaExperienciaPAMAlaRotatoria];
    listaExperienciaPAlaRotatoria = [ListasFijas listaExperienciaPAMAlaRotatoria];
    listaExperienciaTripulanteAdicionalAlaRotatoria = [ListasFijas listaExperienciaTripulanteAdicionalAlaRotatoria];
    listaDiasSinRealisarElMismoTipoAlaRotatoria = [ListasFijas listaDiasSinRealisarElMismoTipoAlaRotatoria];
    listaRendimientoTripulacionAlaRotatoria = [ListasFijas listaRendimientoTripulacionAlaRotatoria];
    listaCondicionesMeteorologicasAlaRotatoria = [ListasFijas listaCondicionesMeteorologicasAlaRotatoria];
    listaComplejidadAlaRotatoria = [ListasFijas listaComplejidadAlaRotatoria];
    listaFactoresGeograficosAlaRotatoria = [ListasFijas listaFactoresGeograficosAlaRotatoria];
    listaSeleccionAlaRotatoria = [ListasFijas listaSeleccionAlaRotatoria];
    listaPorcentajeIluminacionAlaRotatoria = [ListasFijas listaPorcentajeIluminacionAlaRotatoria];
    listaAnguloLunaAlaRotatoria = [ListasFijas listaAnguloLunaAlaRotatoria];
    /////////////////////////
    /////////////////////////
    /////////////////////////
}
#pragma mark - set pickers
-(void)setAllPickers{
    pickerAmenazaAlaRotatoria = [self createPickerWithTag:7001];
    pickerSupervisionAlaRotatoria = [self createPickerWithTag:7002];
    pickerPlaneamientoAlaRotatoria = [self createPickerWithTag:7003];
    pickerDiasDisponibilidadDeVueloAlaRotatoria = [self createPickerWithTag:7004];
    pickerExperienciaPAMAlaRotatoria = [self createPickerWithTag:7005];
    pickerExperienciaPAlaRotatoria = [self createPickerWithTag:7006];
    pickerExperienciaTripulanteAdicionalAlaRotatoria = [self createPickerWithTag:7007];
    pickerDiasSinRealisarElMismoTipoAlaRotatoria = [self createPickerWithTag:7008];
    pickerRendimientoTripulacionAlaRotatoria = [self createPickerWithTag:7009];
    pickerCondicionesMeteorologicasAlaRotatoria = [self createPickerWithTag:7010];
    pickerComplejidadAlaRotatoria = [self createPickerWithTag:7011];
    pickerFactoresGeograficosAlaRotatoria = [self createPickerWithTag:7012];
    pickerSeleccionAlaRotatoria = [self createPickerWithTag:7013];
    pickerPorcentajeIluminacionAlaRotatoria = [self createPickerWithTag:7014];
    pickerAnguloLunaAlaRotatoria = [self createPickerWithTag:7015];
}
-(UIPickerView*)createPickerWithTag:(double)tag{
    UIPickerView *picker=[[UIPickerView alloc]init];
    picker.dataSource=self;
    picker.delegate=self;
    picker.showsSelectionIndicator = YES;
    picker.tag=tag;
    return picker;
}
#pragma mark - Picker delegate
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    //listaAmenazaAlaRotatoria;
    if (pickerView.tag == 7001) {
        return listaAmenazaAlaRotatoria.count;
    }
    
    //listaSupervisionAlaRotatoria;
    else if (pickerView.tag == 7002) {
        return listaSupervisionAlaRotatoria.count;
    }
    
    //listaPlaneamientoAlaRotatoria;
    else if (pickerView.tag == 7003) {
        return listaPlaneamientoAlaRotatoria.count;
    }
    
    //listaDiasDisponibilidadDeVueloAlaRotatoria;
    else if (pickerView.tag == 7004) {
        return listaDiasDisponibilidadDeVueloAlaRotatoria.count;
    }
    
    //listaExperienciaPAMAlaRotatoria;
    else if (pickerView.tag == 7005) {
        return listaExperienciaPAMAlaRotatoria.count;
    }
    
    //listaExperienciaPAlaRotatoria;
    else if (pickerView.tag == 7006) {
        return listaExperienciaPAlaRotatoria.count;
    }
    
    //listaExperienciaTripulanteAdicionalAlaRotatoria;
    else if (pickerView.tag == 7007) {
        return listaExperienciaTripulanteAdicionalAlaRotatoria.count;
    }
    
    //listaDiasSinRealisarElMismoTipoAlaRotatoria;
    else if (pickerView.tag == 7008) {
        return listaDiasSinRealisarElMismoTipoAlaRotatoria.count;
    }
    
    //listaRendimientoTripulacionAlaRotatoria;
    else if (pickerView.tag == 7009) {
        return listaRendimientoTripulacionAlaRotatoria.count;
    }
    
    //listaCondicionesMeteorologicasAlaRotatoria;
    else if (pickerView.tag == 7010) {
        return listaCondicionesMeteorologicasAlaRotatoria.count;
    }
    
    //listaComplejidadAlaRotatoria;
    else if (pickerView.tag == 7011) {
        return listaComplejidadAlaRotatoria.count;
    }
    
    //listaFactoresGeograficosAlaRotatoria;
    else if (pickerView.tag == 7012) {
        return listaFactoresGeograficosAlaRotatoria.count;
    }
    
    //listaSeleccionAlaRotatoria;
    else if (pickerView.tag == 7013) {
        return listaSeleccionAlaRotatoria.count;
    }
    
    //listaPorcentajeIluminacionAlaRotatoria;
    else if (pickerView.tag == 7014) {
        return listaPorcentajeIluminacionAlaRotatoria.count;
    }
    
    //listaAnguloLunaAlaRotatoria;
    else if (pickerView.tag == 7015) {
        return listaAnguloLunaAlaRotatoria.count;
    }
    return 0;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //listaAmenazaAlaRotatoria;
    if (pickerView.tag == 7001) {
        return [listaAmenazaAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaSupervisionAlaRotatoria;
    else if (pickerView.tag == 7002) {
        return [listaSupervisionAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaPlaneamientoAlaRotatoria;
    else if (pickerView.tag == 7003) {
        return [listaPlaneamientoAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaDiasDisponibilidadDeVueloAlaRotatoria;
    else if (pickerView.tag == 7004) {
        return [listaDiasDisponibilidadDeVueloAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaExperienciaPAMAlaRotatoria;
    else if (pickerView.tag == 7005) {
        return [listaExperienciaPAMAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaExperienciaPAlaRotatoria;
    else if (pickerView.tag == 7006) {
        return [listaExperienciaPAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaExperienciaTripulanteAdicionalAlaRotatoria;
    else if (pickerView.tag == 7007) {
        return [listaExperienciaTripulanteAdicionalAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaDiasSinRealisarElMismoTipoAlaRotatoria;
    else if (pickerView.tag == 7008) {
        return [listaDiasSinRealisarElMismoTipoAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaRendimientoTripulacionAlaRotatoria;
    else if (pickerView.tag == 7009) {
        return [listaRendimientoTripulacionAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaCondicionesMeteorologicasAlaRotatoria;
    else if (pickerView.tag == 7010) {
        return [listaCondicionesMeteorologicasAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaComplejidadAlaRotatoria;
    else if (pickerView.tag == 7011) {
        return [listaComplejidadAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaFactoresGeograficosAlaRotatoria;
    else if (pickerView.tag == 7012) {
        return [listaFactoresGeograficosAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaSeleccionAlaRotatoria;
    else if (pickerView.tag == 7013) {
        return [listaSeleccionAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaPorcentajeIluminacionAlaRotatoria;
    else if (pickerView.tag == 7014) {
        return [listaPorcentajeIluminacionAlaRotatoria[row] objectForKey:@"name"];
    }
    
    //listaAnguloLunaAlaRotatoria;
    else if (pickerView.tag == 7015) {
        return [listaAnguloLunaAlaRotatoria[row] objectForKey:@"name"];
    }

    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //    listaAmenazaAlaRotatoria;
    if (pickerView.tag == 7001) {
        currentTextField.text = [listaAmenazaAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaAmenazaAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaSupervisionAlaRotatoria;
    else if (pickerView.tag == 7002) {
        currentTextField.text = [listaSupervisionAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaSupervisionAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaPlaneamientoAlaRotatoria;
    else if (pickerView.tag == 7003) {
        currentTextField.text = [listaPlaneamientoAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaPlaneamientoAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaDiasDisponibilidadDeVueloAlaRotatoria;
    else if (pickerView.tag == 7004) {
        currentTextField.text = [listaDiasDisponibilidadDeVueloAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaDiasDisponibilidadDeVueloAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaExperienciaPAMAlaRotatoria;
    else if (pickerView.tag == 7005) {
        currentTextField.text = [listaExperienciaPAMAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaExperienciaPAMAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaExperienciaPAlaRotatoria;
    else if (pickerView.tag == 7006) {
        currentTextField.text = [listaExperienciaPAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaExperienciaPAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaExperienciaTripulanteAdicionalAlaRotatoria;
    else if (pickerView.tag == 7007) {
        currentTextField.text = [listaExperienciaTripulanteAdicionalAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaExperienciaTripulanteAdicionalAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaDiasSinRealisarElMismoTipoAlaRotatoria;
    else if (pickerView.tag == 7008) {
        currentTextField.text = [listaDiasSinRealisarElMismoTipoAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaDiasSinRealisarElMismoTipoAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaRendimientoTripulacionAlaRotatoria;
    else if (pickerView.tag == 7009) {
        currentTextField.text = [listaRendimientoTripulacionAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaRendimientoTripulacionAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaCondicionesMeteorologicasAlaRotatoria;
    else if (pickerView.tag == 7010) {
        currentTextField.text = [listaCondicionesMeteorologicasAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaCondicionesMeteorologicasAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaComplejidadAlaRotatoria;
    else if (pickerView.tag == 7011) {
        currentTextField.text = [listaComplejidadAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaComplejidadAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaFactoresGeograficosAlaRotatoria;
    else if (pickerView.tag == 7012) {
        currentTextField.text = [listaFactoresGeograficosAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaFactoresGeograficosAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaSeleccionAlaRotatoria;
    else if (pickerView.tag == 7013) {
        currentTextField.text = [listaSeleccionAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaSeleccionAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaPorcentajeIluminacionAlaRotatoria;
    else if (pickerView.tag == 7014) {
        currentTextField.text = [listaPorcentajeIluminacionAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaPorcentajeIluminacionAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    //    listaAnguloLunaAlaRotatoria;
    else if (pickerView.tag == 7015) {
        currentTextField.text = [listaAnguloLunaAlaRotatoria[row] objectForKey:@"name"];
        currentTextField.tag = [[listaAnguloLunaAlaRotatoria[row] objectForKey:@"value"] doubleValue];
    }
    
    //overlayLabel.text = currentTextField.text;
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
    [self initPickerInput:pickerAmenazaAlaRotatoria onTF:self.amenazaTF withToolBar:toolBar];
    
    [self initPickerInput:pickerSupervisionAlaRotatoria onTF:self.personalOrganicoTF withToolBar:toolBar];
    [self initPickerInput:pickerSupervisionAlaRotatoria onTF:self.personalAgregadoTF withToolBar:toolBar];
    
    [self initPickerInput:pickerPlaneamientoAlaRotatoria onTF:self.infoSuperficialTF withToolBar:toolBar];
    [self initPickerInput:pickerPlaneamientoAlaRotatoria onTF:self.infoEspecificaTF withToolBar:toolBar];
    
    [self initPickerInput:pickerDiasDisponibilidadDeVueloAlaRotatoria onTF:self.diasDisponibilidadTF withToolBar:toolBar];
    
    [self initPickerInput:pickerExperienciaPAMAlaRotatoria onTF:self.pam0a25TF withToolBar:toolBar];
    [self initPickerInput:pickerExperienciaPAMAlaRotatoria onTF:self.pam25a50TF withToolBar:toolBar];
    [self initPickerInput:pickerExperienciaPAMAlaRotatoria onTF:self.pamMasDe505TF withToolBar:toolBar];
    
    [self initPickerInput:pickerExperienciaPAlaRotatoria onTF:self.p0a25TF withToolBar:toolBar];
    [self initPickerInput:pickerExperienciaPAlaRotatoria onTF:self.p25a50TF withToolBar:toolBar];
    [self initPickerInput:pickerExperienciaPAlaRotatoria onTF:self.pMasDe505TF withToolBar:toolBar];
    
    [self initPickerInput:pickerExperienciaTripulanteAdicionalAlaRotatoria onTF:self.tripulante0a25TF withToolBar:toolBar];
    [self initPickerInput:pickerExperienciaTripulanteAdicionalAlaRotatoria onTF:self.tripulante25a50TF withToolBar:toolBar];
    [self initPickerInput:pickerExperienciaTripulanteAdicionalAlaRotatoria onTF:self.tripulanteMasDe505TF withToolBar:toolBar];
    
    [self initPickerInput:pickerDiasSinRealisarElMismoTipoAlaRotatoria onTF:self.diasSinRealizarMismoTipoTF withToolBar:toolBar];
    
    [self initPickerInput:pickerRendimientoTripulacionAlaRotatoria onTF:self.rendimientoTripAdecuadoTF withToolBar:toolBar];
    [self initPickerInput:pickerRendimientoTripulacionAlaRotatoria onTF:self.rendimientoTripNoAdecuadoTF withToolBar:toolBar];
    
    [self initPickerInput:pickerCondicionesMeteorologicasAlaRotatoria onTF:self.rendimientoTripDiaTF withToolBar:toolBar];
    [self initPickerInput:pickerCondicionesMeteorologicasAlaRotatoria onTF:self.rendimientoTripNocheTF withToolBar:toolBar];
    [self initPickerInput:pickerCondicionesMeteorologicasAlaRotatoria onTF:self.rendimientoTripLVN withToolBar:toolBar];
    
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.multiplesAeronavesTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.vueloInternacionalTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.aRasDeTierraTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.bajoNivelTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.cargaExternaTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.gruaRescateTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.rapelTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.asaltoAereoTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.apoyoDeFuegoTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.reconocimientoTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.seguridadTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.paracaidismoTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.casevacTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.recuperacionAeronavesTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.rescateRehenesTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.vueloVIPTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.diaTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.oneTimeFlightTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.movimientoAereoTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.reposicionamientoAeronavesTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.entrenamientoEmergenciasTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.vueloPruebaManttoTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.entrenamientoNOEmergenciasTF withToolBar:toolBar];
    [self initPickerInput:pickerComplejidadAlaRotatoria onTF:self.ceremoniasDemostracionesTF withToolBar:toolBar];
    
    [self initPickerInput:pickerFactoresGeograficosAlaRotatoria onTF:self.pam0a6000TF withToolBar:toolBar];
    [self initPickerInput:pickerFactoresGeograficosAlaRotatoria onTF:self.pam6001a10000TF withToolBar:toolBar];
    [self initPickerInput:pickerFactoresGeograficosAlaRotatoria onTF:self.pam10001a12000TF withToolBar:toolBar];
    [self initPickerInput:pickerFactoresGeograficosAlaRotatoria onTF:self.pamSobre12000TF withToolBar:toolBar];
    [self initPickerInput:pickerFactoresGeograficosAlaRotatoria onTF:self.aguaAMasDe10TF withToolBar:toolBar];
    [self initPickerInput:pickerFactoresGeograficosAlaRotatoria onTF:self.selvaTF withToolBar:toolBar];
    [self initPickerInput:pickerFactoresGeograficosAlaRotatoria onTF:self.terrenoPlanoTF withToolBar:toolBar];
    
    [self initPickerInput:pickerSeleccionAlaRotatoria onTF:self.seleccionPamTF withToolBar:toolBar];
    [self initPickerInput:pickerSeleccionAlaRotatoria onTF:self.seleccionPTF withToolBar:toolBar];
    [self initPickerInput:pickerSeleccionAlaRotatoria onTF:self.tripAdicionalTF withToolBar:toolBar];
    
    [self initPickerInput:pickerPorcentajeIluminacionAlaRotatoria onTF:self.porcentajeIluminacionTF withToolBar:toolBar];
    
    [self initPickerInput:pickerAnguloLunaAlaRotatoria onTF:self.anguloLunaPamTF withToolBar:toolBar];
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
#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    currentTextField = textField;
    
    currentPicker = (UIPickerView*)currentTextField.inputView;
    NSInteger index = 0;
    NSArray *array;
    
    
    if (currentPicker.tag == 7001) {
        array = [listaAmenazaAlaRotatoria valueForKey:@"name"];
        assert(listaAmenazaAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7002) {
        array = [listaSupervisionAlaRotatoria valueForKey:@"name"];
        assert(listaSupervisionAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7003) {
        array = [listaPlaneamientoAlaRotatoria valueForKey:@"name"];
        assert(listaPlaneamientoAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7004) {
        array = [listaExperienciaPAMAlaRotatoria valueForKey:@"name"];
        assert(listaExperienciaPAMAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7005) {
        array = [listaDiasDisponibilidadDeVueloAlaRotatoria valueForKey:@"name"];
        assert(listaDiasDisponibilidadDeVueloAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7006) {
        array = [listaExperienciaPAlaRotatoria valueForKey:@"name"];
        assert(listaExperienciaPAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7007) {
        array = [listaExperienciaTripulanteAdicionalAlaRotatoria valueForKey:@"name"];
        assert(listaExperienciaTripulanteAdicionalAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7008) {
        array = [listaDiasSinRealisarElMismoTipoAlaRotatoria valueForKey:@"name"];
        assert(listaDiasSinRealisarElMismoTipoAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7009) {
        array = [listaRendimientoTripulacionAlaRotatoria valueForKey:@"name"];
        assert(listaRendimientoTripulacionAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7010) {
        array = [listaCondicionesMeteorologicasAlaRotatoria valueForKey:@"name"];
        assert(listaCondicionesMeteorologicasAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7011) {
        array = [listaComplejidadAlaRotatoria valueForKey:@"name"];
        assert(listaComplejidadAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7012) {
        array = [listaFactoresGeograficosAlaRotatoria valueForKey:@"name"];
        assert(listaFactoresGeograficosAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7013) {
        array = [listaSeleccionAlaRotatoria valueForKey:@"name"];
        assert(listaSeleccionAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7014) {
        array = [listaPorcentajeIluminacionAlaRotatoria valueForKey:@"name"];
        assert(listaPorcentajeIluminacionAlaRotatoria.count == array.count);
    }
    else if (currentPicker.tag == 7015) {
        array = [listaAnguloLunaAlaRotatoria valueForKey:@"name"];
        assert(listaAnguloLunaAlaRotatoria.count == array.count);
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
#pragma mark - SegmentedControl Actions and Related Functions
- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender {
    NSLog(@"[RiesgoAlaFija] SupervisionSCChanged to: %li for tag: %ld",(long)sender.selectedSegmentIndex, (long)sender.tag);
    [self dismissInputView];
    //Tag 200 SupervisionSC
    if (sender.tag == 200) {
        if (sender.selectedSegmentIndex == 0) {
            self.personalOrganicoTF.hidden = NO;
            self.personalAgregadoTF.hidden = YES;
            self.personalAgregadoTF.text = @"";
            self.personalAgregadoTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.personalOrganicoTF.hidden = YES;
            self.personalOrganicoTF.text = @"";
            self.personalOrganicoTF.tag = 0;
            self.personalAgregadoTF.hidden = NO;
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
    //Tag 202 pamSC
    else if (sender.tag == 202) {
        if (sender.selectedSegmentIndex == 0) {
            self.pam0a25TF.hidden = NO;
            self.pam25a50TF.hidden = YES;
            self.pam25a50TF.text = @"";
            self.pam25a50TF.tag = 0;
            self.pamMasDe505TF.hidden = YES;
            self.pamMasDe505TF.text = @"";
            self.pamMasDe505TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.pam0a25TF.hidden = YES;
            self.pam0a25TF.text = @"";
            self.pam0a25TF.tag = 0;
            self.pam25a50TF.hidden = NO;
            self.pamMasDe505TF.hidden = YES;
            self.pamMasDe505TF.text = @"";
            self.pamMasDe505TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 2) {
            self.pam0a25TF.hidden = YES;
            self.pam0a25TF.text = @"";
            self.pam0a25TF.tag = 0;
            self.pam25a50TF.hidden = YES;
            self.pam25a50TF.text = @"";
            self.pam25a50TF.tag = 0;
            self.pamMasDe505TF.hidden = NO;
        }
    }
    //Tag 203 pSC
    else if (sender.tag == 203) {
        if (sender.selectedSegmentIndex == 0) {
            self.p0a25TF.hidden = NO;
            self.p25a50TF.hidden = YES;
            self.p25a50TF.text = @"";
            self.p25a50TF.tag = 0;
            self.pMasDe505TF.hidden = YES;
            self.pMasDe505TF.text = @"";
            self.pMasDe505TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.p0a25TF.hidden = YES;
            self.p0a25TF.text = @"";
            self.p0a25TF.tag = 0;
            self.p25a50TF.hidden = NO;
            self.pMasDe505TF.hidden = YES;
            self.pMasDe505TF.text = @"";
            self.pMasDe505TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 2) {
            self.p0a25TF.hidden = YES;
            self.p0a25TF.text = @"";
            self.p0a25TF.tag = 0;
            self.p25a50TF.hidden = YES;
            self.p25a50TF.text = @"";
            self.p25a50TF.tag = 0;
            self.pMasDe505TF.hidden = NO;
        }
    }
    //Tag 204 tripulanteSC
    else if (sender.tag == 204) {
        if (sender.selectedSegmentIndex == 0) {
            self.tripulante0a25TF.hidden = NO;
            self.tripulante25a50TF.hidden = YES;
            self.tripulante25a50TF.text = @"";
            self.tripulante25a50TF.tag = 0;
            self.tripulanteMasDe505TF.hidden = YES;
            self.tripulanteMasDe505TF.text = @"";
            self.tripulanteMasDe505TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.tripulante0a25TF.hidden = YES;
            self.tripulante0a25TF.text = @"";
            self.tripulante0a25TF.tag = 0;
            self.tripulante25a50TF.hidden = NO;
            self.tripulanteMasDe505TF.hidden = YES;
            self.tripulanteMasDe505TF.text = @"";
            self.tripulanteMasDe505TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 2) {
            self.tripulante0a25TF.hidden = YES;
            self.tripulante0a25TF.text = @"";
            self.tripulante0a25TF.tag = 0;
            self.tripulante25a50TF.hidden = YES;
            self.tripulante25a50TF.text = @"";
            self.tripulante25a50TF.tag = 0;
            self.tripulanteMasDe505TF.hidden = NO;
        }
    }
    //Tag 205 RendimientoDeTripulacionSC
    else if (sender.tag == 205) {
        if (sender.selectedSegmentIndex == 0) {
            self.rendimientoTripAdecuadoTF.hidden = NO;
            self.rendimientoTripNoAdecuadoTF.hidden = YES;
            self.rendimientoTripNoAdecuadoTF.text = @"";
            self.rendimientoTripNoAdecuadoTF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.rendimientoTripAdecuadoTF.hidden = YES;
            self.rendimientoTripAdecuadoTF.text = @"";
            self.rendimientoTripAdecuadoTF.tag = 0;
            self.rendimientoTripNoAdecuadoTF.hidden = NO;
        }
    }
    //Tag 205 factoresSC
    else if (sender.tag == 206) {
        if (sender.selectedSegmentIndex == 0) {
            self.pam0a6000TF.hidden = NO;
            self.pam6001a10000TF.hidden = YES;
            self.pam6001a10000TF.text = @"";
            self.pam6001a10000TF.tag = 0;
            self.pam10001a12000TF.hidden = YES;
            self.pam10001a12000TF.text = @"";
            self.pam10001a12000TF.tag = 0;
            self.pamSobre12000TF.hidden = YES;
            self.pamSobre12000TF.text = @"";
            self.pamSobre12000TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.pam0a6000TF.hidden = YES;
            self.pam0a6000TF.text = @"";
            self.pam0a6000TF.tag = 0;
            self.pam6001a10000TF.hidden = NO;
            self.pam10001a12000TF.hidden = YES;
            self.pam10001a12000TF.text = @"";
            self.pam10001a12000TF.tag = 0;
            self.pamSobre12000TF.hidden = YES;
            self.pamSobre12000TF.text = @"";
            self.pamSobre12000TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 2) {
            self.pam0a6000TF.hidden = YES;
            self.pam0a6000TF.text = @"";
            self.pam0a6000TF.tag = 0;
            self.pam6001a10000TF.hidden = YES;
            self.pam6001a10000TF.text = @"";
            self.pam6001a10000TF.tag = 0;
            self.pam10001a12000TF.hidden = NO;
            self.pamSobre12000TF.hidden = YES;
            self.pamSobre12000TF.text = @"";
            self.pamSobre12000TF.tag = 0;
        }
        else if (sender.selectedSegmentIndex == 3) {
            self.pam0a6000TF.hidden = YES;
            self.pam0a6000TF.text = @"";
            self.pam0a6000TF.tag = 0;
            self.pam6001a10000TF.hidden = YES;
            self.pam6001a10000TF.text = @"";
            self.pam6001a10000TF.tag = 0;
            self.pam10001a12000TF.hidden = YES;
            self.pam10001a12000TF.text = @"";
            self.pam10001a12000TF.tag = 0;
            self.pamSobre12000TF.hidden = NO;
        }
    }
    [self updateLabels];
}
#pragma mark - switch changed
- (IBAction)onSwitchChange:(UISwitch*)sender{
    [self updateLabels];
}
#pragma mark - Update Total Labels
-(void)updateLabels{
    //Amenaza
    self.amenazaTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.amenazaTF.tag FromString:@"amenazaTF"]];
    
    //Supervision
    if (self.supervisionSC.selectedSegmentIndex == 0) {
        self.supervisionTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.personalOrganicoTF.tag FromString:@"personalOrganicoTF"]];
    }
    else{
        self.supervisionTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.personalAgregadoTF.tag FromString:@"personalAgregadoTF"]];
    }
    
    //Planeamiento
    if (self.planeamientoSC.selectedSegmentIndex == 0) {
        self.planeamientoTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.infoSuperficialTF.tag FromString:@"infoSuperficialTF"]];
    }
    else{
        self.planeamientoTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.infoEspecificaTF.tag FromString:@"infoEspecificaTF"]];
    }
    
    //Dias disponibilidad
    self.diasDisponibilidadTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.diasDisponibilidadTF.tag FromString:@"diasDisponibilidadTF"]];
    
    //Frecuencia Pam
    if (self.pamSC.selectedSegmentIndex == 0) {
        self.frecuenciaPamTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.pam0a25TF.tag FromString:@"pam0a25TF"]];
    }
    else if(self.pamSC.selectedSegmentIndex == 1){
        self.frecuenciaPamTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.pam25a50TF.tag FromString:@"pam25a50TF"]];
    }
    else if(self.pamSC.selectedSegmentIndex == 2){
        self.frecuenciaPamTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.pamMasDe505TF.tag FromString:@"pamMasDe505TF"]];
    }
    //Frecuencia P
    if (self.pSC.selectedSegmentIndex == 0) {
        self.frecuenciaPTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.p0a25TF.tag FromString:@"p0a25TF"]];
    }
    else if(self.pamSC.selectedSegmentIndex == 1){
        self.frecuenciaPTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.p25a50TF.tag FromString:@"p25a50TF"]];
    }
    else if(self.pamSC.selectedSegmentIndex == 2){
        self.frecuenciaPTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.pMasDe505TF.tag FromString:@"pMasDe505TF"]];
    }
    //Frecuencia T
    if (self.tripulanteSC.selectedSegmentIndex == 0) {
        self.frecuenciaTripulanteTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.tripulante0a25TF.tag FromString:@"tripulante0a25TF"]];
    }
    else if(self.pamSC.selectedSegmentIndex == 1){
        self.frecuenciaTripulanteTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.tripulante25a50TF.tag FromString:@"tripulante25a50TF"]];
    }
    else if(self.pamSC.selectedSegmentIndex == 2){
        self.frecuenciaTripulanteTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.tripulanteMasDe505TF.tag FromString:@"tripulanteMasDe505TF"]];
    }
    //Dias sin realizar
    self.diasSinRealizarTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.diasSinRealizarMismoTipoTF.tag FromString:@"diasSinRealizarMismoTipoTF"]];
    
    //Descanso Trip
    if (self.rendimientoSC.selectedSegmentIndex == 0) {
        self.descansoTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.rendimientoTripAdecuadoTF.tag FromString:@"rendimientoTripAdecuadoTF"]];
    }
    else{
        self.descansoTotalLabel.text = [NSString stringWithFormat:@"%i",[self evaluateTag:self.rendimientoTripNoAdecuadoTF.tag FromString:@"rendimientoTripNoAdecuadoTF"]];
    }
    //Condiciones Meteorologicas
    self.condicionesTotalLabel.text = [NSString stringWithFormat:@"%i",
                                       [self evaluateTag:self.rendimientoTripDiaTF.tag FromString:@"rendimientoTripDiaTF"] +
                                       [self evaluateTag:self.rendimientoTripNocheTF.tag FromString:@"rendimientoTripNocheTF"] +
                                       [self evaluateTag:self.rendimientoTripLVN.tag FromString:@"rendimientoTripLVN"]];
    //Complejidad Mision
    self.complejidadTotalLabel.text = [NSString stringWithFormat:@"%i",
                                      [self evaluateTag:self.multiplesAeronavesTF.tag FromString:@"multiplesAeronavesTF"] +
                                      [self evaluateTag:self.vueloInternacionalTF.tag FromString:@"vueloInternacionalTF"] +
                                      [self evaluateTag:self.aRasDeTierraTF.tag FromString:@"aRasDeTierraTF"]+
                                      [self evaluateTag:self.bajoNivelTF.tag FromString:@"bajoNivelTF"]+
                                      [self evaluateTag:self.cargaExternaTF.tag FromString:@"cargaExternaTF"]+
                                      [self evaluateTag:self.gruaRescateTF.tag FromString:@"gruaRescateTF"]+
                                       [self evaluateTag:self.rapelTF.tag FromString:@"rapelTF"]+
                                       [self evaluateTag:self.asaltoAereoTF.tag FromString:@"asaltoAereoTF"]+
                                       [self evaluateTag:self.apoyoDeFuegoTF.tag FromString:@"apoyoDeFuegoTF"]+
                                       [self evaluateTag:self.reconocimientoTF.tag FromString:@"reconocimientoTF"]+
                                       [self evaluateTag:self.seguridadTF.tag FromString:@"seguridadTF"]+
                                       [self evaluateTag:self.paracaidismoTF.tag FromString:@"paracaidismoTF"]+
                                    [self evaluateTag:self.casevacTF.tag FromString:@"casevacTF"]+
                                       [self evaluateTag:self.recuperacionAeronavesTF.tag FromString:@"recuperacionAeronavesTF"]+
                                       [self evaluateTag:self.rescateRehenesTF.tag FromString:@"rescateRehenesTF"]+
                                       [self evaluateTag:self.vueloVIPTF.tag FromString:@"vueloVIPTF"]+
                                       [self evaluateTag:self.diaTF.tag FromString:@"diaTF"]+
                                       [self evaluateTag:self.oneTimeFlightTF.tag FromString:@"oneTimeFlightTF"]+
                                    [self evaluateTag:self.movimientoAereoTF.tag FromString:@"movimientoAereoTF"]+
                                       [self evaluateTag:self.reposicionamientoAeronavesTF.tag FromString:@"reposicionamientoAeronavesTF"]+
                                       [self evaluateTag:self.entrenamientoEmergenciasTF.tag FromString:@"entrenamientoEmergenciasTF"]+
                                       [self evaluateTag:self.vueloPruebaManttoTF.tag FromString:@"vueloPruebaManttoTF"]+
                                       [self evaluateTag:self.entrenamientoNOEmergenciasTF.tag FromString:@"entrenamientoNOEmergenciasTF"]+
                                       [self evaluateTag:self.ceremoniasDemostracionesTF.tag FromString:@"ceremoniasDemostracionesTF"]];
    
    //Factores Geográficos
    int contadorFactores = 0;
    if (self.factoresGeograficosSC.selectedSegmentIndex == 0) {
        contadorFactores =  [self evaluateTag:self.pam0a6000TF.tag FromString:@"pam0a6000TF"];
    }
    else if(self.factoresGeograficosSC.selectedSegmentIndex == 1){
        contadorFactores =  [self evaluateTag:self.pam6001a10000TF.tag FromString:@"pam6001a10000TF"];
    }
    else if(self.factoresGeograficosSC.selectedSegmentIndex == 2){
        contadorFactores =  [self evaluateTag:self.pam10001a12000TF.tag FromString:@"pam10001a12000TF"];
    }
    else if(self.factoresGeograficosSC.selectedSegmentIndex == 3){
        contadorFactores =  [self evaluateTag:self.pamSobre12000TF.tag FromString:@"pamSobre12000TF"];
    }
    
    self.factoresGeograficosTotalLabel.text =[NSString stringWithFormat:@"%i",
                                              contadorFactores +
                                              [self evaluateTag:self.aguaAMasDe10TF.tag FromString:@"aguaAMasDe10TF"] +
                                              [self evaluateTag:self.selvaTF.tag FromString:@"selvaTF"]+
                                              [self evaluateTag:self.terrenoPlanoTF.tag FromString:@"terrenoPlanoTF"]];
    
    int contadorSwitches = 0;
    contadorSwitches += self.aeronaveSwitch.on ? 1:0;
    contadorSwitches += self.movilidadSwitch.on ? 1:0;
    contadorSwitches += self.transporteSwitch.on ? 2:0;
    contadorSwitches += self.operacionesSwitch.on ? 2:0;
    contadorSwitches += self.puertasAbiertasSwitch.on ? 3:0;
    contadorSwitches += self.cargasSwitch.on ? 3:0;
    contadorSwitches += self.helipuertoSwitch.on ? 4:0;
    contadorSwitches += self.extencionHoraSwitch.on ? 10:0;
    contadorSwitches += self.extencionTiempoSwitch.on ? 10:0;
    contadorSwitches += self.aeronaveSolaSwitch.on ? 10:0;
    contadorSwitches += self.chalecosALSESwitch.on ? 3:0;
    contadorSwitches += self.equipoSupervivenciaSwitch.on ? 2:0;
    
    self.factoresRiesgoTotalLabel.text = [NSString stringWithFormat:@"%i", contadorSwitches];
    
    //Riesgo LVN
    self.seleccionPamTotalLabel.text =[NSString stringWithFormat:@"%i",[self evaluateTag:self.seleccionPamTF.tag FromString:@"seleccionPamTF"]];
    
    self.seleccionPTotalLabel.text =[NSString stringWithFormat:@"%i",[self evaluateTag:self.seleccionPTF.tag FromString:@"seleccionPTF"]];
    
    self.seleccionTripulacionTotalLabel.text =[NSString stringWithFormat:@"%i",[self evaluateTag:self.tripAdicionalTF.tag FromString:@"tripAdicionalTF"]];
    
    self.porcentajeTotalLabel.text =[NSString stringWithFormat:@"%i",[self evaluateTag:self.porcentajeIluminacionTF.tag FromString:@"porcentajeIluminacionTF"]];
    
    self.anguloTotalLabel.text =[NSString stringWithFormat:@"%i",[self evaluateTag:self.anguloLunaPamTF.tag FromString:@"anguloLunaPamTF"]];
    
    
    int amenazaTotalInt = [self.amenazaTotalLabel.text intValue];
    int supervisionTotalInt = [self.supervisionTotalLabel.text intValue];
    int planeamientoTotalInt = [self.planeamientoTotalLabel.text intValue];
    int diasDisponibilidadTotalInt = [self.diasDisponibilidadTotalLabel.text intValue];
    int frecuenciaPamTotalInt = [self.frecuenciaPamTotalLabel.text intValue];
    int frecuenciaPTotalInt = [self.frecuenciaPTotalLabel.text intValue];
    int frecuenciaTripulanteTotalInt = [self.frecuenciaTripulanteTotalLabel.text intValue];
    int diasSinRealizarTotalInt = [self.diasSinRealizarTotalLabel.text intValue];
    int descansoTotalInt = [self.descansoTotalLabel.text intValue];
    int condicionesMeteorologicasTotalInt = [self.condicionesTotalLabel.text intValue];
    int complejidadTotalInt = [self.complejidadTotalLabel.text intValue];
    int factoresGeograficosTotalInt = [self.factoresGeograficosTotalLabel.text intValue];
    int factoresRiesgoTotalInt = [self.factoresRiesgoTotalLabel.text intValue];
    //LVN
    int seleccionPamTotalInt = [self.seleccionPamTotalLabel.text intValue];
    int seleccionPTotalInt = [self.seleccionPTotalLabel.text intValue];
    int seleccionTripulacionTotalInt = [self.seleccionTripulacionTotalLabel.text intValue];
    int porcentajeTotalInt = [self.porcentajeTotalLabel.text intValue];
    int anguloTotalInt = [self.anguloTotalLabel.text intValue];
    
    int totalLVN = seleccionPamTotalInt + seleccionPTotalInt + seleccionTripulacionTotalInt + porcentajeTotalInt + anguloTotalInt;
    
    int total1 = amenazaTotalInt+
    supervisionTotalInt+
    planeamientoTotalInt+
    diasDisponibilidadTotalInt+
    frecuenciaPamTotalInt+
    frecuenciaPTotalInt+
    frecuenciaTripulanteTotalInt+
    diasSinRealizarTotalInt+
    descansoTotalInt+
    condicionesMeteorologicasTotalInt+
    complejidadTotalInt+
    factoresGeograficosTotalInt+
    factoresRiesgoTotalInt+
    totalLVN;
    
    self.totalValoresMisionLabel.text = [NSString stringWithFormat:@"%i",total1];
    self.totalLvnLabel.text = [NSString stringWithFormat:@"%i",totalLVN];
    
    if (
        self.amenazaTF.tag == 0 ||
        self.personalOrganicoTF.tag + self.personalAgregadoTF.tag == 0 ||
        self.infoSuperficialTF.tag + self.infoEspecificaTF.tag == 0 ||
        self.diasDisponibilidadTF.tag == 0 ||
        
        
        self.pam0a25TF.tag + self.pam25a50TF.tag + self.pamMasDe505TF.tag == 0 ||
        self.p0a25TF.tag + self.p25a50TF.tag + self.pMasDe505TF.tag == 0 ||
        self.tripulante0a25TF.tag + self.tripulante25a50TF.tag + self.tripulanteMasDe505TF.tag == 0 ||
        
        
        self.diasSinRealizarMismoTipoTF.tag == 0 ||
        self.rendimientoTripAdecuadoTF.tag + self.rendimientoTripNoAdecuadoTF.tag == 0 ||
        self.rendimientoTripDiaTF.tag == 0 ||
        self.rendimientoTripNocheTF.tag == 0 ||
        self.rendimientoTripLVN.tag == 0 ||
        
        self.multiplesAeronavesTF.tag == 0 ||
        self.vueloInternacionalTF.tag == 0 ||
        self.aRasDeTierraTF.tag == 0 ||
        self.bajoNivelTF.tag == 0 ||
        self.cargaExternaTF.tag == 0 ||
        self.gruaRescateTF.tag == 0 ||
        self.rapelTF.tag == 0 ||
        self.asaltoAereoTF.tag == 0 ||
        self.apoyoDeFuegoTF.tag == 0 ||
        self.reconocimientoTF.tag == 0 ||
        self.seguridadTF.tag == 0 ||
        self.paracaidismoTF.tag == 0 ||
        self.casevacTF.tag == 0 ||
        self.recuperacionAeronavesTF.tag == 0 ||
        self.rescateRehenesTF.tag == 0 ||
        self.vueloVIPTF.tag == 0 ||
        self.diaTF.tag == 0 ||
        self.oneTimeFlightTF.tag == 0 ||
        self.movimientoAereoTF.tag == 0 ||
        self.reposicionamientoAeronavesTF.tag == 0 ||
        self.entrenamientoEmergenciasTF.tag == 0 ||
        self.vueloPruebaManttoTF.tag == 0 ||
        self.entrenamientoNOEmergenciasTF.tag == 0 ||
        self.ceremoniasDemostracionesTF.tag == 0 ||
        
        self.pam0a6000TF.tag + self.pam6001a10000TF.tag + self.pam10001a12000TF.tag + self.pamSobre12000TF.tag == 0 ||
        self.aguaAMasDe10TF.tag == 0 ||
        self.selvaTF.tag == 0 ||
        self.terrenoPlanoTF.tag == 0 ||
        
        self.seleccionPamTF.tag == 0 ||
        self.seleccionPTF.tag == 0 ||
        self.tripAdicionalTF.tag == 0 ||
        self.porcentajeIluminacionTF.tag == 0 ||
        self.anguloLunaPamTF.tag == 0
        ){
        
        self.riesgoLabel.text = @"···";
    }
    else{
        if (total1<31) {
            self.riesgoLabel.text = @"BAJO";
        }
        else if (total1>=31 && total1<45) {
            self.riesgoLabel.text = @"MEDIO";
        }
        else if (total1>=45) {
            self.riesgoLabel.text = @"ALTO";
        }
        
    }
    
}
-(int)evaluateTag:(int)tag FromString:(NSString*)string{
    int result = 0;
    if ([string isEqualToString:@"amenazaTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 10;
        }
        else if (tag == 5) {
            result = 20;
        }
    }
    else if ([string isEqualToString:@"personalOrganicoTF"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 1;
        }
        else if (tag == 3) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"personalAgregadoTF"]) {
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
    else if ([string isEqualToString:@"infoSuperficialTF"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"infoEspecificaTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"diasDisponibilidadTF"]) {
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
            result = 5;
        }
        else if (tag == 5) {
            result = 10;
        }
    }
    else if ([string isEqualToString:@"pam0a25TF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"pam25a50TF"]) {
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
    else if ([string isEqualToString:@"pamMasDe505TF"]) {
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
            result = 3;
        }
    }
    else if ([string isEqualToString:@"p0a25TF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"p25a50TF"]) {
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
    else if ([string isEqualToString:@"pMasDe505TF"]) {
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
            result = 3;
        }
    }
    else if ([string isEqualToString:@"tripulante0a25TF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"tripulante25a50TF"]) {
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
    else if ([string isEqualToString:@"tripulanteMasDe505TF"]) {
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
            result = 3;
        }
    }
    else if ([string isEqualToString:@"diasSinRealizarMismoTipoTF"]) {
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
        else if (tag == 5) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"rendimientoTripAdecuadoTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 3) {
            result = 4;
        }
    }
    else if ([string isEqualToString:@"rendimientoTripNoAdecuadoTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 10;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"rendimientoTripDiaTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 10;
        }
    }
    else if ([string isEqualToString:@"rendimientoTripNocheTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"rendimientoTripLVN"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 10;
        }
    }
    else if ([string isEqualToString:@"multiplesAeronavesTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"vueloInternacionalTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 2;
        }
    }
    else if ([string isEqualToString:@"aRasDeTierraTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"bajoNivelTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 2;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"cargaExternaTF"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"gruaRescateTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"rapelTF"]) {
        if (tag == 1) {
            result =4;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"asaltoAereoTF"]) {
        if (tag == 1) {
            result =20;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"apoyoDeFuegoTF"]) {
        if (tag == 1) {
            result =5;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"reconocimientoTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"seguridadTF"]) {
        if (tag == 1) {
            result =4;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"paracaidismoTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 5;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"casevacTF"]) {
        if (tag == 1) {
            result =5;
        }
        else if (tag == 2) {
            result = 5;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"recuperacionAeronavesTF"]) {
        if (tag == 1) {
            result =4;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"rescateRehenesTF"]) {
        if (tag == 1) {
            result =20;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 20;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"vueloVIPTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"diaTF"]) {
        if (tag == 1) {
            result =4;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 0;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"oneTimeFlightTF"]) {
        if (tag == 1) {
            result =10;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 0;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"movimientoAereoTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 4;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"reposicionamientoAeronavesTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"entrenamientoEmergenciasTF"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 5;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"vueloPruebaManttoTF"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 10;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"entrenamientoNOEmergenciasTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 5;
        }
        else if (tag == 3) {
            result = 3;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"ceremoniasDemostracionesTF"]) {
        if (tag == 1) {
            result =5;
        }
        else if (tag == 2) {
            result = 0;
        }
        else if (tag == 3) {
            result = 5;
        }
        else if (tag == 4) {
            result = 0;
        }
    }
    else if ([string isEqualToString:@"pam0a6000TF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"pam6001a10000TF"]) {
        if (tag == 1) {
            result =4;
        }
        else if (tag == 2) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"pam10001a12000TF"]) {
        if (tag == 1) {
            result =5;
        }
        else if (tag == 2) {
            result = 10;
        }
    }
    else if ([string isEqualToString:@"pamSobre12000TF"]) {
        if (tag == 1) {
            result = 20;
        }
        else if (tag == 2) {
            result = 20;
        }
    }
    else if ([string isEqualToString:@"aguaAMasDe10TF"]) {
        if (tag == 1) {
            result =4;
        }
        else if (tag == 2) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"selvaTF"]) {
        if (tag == 1) {
            result =2;
        }
        else if (tag == 2) {
            result = 3;
        }
    }
    else if ([string isEqualToString:@"terrenoPlanoTF"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 1;
        }
    }
    else if ([string isEqualToString:@"seleccionPamTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"seleccionPTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"tripAdicionalTF"]) {
        if (tag == 1) {
            result =1;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 4;
        }
        else if (tag == 4) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"porcentajeIluminacionTF"]) {
        if (tag == 1) {
            result =3;
        }
        else if (tag == 2) {
            result = 2;
        }
        else if (tag == 3) {
            result = 5;
        }
    }
    else if ([string isEqualToString:@"anguloLunaPamTF"]) {
        if (tag == 1) {
            result =0;
        }
        else if (tag == 2) {
            result = 1;
        }
    }
    
    return result;
}
@end
