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
        return 124;
    }
    else if ([type isEqualToString:@"Puntos"]) {
        return 209;
    }
    else if ([type isEqualToString:@"Impactos"]) {
        return 124;
    }
    else{
        return 100;
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
        return cell;
    }
    else if ([type isEqualToString:@"Puntos"]) {
        PuntosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Puntos" forIndexPath:indexPath];
        return cell;
    }
    else if ([type isEqualToString:@"Impactos"]) {
        MunicionImpactosCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Impactos" forIndexPath:indexPath];
        return cell;
    }
    else{
        TripulacionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Tripulacion" forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark - Cell filling
-(void)fillTripulacionCell:(TripulacionCell*)cell atIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *tripulacionDic = genericArray[indexPath.row];
    //cell.numeroLabel.text= [NSString stringWithFormat:@"%i", indexPath.row] ;
    cell.nombreLabel.text = [tripulacionDic objectForKey:@"nombre"];
    cell.gradoLabel.text = [tripulacionDic objectForKey:@"grado"];
    cell.codigoMilitarLabel.text = [tripulacionDic objectForKey:@"codigoMilitar"];
    cell.c1Label.text = [tripulacionDic objectForKey:@"c1"];
    cell.cv1Label.text = [tripulacionDic objectForKey:@"cv1"];
    cell.tt1Label.text = [tripulacionDic objectForKey:@"tt1"];
    cell.s1Label.text = [tripulacionDic objectForKey:@"s1"];
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
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
    itemSeleccionado = [NSString stringWithFormat:@"%i", indexPath.row];
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
    gdVC.itemSeleccionado = [NSString stringWithFormat:@"%i",genericArray.count];
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
    gdVC.itemSeleccionadoDic = itemSeleccionadoDic;
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
