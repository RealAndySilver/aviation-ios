//
//  RequerimientoViewController.m
//  Aviacion
//
//  Created by Andres Abril on 12/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "RequerimientoViewController.h"

@interface RequerimientoViewController (){
    NSArray *piernasArray;
    NSArray *tanqueoArray;
    NSArray *armamentoArray;
}

@end

@implementation RequerimientoViewController
@synthesize requerimientoDic;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Requerimiento";
    [self initializeArrays];
    [self fillAllInfo];
    self.mainScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mainScrollView.contentSize=CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height*2.02);
    //[self.mainScrollView setPagingEnabled:YES];
    [self.mainScrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:self.mainScrollView];
}
- (void)initializeArrays{
    piernasArray = [requerimientoDic objectForKey:@"ListaPiernasRequerimiento"];
    tanqueoArray = [requerimientoDic objectForKey:@"ListaPtosTanqueoReq"];
    armamentoArray = [requerimientoDic objectForKey:@"ListaPtosArmamentoReq"];
    NSLog(@"Array tnq %@", armamentoArray);
}
-(void)fillAllInfo{
    //NSLog(@"Fragmentaria: %@",requerimientoDic);
    //Section 1
    self.consecutivoTF.text = [requerimientoDic objectForKey:@"Consecutivo"];
    self.mdn1TF.text = [requerimientoDic objectForKey:@"DescIdUnidOpMayor"];
    self.mdn2TF.text = [requerimientoDic objectForKey:@"DescIdUndIOpMenor"];
    self.antecedenteTF.text = [requerimientoDic objectForKey:@"Antecedente"];
    
    self.lugarTF.text = [requerimientoDic objectForKey:@"DescIdLugar"];
    //self.lugarTF.text = [requerimientoDic objectForKey:@"IdLugar"];//Revisar
    
    self.fechaTF.text = [requerimientoDic objectForKey:@"FechaReq"];
    
    self.unidadOperativaMayorTF.text = [requerimientoDic objectForKey:@"DescIdUnidOpMayor"];
    //self.unidadOperativaMayorTF.text = [requerimientoDic objectForKey:@"IdUnidOpMayor"];//Revisar
    
    self.unidadOperativaMenorTF.text  = [requerimientoDic objectForKey:@"DescIdUndIOpMenor"];
    //self.unidadOperativaMenorTF.text  = [requerimientoDic objectForKey:@"IdUnidOpMenor"];//Revisar
    
    self.unidadApoyadaTF.text  = [requerimientoDic objectForKey:@"DescIdUnidadApoyada"];
    //self.unidadApoyadaTF.text  = [requerimientoDic objectForKey:@"IdUnidApoyada"];//Revisar
    
    self.enemigoTF.text  = [requerimientoDic objectForKey:@"DescIdEnemigo"];
    //self.enemigoTF.text  = [requerimientoDic objectForKey:@"IdEnemigo"];//Revisar
    
    self.propiasTropasTF.text  = [requerimientoDic objectForKey:@"DescIdPropiasTropas"];
    //self.propiasTropasTF.text  = [requerimientoDic objectForKey:@"IdPropiasTropas"];//Revisar
    
    self.unidadDeSeguridadEnLaZonaTF.text  = [requerimientoDic objectForKey:@"DescIdUndZnAterriza"];//Revisar - no existe
    
    self.requiereHelicopteroDeSeguridadTF.text  = [requerimientoDic objectForKey:@"RequiereSeguridad"];
    self.comunidadesIndigenasSwitch.on = [[requerimientoDic objectForKey:@"ComIndi"] isEqualToString:@"Y"] ? YES:NO;
    self.comunidadesDePazSwitch.on = [[requerimientoDic objectForKey:@"ComPaz"] isEqualToString:@"Y"] ? YES:NO;
    self.comunidadesAfroSwitch.on = [[requerimientoDic objectForKey:@"ComAfro"] isEqualToString:@"Y"] ? YES:NO;
    self.caseriosSwitch.on = [[requerimientoDic objectForKey:@"ComPob"] isEqualToString:@"Y"] ? YES:NO;
    
    
    self.descripcionDeLaMisionTF.text  = [requerimientoDic objectForKey:@"Descripcion"];
    self.fechaHoraEjecucionTF.text  = [requerimientoDic objectForKey:@"FechaVuelo"];
    
    self.misionTF.text  = [requerimientoDic objectForKey:@"DescIdMision"];
    //self.misionTF.text  = [requerimientoDic objectForKey:@"IdMisionRequer"];//Revisar
    
    self.configuracionTF.text  = [requerimientoDic objectForKey:@"DescIdConfiguracionMision"];
    //self.configuracionTF.text  = [requerimientoDic objectForKey:@"IdConfiguracionMision"];//Revisar
    self.ifrSwitch.on = [[requerimientoDic objectForKey:@"Ifr"] isEqualToString:@"X"] ? YES:NO; //Dudas
    self.nocheSwitch.on = [[requerimientoDic objectForKey:@"VfrNoche"] isEqualToString:@"X"] ? YES:NO; //Dudas
    self.diaSwitch.on = [[requerimientoDic objectForKey:@"VfrDia"] isEqualToString:@"X"] ? YES:NO; //Dudas
    self.lvnSwitch.on = [[requerimientoDic objectForKey:@"VfrLvn"] isEqualToString:@"X"] ? YES:NO; //Dudas
    
    
    self.coordenadasDeTF.text  = [requerimientoDic objectForKey:@"coordenadasDe"];//Revisar - no existe
    self.altitudDeTF.text  = [requerimientoDic objectForKey:@"altitudDe"];//Revisar - no existe
    self.coordenadasATF.text  = [requerimientoDic objectForKey:@"coordenadasA"];//Revisar - no existe
    self.alititudATF.text  = [requerimientoDic objectForKey:@"altitudA"];//Revisar - no existe
    
    
    self.comandanteUnidadSolicitanteTF.text  = [requerimientoDic objectForKey:@"DescIdCdteUndSol"];
    //self.comandanteUnidadSolicitanteTF.text  = [requerimientoDic objectForKey:@"DescIdCdteUndSol"];//Revisar

    self.oficialDeOperacionesResponsableTF.text  = [requerimientoDic objectForKey:@"DescIdOfoPerResp"];
    //self.oficialDeOperacionesResponsableTF.text  = [requerimientoDic objectForKey:@"IdOfOperResp"];//Revisar

    
    self.telefonoTF.text  = [requerimientoDic objectForKey:@"TelefonoOfOper"];
    
    self.ubicacionTF.text  = [requerimientoDic objectForKey:@"DescIdUbicacion"];
    //self.ubicacionTF.text  = [requerimientoDic objectForKey:@"IdUbicacion"];//Revisar
    
    self.frecuenciasTF.text  = [requerimientoDic objectForKey:@"Frecuencias"];
    self.indicativosTF.text  = [requerimientoDic objectForKey:@"Indicativos"];
    
    self.encargadoRequerimientoTF.text  = [requerimientoDic objectForKey:@"DescIdEncargadoReq"];
    //self.encargadoRequerimientoTF.text  = [requerimientoDic objectForKey:@"IdEncargadoReq"];//Revisar
    
    self.telefonoEncargadoRequerimientoTF.text  = [requerimientoDic objectForKey:@"TelefonoEncargReq"];

    self.observacionesTextView.text  = [requerimientoDic objectForKey:@"ObservacionesRequer"];
    
    self.firmaTF.text  = [requerimientoDic objectForKey:@"DescIdFirma"];
    
    self.cargoTF.text  = [requerimientoDic objectForKey:@"CargoFirma"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return piernasArray.count;
    }
    else if (tableView.tag == 2) {
        return tanqueoArray.count;
    }
    else if (tableView.tag == 3) {
        return armamentoArray.count;
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
        PiernasRequerimientoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PiernasRequerimiento" forIndexPath:indexPath];
        NSDictionary *dic = piernasArray[indexPath.row];
        cell.noLabel.text = [dic objectForKey:@"NumeroPierna"];
        cell.deLabel.text = [dic objectForKey:@"DescDe"];
        cell.aLabel.text = [dic objectForKey:@"DescA"];
        cell.paxSaleLabel.text = [dic objectForKey:@"PaxSalen"];
        cell.paxEntraLabel.text = [dic objectForKey:@"PaxEntran"];
        cell.kilosSaleLabel.text = [dic objectForKey:@"KilosSalen"];
        cell.kilosEntraLabel.text = [dic objectForKey:@"KilosEntran"];
        cell.unidadSaleLabel.text = [dic objectForKey:@"DescIdUnidadTacticaSale"];
        cell.unidadEntraLabel.text = [dic objectForKey:@"DescIdUnidadTacticaEntra"];
        cell.operacionSaleLabel.text = [dic objectForKey:@"DescIdOperacionSale"];
        cell.operacionEntraLabel.text = [dic objectForKey:@"DescIdOperacionEntra"];
        cell.indicativoSaleLabel.text = [dic objectForKey:@"IndicativoSale"]; //Dudas - no viene en desc
        cell.indicativoEntraLabel.text = [dic objectForKey:@"IndicativoEntra"]; //Dudas - no viene en desc
        cell.frecuenciaSaleLabel.text = [dic objectForKey:@"DescFrecuenciaSale"];
        cell.frecuenciaEntraLabel.text = [dic objectForKey:@"DescFrecuenciaEntra"];
        cell.hSegSaleLabel.text = [dic objectForKey:@"HSeguridadSale"];
        cell.hSegEntraLabel.text = [dic objectForKey:@"HSeguridadEntra"];

        return cell;
    }
    else if (tableView.tag == 2 ) {
        TanqueoArmamentoRequerimientoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TanqueoArmamento" forIndexPath:indexPath];
        NSDictionary *dic = tanqueoArray[indexPath.row];
        cell.puntoLabel.text = [dic objectForKey:@"DescIdPuntoTanqueo"];
        cell.cantidadLabel.text = [dic objectForKey:@"GalonesDisponibles"];
        cell.personaLabel.text = [dic objectForKey:@"DescIdOperario"];
        cell.telefonoLabel.text = [dic objectForKey:@"TelefonoTanqueo"];
        return cell;
    }
    else if (tableView.tag == 3 ) {
        TanqueoArmamentoRequerimientoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TanqueoArmamento" forIndexPath:indexPath];
        NSDictionary *dic = armamentoArray[indexPath.row];
        cell.puntoLabel.text = [dic objectForKey:@"DescIdPuntoArmamento"];
        cell.cantidadLabel.text = [dic objectForKey:@"CantidadDisponible"];
        cell.personaLabel.text = [dic objectForKey:@"DescIdArmero"];
        cell.telefonoLabel.text = [dic objectForKey:@"TelefonoArmero"];
        return cell;
    }
    return nil;
    
}

@end
