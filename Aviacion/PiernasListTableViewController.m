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
    NSDictionary *dicFromFile = [file getDictionary:@"RegistroActual"];
    numeroRegistro = [dicFromFile objectForKey:@"id"];
    nameForFile = [NSString stringWithFormat:@"Piernas%@", numeroRegistro];
    NSLog(@"[NumeroDeRegistro] %@",numeroRegistro);
    
    [self traerTodasLasPiernasYRecargarTabla];
    
    self.title = [NSString stringWithFormat:@"Listado de Piernas de Registro No. %@",numeroRegistro];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self traerTodasLasPiernasYRecargarTabla];
}
-(void)traerTodasLasPiernasYRecargarTabla{
    if ([file getDictionary:nameForFile]) {
        NSLog(@"[TraerTodasLasPiernas] Si existe el archivo: %@",[file getDictionary:nameForFile]);
        piernasDic = [file getDictionary:nameForFile];
        piernasArray = [[piernasDic objectForKey:@"piernas"]mutableCopy];
    }
    else{
        NSLog(@"[TraerTodasLasPiernas] No existe el archivo");
        piernasArray = [[NSMutableArray alloc]init];
    }
    piernasDic = @{@"piernas":piernasArray};
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
    
    NSLog(@"Selected %@",piernaSeleccionada);
    return indexPath;
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)fillTheCell:(PiernasCell*)cell atIndexPath:(NSIndexPath*)indexPath{
    NSDictionary *piernaDic = piernasArray[indexPath.row];
    cell.numeroRegistroLabel.text= [NSString stringWithFormat:@"%li", (long)indexPath.row] ;
    cell.deLabel.text = [piernaDic objectForKey:@"de"];
    cell.aLabel.text = [piernaDic objectForKey:@"a"];
    cell.arranques1Label.text = [piernaDic objectForKey:@"arranque1"];
    cell.arranques2Label.text = [piernaDic objectForKey:@"arranque2"];
    cell.aterrLabel.text = [piernaDic objectForKey:@"aterr"];
    cell.autoLabel.text = [piernaDic objectForKey:@"auto"];
    cell.corridosLabel.text = [piernaDic objectForKey:@"corridos"];
    cell.misionLabel.text = [piernaDic objectForKey:@"mision"];
    cell.stdLabel.text = [piernaDic objectForKey:@"std"];
    cell.configLabel.text = [piernaDic objectForKey:@"config"];
    cell.uApoyadaLabel.text = [piernaDic objectForKey:@"uApoyada"];
    cell.operacionLabel.text = [piernaDic objectForKey:@"operacion"];
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
    cell.cargaInternaLabel.text = [piernaDic objectForKey:@"cargaInterna"];
    cell.cargaExternaLabel.text = [piernaDic objectForKey:@"cargaExterna"];
    cell.cargaPaxLabel.text = [piernaDic objectForKey:@"cargaPax"];
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
        pdVC.piernaNumber = piernaSeleccionada;
        pdVC.piernaDic = piernaSeleccionadaDic;
    }
    else if([segue.identifier isEqualToString:@"new"]){
        pdVC.type = @"new";
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
@end
