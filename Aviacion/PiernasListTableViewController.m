//
//  ListTableViewController.m
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "PiernasListTableViewController.h"
#import "PiernasCell.h"
#import "FileSaver.h"
@interface PiernasListTableViewController (){
    NSString *piernaSeleccionada;
    NSMutableDictionary *piernaSeleccionadaDic;
    FileSaver *file;
    NSDictionary *piernasDic;
    NSMutableArray *piernasArray;
    NSString *nameForFile;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation PiernasListTableViewController
@synthesize numeroRegistro,tableView=_tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    file = [[FileSaver alloc]init];
    //NSDictionary *dicFromFile = [file getDictionary:@"RegistroActual"];
    nameForFile = [NSString stringWithFormat:@"Piernas%@", [self.ordenDic objectForKey:@"NroOrden"]];
    
    [self traerTodasLasPiernasYRecargarTabla];
    
    self.title = [NSString stringWithFormat:@"Listado Piernas Registro De Vuelo %@", [self.ordenDic objectForKey:@"NroOrden"]];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self traerTodasLasPiernasYRecargarTabla];
    [self getTotals];
}
-(void)traerTodasLasPiernasYRecargarTabla{
    if ([file getDictionary:nameForFile]) {
        NSLog(@"[TraerTodasLasPiernas] Si existe el archivo: %@",[file getDictionary:nameForFile]);
        piernasDic = [file getDictionary:nameForFile];
        piernasArray = [[piernasDic objectForKey:@"piernas"]mutableCopy];
        piernasDic = @{@"piernas":piernasArray};
    }
    else{
        NSLog(@"[TraerTodasLasPiernas] No existe el archivo");
        piernasArray = [[NSMutableArray alloc]init];
        NSArray *tempArray = [self.requerimientoDic objectForKey:@"ListaPiernasRequerimiento"];
        for(int i = 0; i<tempArray.count;i++){
            NSDictionary *tempDic = @{@"numeroPierna":[tempArray[i] objectForKey:@"NumeroPierna"],
                                      @"DescDe":[tempArray[i] objectForKey:@"DescDe"],
                                      @"De":[tempArray[i] objectForKey:@"De"],
                                      @"DescA":[tempArray[i] objectForKey:@"DescA"],
                                      @"A":[tempArray[i] objectForKey:@"A"],
                                      @"DescIdMision":[self.requerimientoDic objectForKey:@"DescIdMision"],
                                      @"IdMision":[self.requerimientoDic objectForKey:@"IdMision"],
                                      @"DescIdConfiguracionMision":[self.requerimientoDic objectForKey:@"DescIdConfiguracionMision"],
                                      @"IdConfiguracionMision":[self.requerimientoDic objectForKey:@"IdConfiguracionMision"],
                                      @"DescIdUnidadApoyada":[self.requerimientoDic objectForKey:@"DescIdUnidadApoyada"],
                                      @"IdUnidadApoyada":[self.requerimientoDic objectForKey:@"IdUnidadApoyada"],
                                      @"DescIdUnidadTacticaSale":[tempArray[i] objectForKey:@"DescIdUnidadTacticaSale"],
                                      @"IdUnidadTacticaSale":[tempArray[i] objectForKey:@"IdUnidadTacticaSale"],
                                      @"KilosEntran":[tempArray[i] objectForKey:@"KilosEntran"],
                                      @"PaxEntran":[tempArray[i] objectForKey:@"PaxEntran"],
                                      @"tripulacion":[self.ordenDic objectForKey:@"ListaTripulacionOrden"]};
            NSLog(@"Temp Dic %@", tempDic);
            [piernasArray addObject:tempDic];
        }
        piernasDic = @{@"piernas":piernasArray};
        NSLog(@"[SaveNew] nuevo item agregado al arreglo. Guardando diccionario: %@",piernasDic);
        [file setDictionary:piernasDic withKey:nameForFile];
    }
    
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return piernasArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(section == 0){
        return self.totalView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0){
        return 120.0;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PiernasCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Pierna" forIndexPath:indexPath];
    //if (indexPath.row % 2) {
        //cell.contentView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    //}
    
    
    [self fillTheCell:cell atIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    piernaSeleccionada = [NSString stringWithFormat:@"%li", (long)indexPath.row];
    piernaSeleccionadaDic = piernasArray[indexPath.row];
    
    NSLog(@"Selected pierna %@",piernaSeleccionadaDic);
    return indexPath;
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(void)fillTheCell:(PiernasCell*)cell atIndexPath:(NSIndexPath*)indexPath{
    NSDictionary *piernaDic = piernasArray[indexPath.row];
    cell.numeroRegistroLabel.text= [piernaDic objectForKey:@"numeroPierna"];//[NSString stringWithFormat:@"%li", (long)indexPath.row] ;
    
    cell.deLabel.text = [piernaDic objectForKey:@"DescDe"];
    cell.deLabel.tag = [[piernaDic objectForKey:@"De"] doubleValue];
    
    cell.aLabel.text = [piernaDic objectForKey:@"DescA"];
    cell.aLabel.tag = [[piernaDic objectForKey:@"A"] doubleValue];
    
    cell.arranques1Label.text = [piernaDic objectForKey:@"arranque1"];
    cell.arranques2Label.text = [piernaDic objectForKey:@"arranque2"];
    cell.aterrLabel.text = [piernaDic objectForKey:@"aterr"];
    cell.autoLabel.text = [piernaDic objectForKey:@"auto"];
    cell.corridosLabel.text = [piernaDic objectForKey:@"corridos"];
    
    cell.misionLabel.text = [piernaDic objectForKey:@"DescIdMision"];
    cell.misionLabel.tag = [[piernaDic objectForKey:@"IdMision"] doubleValue];
    
    cell.stdLabel.text = [piernaDic objectForKey:@"std"];
    
    cell.configLabel.text = [piernaDic objectForKey:@"DescIdConfiguracionMision"];
    cell.configLabel.tag = [[piernaDic objectForKey:@"IdConfiguracionMision"] doubleValue];
    
    cell.uApoyadaLabel.text = [piernaDic objectForKey:@"DescIdUnidadApoyada"];
    cell.uApoyadaLabel.tag = [[piernaDic objectForKey:@"IdUnidadApoyada"] doubleValue];
    
    //cell.operacionLabel.text = [piernaDic objectForKey:@"DescIdUnidadTacticaSale"];
    //cell.operacionLabel.tag = [[piernaDic objectForKey:@"IdUnidadTacticaSale"] doubleValue];
    
    cell.operacionLabel.text = [self.ordenDic objectForKey:@"NombreOperacion"];
    cell.operacionLabel.tag = [[self.ordenDic objectForKey:@"idOperacion"] doubleValue];
    
    cell.pSalud1Label.text = [piernaDic objectForKey:@"pSalud1"];
    cell.pSalud2Label.text = [piernaDic objectForKey:@"pSalud2"];
    cell.ciclosLabel.text = [piernaDic objectForKey:@"ciclos"];
    cell.fcsLabel.text = [piernaDic objectForKey:@"fcs"];
    cell.tiemposAeronaveIniciaLabel.text = [piernaDic objectForKey:@"tiemposAeronaveInicia"];
    cell.tiemposAeronaveTerminaLabel.text = [piernaDic objectForKey:@"tiemposAeronaveTermina"];
    cell.tiemposAeronaveTotalLabel.text = [piernaDic objectForKey:@"tiemposAeronaveTotal"];
    cell.tiempoTripulacionIniciaLabel.text = [piernaDic objectForKey:@"tiemposTripulacionInicia"];
    cell.tiempoTripulacionTerminaLabel.text = [piernaDic objectForKey:@"tiemposTripulacionTermina"];
    cell.tiempoTripulacionTotalLabel.text = [piernaDic objectForKey:@"tiemposTripulacionTotal"];
    cell.cargaInternaLabel.text = [piernaDic objectForKey:@"KilosEntran"];
    cell.cargaExternaLabel.text = [piernaDic objectForKey:@"cargaExterna"];
    cell.cargaPaxLabel.text = [piernaDic objectForKey:@"PaxEntran"];
    cell.cargaHeridosLabel.text = [piernaDic objectForKey:@"cargaHeridos"];
    cell.cargaMuertosLabel.text = [piernaDic objectForKey:@"cargaMuertos"];
    cell.apuArranqueLabel.text = [piernaDic objectForKey:@"apuArranque"];
    cell.apuHorasLabel.text = [piernaDic objectForKey:@"apuHoras"];
    cell.apuTAireLabel.text = [piernaDic objectForKey:@"apuTAire"];
    cell.apuTGenLabel.text = [piernaDic objectForKey:@"apuTGen"];
    
    cell.tripulacionCountLabel.text = [NSString stringWithFormat:@"%li",(long)[[piernaDic objectForKey:@"tripulacion"] count]];
    
    cell.municionCountLabel.text = [NSString stringWithFormat:@"%li",(long)[[piernaDic objectForKey:@"municion"] count]];
    
    cell.puntosCountLabel.text = [NSString stringWithFormat:@"%li",(long)[[piernaDic objectForKey:@"puntos"] count]];
    
    cell.impactosCountLabel.text = [NSString stringWithFormat:@"%li",(long)[[piernaDic objectForKey:@"impactos"] count]];
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [piernasArray removeObjectAtIndex:indexPath.row];
        [file setDictionary:piernasDic withKey:nameForFile];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //[tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    PiernasDetailViewController *pdVC = [segue destinationViewController];
    pdVC.delegate = self;
    if([segue.identifier isEqualToString:@"edit"]){
        pdVC.type = @"edit";
        pdVC.ordenDic = self.ordenDic;
        pdVC.piernaNumber = piernaSeleccionada;
        pdVC.piernaDic = [piernaSeleccionadaDic mutableCopy];
    }
    else if([segue.identifier isEqualToString:@"new"]){
        pdVC.type = @"new";
        pdVC.ordenDic = self.ordenDic;
        pdVC.piernaDic = [[NSMutableDictionary alloc]init];
        pdVC.piernaNumber = [NSString stringWithFormat:@"%lu",(unsigned long)piernasArray.count];
    }
}

#pragma mark - PiernasDetail Delegate
-(void)saveNew:(NSDictionary *)dictionary{
    [piernasArray addObject:dictionary];
    NSLog(@"[SaveNew] nuevo item agregado al arreglo. Guardando diccionario: %@",piernasDic);
    [file setDictionary:piernasDic withKey:nameForFile];
}
-(void)overwrite:(NSDictionary *)dictionary atIndex:(int)index{
    [piernasArray replaceObjectAtIndex:index withObject:dictionary];
    [file setDictionary:piernasDic withKey:nameForFile];
}

#pragma mark - Total footer counters
-(void)getTotals{
    self.totalInternaLabel.text = @"0";
    self.totalExternaLabel.text = @"0";
    self.totalPasajerosLabel.text = @"0";
    self.totalHeridosLabel.text = @"0";
    self.totalMuertosLabel.text = @"0";
    
    self.totalArranquesLabel.text = @"0";
    self.totalHorasLabel.text = @"0";
    self.totalAireLabel.text = @"0";
    self.totalGenLabel.text = @"0";
    
    self.totalNo1Label.text = @"0";
    self.totalNo2Label.text = @"0";
    
    self.totalAterrLabel.text = @"0";
    self.totalAutoLabel.text = @"0";
    self.totalCorridosLabel.text = @"0";
    self.totalCiclosLabel.text = @"0";
    self.totalFCSLabel.text = @"0";
    self.total20Label.text = @"0";
    self.totalPTotal1Label.text = @"0";
    
    self.totalPTotal2Label.text = @"0";
    
    for(int i = 0; i<piernasArray.count;i++){
        
        self.totalInternaLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"KilosEntran"] doubleValue] + [self.totalInternaLabel.text doubleValue]];
        self.totalExternaLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"cargaExterna"] doubleValue] + [self.totalExternaLabel.text doubleValue]];
        self.totalPasajerosLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"PaxEntran"] doubleValue] + [self.totalPasajerosLabel.text doubleValue]];
        self.totalHeridosLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"cargaHeridos"] doubleValue] + [self.totalHeridosLabel.text doubleValue]];
        self.totalMuertosLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"cargaMuertos"] doubleValue] + [self.totalMuertosLabel.text doubleValue]];
        
        
        self.totalArranquesLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"apuArranque"] doubleValue] + [self.totalArranquesLabel.text doubleValue]];
        self.totalHorasLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"apuHoras"] doubleValue] + [self.totalHorasLabel.text doubleValue]];
        self.totalAireLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"apuTAire"] doubleValue] + [self.totalAireLabel.text doubleValue]];
        self.totalGenLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"apuTGen"] doubleValue] + [self.totalGenLabel.text doubleValue]];
        
        
        self.totalNo1Label.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"arranque1"] doubleValue] + [self.totalNo1Label.text doubleValue]];
        self.totalNo2Label.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"arranque2"] doubleValue] + [self.totalNo2Label.text doubleValue]];
        
        
        self.totalAterrLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"aterr"] doubleValue] + [self.totalAterrLabel.text doubleValue]];
        self.totalAutoLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"auto"] doubleValue] + [self.totalAutoLabel.text doubleValue]];
        self.totalCorridosLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"corridos"] doubleValue] + [self.totalCorridosLabel.text doubleValue]];
        self.totalCiclosLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"ciclos"] doubleValue] + [self.totalCiclosLabel.text doubleValue]];
        self.totalFCSLabel.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"fcs"] doubleValue] + [self.totalFCSLabel.text doubleValue]];
        self.total20Label.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"total20"] doubleValue] + [self.total20Label.text doubleValue]];
        self.totalPTotal1Label.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"tiemposAeronaveTotal"] doubleValue] + [self.totalPTotal1Label.text doubleValue]];
        
        self.totalPTotal2Label.text = [NSString stringWithFormat:@"%.0f",[[piernasArray[i] objectForKey:@"tiemposTripulacionTotal"] doubleValue] + [self.totalPTotal2Label.text doubleValue]];
    }
}
@end
