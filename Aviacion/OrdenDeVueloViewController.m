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
    // Do any additional setup after loading the view.
    tripulacionArray = [self.ordenDic objectForKey:@"ListaTripulacionOrden"];
    NSLog(@"Orden De Vuelo: %@",self.ordenDic);
    [self fillAllInfo];
}
-(void)fillAllInfo{
    self.consecutivoTF.text = [self.ordenDic objectForKey:@"IdOrden"];
    self.ordOpFragTF.text = [self.ordenDic objectForKey:@"IdOperaFrag"];
    self.misionTF.text = [self.ordenDic objectForKey:@"IdMision"];
    self.confMision.text = [self.ordenDic objectForKey:@"IdConfiguracion"];
    self.matriculaTF.text = [self.ordenDic objectForKey:@"IdAeronave"];
    self.tipoAeronaveTF.text = [self.ordenDic objectForKey:@"IdAeronave"];
    self.lugarSalidaTF.text = [self.ordenDic objectForKey:@"IdLugarSalida"];
    self.fechaHoraSalidaTF.text = [self.ordenDic objectForKey:@"FechaSalida"];
    self.unidadAviacionTF.text = [self.ordenDic objectForKey:@"IdUnidadAviacion"];
    self.unidadApoyadaTF.text = [self.ordenDic objectForKey:@"IdUnidadApoyada"];
    self.operacionTF.text = [self.ordenDic objectForKey:@"IdOperacion"];
    self.rutaTF.text = [self.ordenDic objectForKey:@"RutaVuelo"];
    self.fechaTF.text = [self.ordenDic objectForKey:@"FechaElaboro"];
    self.elaboroTF.text = [self.ordenDic objectForKey:@"IdElaboro"];
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
    cell.cargoLabel.text = [persona objectForKey:@"Cargo"];
    cell.personaLabel.text = [persona objectForKey:@"IdPersona"];
    cell.gradoLabel.text = [persona objectForKey:@"Grado"];
    cell.codigoMilitarLabel.text = [persona objectForKey:@"CodigoMilitar"];
    return cell;
}

@end
