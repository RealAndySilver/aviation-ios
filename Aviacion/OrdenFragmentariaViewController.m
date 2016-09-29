//
//  OrdenFragmentariaViewController.m
//  Aviacion
//
//  Created by Andres Abril on 8/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "OrdenFragmentariaViewController.h"

@interface OrdenFragmentariaViewController (){
    NSArray *frecuenciasArray;
    NSArray *restriccionArray;
    NSArray *tripulacionArray;
    NSArray *aspcArray;
    NSArray *planeacionArray;
}

@end

@implementation OrdenFragmentariaViewController
@synthesize ordenFragmentariaDic;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeArrays];
    self.title = [NSString stringWithFormat:@"Orden Fragmentaria #%@",[self.ordenFragmentariaDic objectForKey:@"ConsecutivoFrag"]];
    // Do any additional setup after loading the view.
    self.mainScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mainScrollView.contentSize=CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height*2.535);
    //[self.mainScrollView setPagingEnabled:YES];
    [self.mainScrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:self.mainScrollView];
    [self fillAllInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initializeArrays{
    frecuenciasArray = [ordenFragmentariaDic objectForKey:@"ListaComunicacion"];
    restriccionArray = [ordenFragmentariaDic objectForKey:@"ListaRestriccion"];
    tripulacionArray = [ordenFragmentariaDic objectForKey:@"ListaTripulOperaFrag"];
    aspcArray = [ordenFragmentariaDic objectForKey:@"ListaAspcFrag"];
    planeacionArray = [ordenFragmentariaDic objectForKey:@"ListaPlaneacion"];
}
-(void)fillAllInfo{
    //NSLog(@"Fragmentaria: %@",self.ordenFragmentariaDic);
    //Section 1
    if([[self.ordenFragmentariaDic objectForKey:@"AnexoEntrena"] isEqualToString:@"0"]){
    
        self.tipoOperacionTF.text = @"Requerimiento";
    
    }
    else if([[self.ordenFragmentariaDic objectForKey:@"AnexoEntrena"] isEqualToString:@"1"]){
        
        self.tipoOperacionTF.text = @"Anexo Aviación";
        
    }
    else if([[self.ordenFragmentariaDic objectForKey:@"AnexoEntrena"] isEqualToString:@"2"]){
        
        self.tipoOperacionTF.text = @"Entrenamiento";
        
    }
    else if([[self.ordenFragmentariaDic objectForKey:@"AnexoEntrena"] isEqualToString:@"3"]){
        
        self.tipoOperacionTF.text = @"Mantenimiento";
        
    }
    
    self.requerimientoTF.text = [[self.ordenFragmentariaDic objectForKey:@"Requerimiento"] objectForKey:@"Consecutivo"];

    self.clasificacionOFragmentariaTF.text = [self.ordenFragmentariaDic objectForKey:@"Clasificacion"];;
    self.noConsecutivoTF.text = [self.ordenFragmentariaDic objectForKey:@"ConsecutivoFrag"];
    self.fechaTF.text = [self.ordenFragmentariaDic objectForKey:@"Fecha"];//Revisar
    self.nombreYNoORDOPTF.text = [self.ordenFragmentariaDic objectForKey:@"NombreTerrestre"];
    
    
    self.enemigoTF.text = [self convertToString:[self.ordenFragmentariaDic objectForKey:@"NombreEnemigo"]];
    
    self.propiasTropasTF.text  = [self.ordenFragmentariaDic objectForKey:@"DescTropasPropias"];
    
    self.tiempoMeteorologicoTF.text  = [self.ordenFragmentariaDic objectForKey:@"Metar"];
    
    self.agregacionesYSegregacionesTF.text  = [self.ordenFragmentariaDic objectForKey:@"Agresegre"];
    self.comunidadesIndigenasSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"ComIndi"] boolValue];
    self.comunidadesDePazSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"ComPaz"] boolValue];
    self.comunidadesAfroSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"ComAfro"] boolValue];;
    self.caseriosPoblacionesSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"ComPob"] boolValue];
    
    
    self.quienTF.text  = [self.ordenFragmentariaDic objectForKey:@"MisionQuien"];
    self.dondeTF.text  = [self.ordenFragmentariaDic objectForKey:@"MisionDonde"];
    self.cuandoTF.text  = [self.ordenFragmentariaDic objectForKey:@"MisionCuando"];
    self.queTF.text  = [self.ordenFragmentariaDic objectForKey:@"MisionQue"];
    self.paraQueTF.text  = [self.ordenFragmentariaDic objectForKey:@"MisionParaque"];
    
    
    self.intencionesTextView.text  = [self.ordenFragmentariaDic objectForKey:@"Intenciones"];;
    self.instruccionesCoordinacionTextView.text  = [self.ordenFragmentariaDic objectForKey:@"Instruccion"];
    
    if([[self convertToString:[self.ordenFragmentariaDic objectForKey:@"Pasajeros"]] isEqualToString:@"1"]){
        self.pasajerosTF.text  = @"Autorizados";
    }
    else if([[self convertToString:[self.ordenFragmentariaDic objectForKey:@"Pasajeros"]] isEqualToString:@"2"]){
        self.pasajerosTF.text  = @"No Autorizados";
    }
    
    self.equipoEspecialTF.text  = [self.ordenFragmentariaDic objectForKey:@"EquipoEsp"];
    self.rutaVueloTF.text  = [self.ordenFragmentariaDic objectForKey:@"RutaVuelo"];
    self.misionTF.text  = [self.ordenFragmentariaDic objectForKey:@"Mision"];
    
    self.manifiestoSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"Manifiesto"] boolValue];
    
    self.ifrSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"Ifr"] boolValue];
    self.nocheSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"VfrNoche"] boolValue];
    self.diaSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"VfrDia"] boolValue];
    self.lvnSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"VfrLvn"] boolValue];
    
    
    self.comandanteMisionAreaTF.text  = [self.ordenFragmentariaDic objectForKey:@"AspcComandante"];
    
    if(aspcArray[0]){
        self.armamentoTF.text  = [aspcArray[0] objectForKey:@"DescMunicion"];
        self.mantenimientoTF.text  = [aspcArray[0] objectForKey:@"DescMantenimiento"];
        self.combustibleTF.text  = [aspcArray[0] objectForKey:@"DescApscCombustible"];
    }
    
    
    self.puedeSerCumplidaOrientacionTF.text  = [self.ordenFragmentariaDic objectForKey:@"Orientacion"];
    self.requiereCambioTF.text  = [self.ordenFragmentariaDic objectForKey:@"Cambio"];
    self.observacionesTextView.text  = [self.ordenFragmentariaDic objectForKey:@"PlanObser"];
    self.tarjetasTF.text  = [[self.ordenFragmentariaDic objectForKey:@"TipoTarjeta"] isEqualToString:@"TP"] ? @"TJ Planeamiento":@"TJ Rápido";
    self.nivelRiesgoIzqTF.text  = [[self.ordenFragmentariaDic objectForKey:@"TipoAla"] isEqualToString:@"AF"] ? @"Ala Fija":@"Ala Rotatoria";
    self.nivelRiesgoDerTF.text  = [self.ordenFragmentariaDic objectForKey:@"NivelRiesgo"];
    
    
    self.comandanteOficialOperacionesTF.text  = [self.ordenFragmentariaDic objectForKey:@"IdFirmas1"];
    self.comandanteMisionTF.text  = [self.ordenFragmentariaDic objectForKey:@"IdFirmas2"];
    self.voBoComandantePdmaTF.text  = [self.ordenFragmentariaDic objectForKey:@"IdFirmas3"];
}
#pragma mark - string conversion

