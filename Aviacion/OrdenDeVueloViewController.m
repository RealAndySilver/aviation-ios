//
//  OrdenDeVueloViewController.m
//  Aviacion
//
//  Created by Andres Abril on 8/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "OrdenDeVueloViewController.h"

@interface OrdenDeVueloViewController (){
    NSArray *tripulacionArray;
}

@end

@implementation OrdenDeVueloViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"Orden de Vuelo #%@",[self.ordenDic objectForKey:@"NroOrden"]];
    // Do any additional setup after loading the view.
    //NSLog(@"Orden #%@", [self.ordenDic objectForKey:@"ListaTripulacionOrden"]);

    tripulacionArray = [self.ordenDic objectForKey:@"ListaTripulacionOrden"];
    [self fillAllInfo];
}
-(void)fillAllInfo{
    self.consecutivoTF.text = [self.ordenDic objectForKey:@"NroOrden"];
    self.ordOpFragTF.text = [[self.ordenDic objectForKey:@"OperaFrag"] objectForKey:@"ConsecutivoFrag"];
    self.misionTF.text = [self.ordenDic objectForKey:@"DescMision"];
    self.confMision.text = [self.ordenDic objectForKey:@"DescConfig"];
    self.matriculaTF.text = [self.ordenDic objectForKey:@"Matricula"];
    self.tipoAeronaveTF.text = [self.ordenDic objectForKey:@"TipoAeronave"];
    self.lugarSalidaTF.text = [self.ordenDic objectForKey:@"DescLugar"];
    self.fechaHoraSalidaTF.text = [self.ordenDic objectForKey:@"FechaSalida"];
    self.unidadAviacionTF.text = [self.ordenDic objectForKey:@"SiglaUnidadAviacion"];
    self.unidadApoyadaTF.text = [self.ordenDic objectForKey:@"SiglaUnidadApoyada"];
    self.operacionTF.text = [self.ordenDic objectForKey:@"NombreOperacion"];
    self.rutaTF.text = [self.ordenDic objectForKey:@"RutaVuelo"];
    self.fechaTF.text = [self.ordenDic objectForKey:@"FechaElaboro"];
    self.elaboroTF.text = [self.ordenDic objectForKey:@"NombreElaboro"];
    self.observacionesTV.text = [self.ordenDic objectForKey:@"Observaciones"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tripulacionArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TripulacionOrdenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripulacionOrden" forIndexPath:indexPath];
    
    NSDictionary *persona = tripulacionArray[indexPath.row];
    cell.cargoLabel.text = [NSString stringWithFormat:@"%@",[persona objectForKey:@"Cargo"]];
    cell.personaLabel.text = [NSString stringWithFormat:@"%@",[persona objectForKey:@"NombrePersona"]];
    cell.gradoLabel.text = [NSString stringWithFormat:@"%@",[persona objectForKey:@"Grado"]];
    cell.codigoMilitarLabel.text = [NSString stringWithFormat:@"%@",[persona objectForKey:@"CodigoMilitar"]];
    return cell;
}

@end
