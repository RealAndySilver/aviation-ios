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
    NSLog(@"Array Trip %@", tripulacionArray);
}
-(void)fillAllInfo{
    //NSLog(@"Fragmentaria: %@",self.ordenFragmentariaDic);
    //Section 1
    self.tipoOperacionTF.text = [self.ordenFragmentariaDic objectForKey:@"IdOperaFrag"];//Revisar - no llega
    
    self.requerimientoTF.text = [self.ordenFragmentariaDic objectForKey:@"IdRequerimiento"];

    self.clasificacionOFragmentariaTF.text = [self.ordenFragmentariaDic objectForKey:@"Clasificacion"];;
    self.noConsecutivoTF.text = [self.ordenFragmentariaDic objectForKey:@"ConsecutivoFrag"];
    self.fechaTF.text = [self.ordenFragmentariaDic objectForKey:@"Fecha"];//Revisar
    self.nombreYNoORDOPTF.text = [self.ordenFragmentariaDic objectForKey:@"NombreTerrestre"];
    
    
    self.enemigoTF.text = [self.ordenFragmentariaDic objectForKey:@"Enemigo"];
    //self.enemigoTF.text = [self.ordenFragmentariaDic objectForKey:@"IdEnemigo"];
    
    self.propiasTropasTF.text  = [self.ordenFragmentariaDic objectForKey:@"DescTropasPropias"];
    //self.propiasTropasTF.text  = [self.ordenFragmentariaDic objectForKey:@"TropasPropias"];
    
    self.tiempoMeteorologicoTF.text  = [self.ordenFragmentariaDic objectForKey:@"Tiempo"];//Revisar - no llega
    
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
    self.pasajerosTF.text  = [self.ordenFragmentariaDic objectForKey:@"Pasajeros"];
    self.equipoEspecialTF.text  = [self.ordenFragmentariaDic objectForKey:@"EquipoEsp"];
    self.rutaVueloTF.text  = [self.ordenFragmentariaDic objectForKey:@"RutaVuelo"];
    self.manifiestoSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"Mannifiesto"] boolValue];
    self.ifrSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"Ifr"] boolValue];
    self.nocheSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"VfrNoche"] boolValue];
    self.diaSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"VfrDia"] boolValue];
    self.lvnSwitch.on = [[self.ordenFragmentariaDic objectForKey:@"VfrLvn"] boolValue];
    
    
    self.comandanteMisionAreaTF.text  = [self.ordenFragmentariaDic objectForKey:@"AspcComandante"];
    self.armamentoTF.text  = [self.ordenFragmentariaDic objectForKey:@"Armamento"];//Revisar
    self.mantenimientoTF.text  = [self.ordenFragmentariaDic objectForKey:@"Mantenimiento"];//Revisar
    self.combustibleTF.text  = [self.ordenFragmentariaDic objectForKey:@"Combustible"];//Revisar
    
    
    self.puedeSerCumplidaOrientacionTF.text  = [self.ordenFragmentariaDic objectForKey:@"Orientacion"];
    self.requiereCambioTF.text  = [self.ordenFragmentariaDic objectForKey:@"Cambio"];
    self.observacionesTextView.text  = [self.ordenFragmentariaDic objectForKey:@"PlanObser"];
    self.tarjetasTF.text  = [self.ordenFragmentariaDic objectForKey:@"Tarjeta"];
    self.nivelRiesgoIzqTF.text  = [self.ordenFragmentariaDic objectForKey:@"TipoNivelRiesgo"];//Revisar
    self.nivelRiesgoDerTF.text  = [self.ordenFragmentariaDic objectForKey:@"NivelRiesgo"];
    
    
    self.comandanteOficialOperacionesTF.text  = [self.ordenFragmentariaDic objectForKey:@"IdFirmas1"];
    self.comandanteMisionTF.text  = [self.ordenFragmentariaDic objectForKey:@"IdFirmas2"];
    self.voBoComandantePdmaTF.text  = [self.ordenFragmentariaDic objectForKey:@"IdFirmas3"];
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
        cell.equipoLabel.text = [personas objectForKey:@"IdEquipo"];
        cell.matriculaLabel.text = [personas objectForKey:@"Matricula"];
        cell.indicativoLabel.text = [personas objectForKey:@"Indicativo"];
        cell.cargoLabel.text = [personas objectForKey:@"Cargo"];
        cell.gradoLabel.text = [personas objectForKey:@"Grado"];
        cell.nombreLabel.text = [personas objectForKey:@"IdPersona"];//Revisar
        cell.configLabel.text = [personas objectForKey:@"IdConfigMision"];
        return cell;
    }
    else if (tableView.tag == 2) {
        RestriccionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Restriccion" forIndexPath:indexPath];
        NSDictionary *restricciones = restriccionArray[indexPath.row];
        cell.restriccionLabel.text = [restricciones objectForKey:@"Restriccion"];
        cell.seguridadLabel.text = [restricciones objectForKey:@"SeguridadEjc"];
        cell.aacFacLabel.text = [restricciones objectForKey:@"AacFac"];
        cell.contingenciasLabel.text = [restricciones objectForKey:@"Contingencias"];
        return cell;
    }
    else if (tableView.tag == 3) {
        FrecuenciasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Frecuencias" forIndexPath:indexPath];
        NSDictionary *frecuencias = frecuenciasArray[indexPath.row];
        cell.vhfLabel.text = [frecuencias objectForKey:@"FreqVhf"];
        cell.uhfLabel.text = [frecuencias objectForKey:@"FreqUhf"];
        cell.hfLabel.text = [frecuencias objectForKey:@"FreqHf"];
        cell.fmLabel.text = [frecuencias objectForKey:@"FreqFm"];
        cell.llaveLabel.text = [frecuencias objectForKey:@"FreqLlave"];
        return cell;
    }
    return nil;
    
}

@end