- (NSString*)convertToString:(NSString*)number{
    return [NSString stringWithFormat:@"%@", number];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return tripulacionArray.count;
    }
    else if (tableView.tag == 2) {
        return restriccionArray.count;
    }
    else if (tableView.tag == 3) {
        return frecuenciasArray.count;
    }
    else if (tableView.tag == 4) {
        return planeacionArray.count;
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
        TripulacionFragmentariaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripulacionFragmentaria" forIndexPath:indexPath];
        NSDictionary *personas = tripulacionArray[indexPath.row];
        cell.equipoLabel.text = [NSString stringWithFormat:@"%@",[personas objectForKey:@"DescIdEquipo"]];
        cell.matriculaLabel.text = [NSString stringWithFormat:@"%@",[personas objectForKey:@"TipoAeronave"]];
        cell.indicativoLabel.text = [NSString stringWithFormat:@"%@",[personas objectForKey:@"Indicativo"]];
        cell.cargoLabel.text = [NSString stringWithFormat:@"%@",[personas objectForKey:@"Cargo"]];
        cell.gradoLabel.text = [NSString stringWithFormat:@"%@",[personas objectForKey:@"Grado"]];
        cell.nombreLabel.text = [NSString stringWithFormat:@"%@",[personas objectForKey:@"DescIdPersona"]];
        cell.configLabel.text = [NSString stringWithFormat:@"%@",[personas objectForKey:@"DescIdConfigMision"]];
        return cell;
    }
    else if (tableView.tag == 2) {
        RestriccionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Restriccion" forIndexPath:indexPath];
        NSDictionary *restricciones = restriccionArray[indexPath.row];
        cell.restriccionLabel.text = [NSString stringWithFormat:@"%@",[restricciones objectForKey:@"DescRestriccion"]];
        cell.seguridadLabel.text = [NSString stringWithFormat:@"%@",[restricciones objectForKey:@"SeguridadEjc"]];
        cell.aacFacLabel.text = [NSString stringWithFormat:@"%@",[restricciones objectForKey:@"AacFac"]];
        cell.contingenciasLabel.text = [NSString stringWithFormat:@"%@",[restricciones objectForKey:@"DescContingencias"]];
        return cell;
    }
    else if (tableView.tag == 3) {
        FrecuenciasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Frecuencias" forIndexPath:indexPath];
        NSDictionary *frecuencias = frecuenciasArray[indexPath.row];
        cell.vhfLabel.text = [NSString stringWithFormat:@"%@",[frecuencias objectForKey:@"FreqVhf"]];
        cell.uhfLabel.text = [NSString stringWithFormat:@"%@",[frecuencias objectForKey:@"FreqUhf"]];
        cell.hfLabel.text = [NSString stringWithFormat:@"%@",[frecuencias objectForKey:@"FreqHf"]];
        cell.fmLabel.text = [NSString stringWithFormat:@"%@",[frecuencias objectForKey:@"FreqFm"]];
        cell.llaveLabel.text = [NSString stringWithFormat:@"%@",[frecuencias objectForKey:@"FreqVhf"]];
        return cell;
    }
    else if (tableView.tag == 4) {
        TripulacionFragmentariaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripulacionFragmentaria" forIndexPath:indexPath];
        NSDictionary *planeacion = planeacionArray[indexPath.row];
        cell.cargoLabel.text = [NSString stringWithFormat:@"%@",[planeacion objectForKey:@"DescPlaneamiento"]];
        return cell;
    }
    return nil;
    
}

@end
