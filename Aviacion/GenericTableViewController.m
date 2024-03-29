//
//  GenericTableViewController.m
//  Aviacion
//
//  Created by Andres Abril on 15/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "GenericTableViewController.h"
#import "TripulacionCell.h"
#import "MunicionImpactosCell.h"
#import "PuntosCell.h"
@interface GenericTableViewController (){
    NSString *itemSeleccionado;
    NSMutableDictionary *itemSeleccionadoDic;
}


@end

@implementation GenericTableViewController
@synthesize genericArray,type, tableView=_tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"Lista de %@",type];
    if ([type isEqualToString:@"Tripulacion"]) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return genericArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([type isEqualToString:@"Tripulacion"]) {
        return 226;
    }
    else if ([type isEqualToString:@"Municion"]) {
        return 200;
    }
    else if ([type isEqualToString:@"Puntos"]) {
        return 209;
    }
    else if ([type isEqualToString:@"Impactos"]) {
        return 124;
    }
    else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([type isEqualToString:@"Tripulacion"]) {
        TripulacionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Tripulacion" forIndexPath:indexPath];
        [self fillTripulacionCell:cell atIndexPath:indexPath];
        return cell;
    }
    else if ([type isEqualToString:@"Municion"]) {
        MunicionImpactosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Municion" forIndexPath:indexPath];
        [self fillMunicionCell:cell atIndexPath:indexPath];
        return cell;
    }
    else if ([type isEqualToString:@"Puntos"]) {
        PuntosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Puntos" forIndexPath:indexPath];
        [self fillPuntosCell:cell atIndexPath:indexPath];
        return cell;
    }
    else if ([type isEqualToString:@"Impactos"]) {
        MunicionImpactosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Impactos" forIndexPath:indexPath];
        [self fillImpactosCell:cell atIndexPath:indexPath];
        return cell;
    }
    else{
        TripulacionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Tripulacion" forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark - Cell filling
-(void)fillTripulacionCell:(TripulacionCell*)cell atIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *genericDic = genericArray[indexPath.row];
    //cell.numeroLabel.text= [NSString stringWithFormat:@"%i", indexPath.row] ;
    cell.nombreLabel.text = [genericDic objectForKey:@"NombrePersona"];
    cell.nombreLabel.tag = [[genericDic objectForKey:@"IdPersona"] doubleValue];
    cell.gradoLabel.text = [genericDic objectForKey:@"Grado"];
    cell.codigoMilitarLabel.text = [genericDic objectForKey:@"CodigoMilitar"];
    cell.c1Label.text = [genericDic objectForKey:@"Cargo"];
    cell.c1Label.tag = [[genericDic objectForKey:@"IdCargo"] doubleValue];
    cell.tt1Label.text = [genericDic objectForKey:@"ttIFR"];
    cell.s1Label.text = [genericDic objectForKey:@"sIFR"];
    
    cell.c2Label.text = [genericDic objectForKey:@"Cargo"];
    cell.c2Label.tag = [[genericDic objectForKey:@"IdCargo"] doubleValue];
    cell.tt2Label.text = [genericDic objectForKey:@"ttDia"];
    cell.s2Label.text = [genericDic objectForKey:@"sDia"];
    
    cell.c3Label.text = [genericDic objectForKey:@"Cargo"];
    cell.c3Label.tag = [[genericDic objectForKey:@"IdCargo"] doubleValue];
    cell.tt3Label.text = [genericDic objectForKey:@"ttNoche"];
    cell.s3Label.text = [genericDic objectForKey:@"sNoche"];
    
    cell.c4Label.text = [genericDic objectForKey:@"Cargo"];
    cell.c4Label.tag = [[genericDic objectForKey:@"IdCargo"] doubleValue];
    cell.tt4Label.text = [genericDic objectForKey:@"ttLVN"];
    cell.s4Label.text = [genericDic objectForKey:@"sLVN"];
    
//    if([[genericDic objectForKey:@"IFR"] isEqualToString:@"1"]){
//        [cell.IFRSwitch setOn:YES];
//    }
//    else{
//        [cell.IFRSwitch setOn:NO];
//    }
//    if([[genericDic objectForKey:@"Noche"] isEqualToString:@"1"]){
//        [cell.nocheSwitch setOn:YES];
//    }
//    else{
//        [cell.nocheSwitch setOn:NO];
//    }
//    if([[genericDic objectForKey:@"Dia"] isEqualToString:@"1"]){
//        [cell.diaSwitch setOn:YES];
//    }
//    else{
//        [cell.diaSwitch setOn:NO];
//    }
//    if([[genericDic objectForKey:@"LVN"] isEqualToString:@"1"]){
//        [cell.LVNSwitch setOn:YES];
//    }
//    else{
//        [cell.LVNSwitch setOn:NO];
//    }
    
}
-(void)fillMunicionCell:(MunicionImpactosCell*)cell atIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *genericDic = genericArray[indexPath.row];
    //cell.numeroLabel.text= [NSString stringWithFormat:@"%i", indexPath.row] ;
    cell.municionTipoLabel.text = [genericDic objectForKey:@"municionTipo"];
    cell.municionCantidadLabel.text = [genericDic objectForKey:@"municionCantidad"];
    cell.municionCargadaLabel.text = [genericDic objectForKey:@"municionCargada"];
    cell.municionDisparadaLabel.text = [genericDic objectForKey:@"municionDisparada"];
    cell.municionEstadoLabel.text = [genericDic objectForKey:@"municionEstado"];
    
    cell.municionDepartamentoLabel.text = [genericDic objectForKey:@"municionDepartamento"];
    cell.municionMunicipioLabel.text = [genericDic objectForKey:@"municionMunicipio"];
    cell.municionSitioLabel.text = [genericDic objectForKey:@"municionSitio"];
    
    cell.municionLatLabel.text = [genericDic objectForKey:@"municionLat"];
    cell.municionLatGrLabel.text = [genericDic objectForKey:@"municionLatGr"];
    cell.municionLatMinLabel.text = [genericDic objectForKey:@"municionLatMin"];
    cell.municionLatSegLabel.text = [genericDic objectForKey:@"municionLonSeg"];
    cell.municionLonLabel.text = [genericDic objectForKey:@"municionLon"];
    cell.municionLonGrLabel.text = [genericDic objectForKey:@"municionLonGr"];
    cell.municionLonMinLabel.text = [genericDic objectForKey:@"municionLonMin"];
    cell.municionLonSegLabel.text = [genericDic objectForKey:@"municionLonSeg"];
}
-(void)fillPuntosCell:(PuntosCell*)cell atIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *genericDic = genericArray[indexPath.row];
    //cell.numeroLabel.text= [NSString stringWithFormat:@"%i", indexPath.row] ;
    cell.numeroLabel.text = [genericDic objectForKey:@"numero"];
    cell.tipoDePuntoLabel.text = [genericDic objectForKey:@"tipoDePunto"];
    cell.descripcionLabel.text = [genericDic objectForKey:@"descripcion"];
    cell.latLabel.text = [genericDic objectForKey:@"lat"];
    cell.grLatLabel.text = [genericDic objectForKey:@"grLat"];
    cell.minLatLabel.text = [genericDic objectForKey:@"minLat"];
    cell.segLatLabel.text = [genericDic objectForKey:@"segLat"];
    cell.lonLabel.text = [genericDic objectForKey:@"lon"];
    cell.grLonLabel.text = [genericDic objectForKey:@"grLon"];
    cell.minLonLabel.text = [genericDic objectForKey:@"minLon"];
    cell.segLonLabel.text = [genericDic objectForKey:@"segLon"];
    cell.puntoLabel.text = [genericDic objectForKey:@"punto"];
}
-(void)fillImpactosCell:(MunicionImpactosCell*)cell atIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *genericDic = genericArray[indexPath.row];
    //cell.numeroLabel.text= [NSString stringWithFormat:@"%i", indexPath.row] ;
    cell.impactosTipoLabel.text = [genericDic objectForKey:@"impactosTipo"];
    cell.impactosCargadaLabel.text = [genericDic objectForKey:@"impactosCargada"];
    cell.impactosDisparadaLabel.text = [genericDic objectForKey:@"impactosDisparada"];
    cell.impactosEstadoLabel.text = [genericDic objectForKey:@"impactosEstado"];
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    if ([type isEqualToString:@"Tripulacion"]) {
        return NO;
    }
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [genericArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    itemSeleccionado = [NSString stringWithFormat:@"%li", (long)indexPath.row];
    itemSeleccionadoDic = genericArray[indexPath.row];
    
    NSLog(@"Selected %@",itemSeleccionado);
    return indexPath;
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (IBAction)addItem:(id)sender {
    GenericDetailViewController *gdVC = [[GenericDetailViewController alloc]init];
    gdVC = [self.storyboard instantiateViewControllerWithIdentifier:type];
    gdVC.itemSeleccionado = [NSString stringWithFormat:@"%lu",(unsigned long)genericArray.count];
    gdVC.itemSeleccionadoDic = [[NSMutableDictionary alloc]init];
    gdVC.saveType = @"new";
    gdVC.itemType = type;
    gdVC.delegate = self;
    [self.navigationController pushViewController:gdVC animated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GenericDetailViewController *gdVC = [segue destinationViewController];
    gdVC.delegate = self;
    gdVC.itemSeleccionadoDic = [itemSeleccionadoDic mutableCopy];
    gdVC.itemSeleccionado = itemSeleccionado;
    gdVC.saveType = @"edit";
    gdVC.itemType = segue.identifier;
    NSLog(@"[SendingDictionaryToSegue] dictionary: %@", gdVC.itemSeleccionadoDic);
}

#pragma mark - Generic Detail Delegate
-(void)saveNew:(NSDictionary *)dictionary{
    NSLog(@"[GenericTV] adding dictionary to array: %@",dictionary);
    [genericArray addObject:dictionary];
    [_tableView reloadData];
}
-(void)overwrite:(NSDictionary *)dictionary atIndex:(int)index{
    [genericArray replaceObjectAtIndex:index withObject:dictionary];
}

@end
