//
//  GenericDetailViewController.m
//  Aviacion
//
//  Created by Andres Abril on 16/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "GenericDetailViewController.h"

@interface GenericDetailViewController ()

@end

@implementation GenericDetailViewController
@synthesize itemSeleccionadoDic, itemSeleccionado, saveType, itemType;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"State of Dic: %@", itemType);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    if ([saveType isEqualToString:@"edit"]) {
        self.title = [NSString stringWithFormat:@"Editando %@ No. %@", itemType,itemSeleccionado];
    }
    else if([saveType isEqualToString:@"new"]){
        self.title = [NSString stringWithFormat:@"Nuevo item para %@",itemType];
    }
    [self fillDispatcherWithType];
    
}
-(void)saveDispatcherWithType{
    if ([itemType isEqualToString:@"Tripulacion"]) {
        [self setTripulacionForSave];
    }
    else if ([itemType isEqualToString:@"Municion"]) {
        [self setMunicionForSave];
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        [self setPuntosForSave];
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        [self setImpactosForSave];
    }
}
-(void)fillDispatcherWithType{
    if ([itemType isEqualToString:@"Tripulacion"]) {
        [self fillTripulacion];
    }
    else if ([itemType isEqualToString:@"Municion"]) {
        [self fillMunicion];
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        [self fillPuntos];
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        [self fillImpactos];
    }
}
-(void)fillTripulacion{
    NSLog(@"Filling tripulacion %@", itemSeleccionadoDic);
    _nombreTF.text = [itemSeleccionadoDic objectForKey:@"nombre"];
    _gradoTF.text = [itemSeleccionadoDic objectForKey:@"grado"];
    _codigoMilitarTF.text = [itemSeleccionadoDic objectForKey:@"codigoMilitar"];
    _c1TF.text = [itemSeleccionadoDic objectForKey:@"c1"];
    _cv1TF.text = [itemSeleccionadoDic objectForKey:@"cv1"];
    _tt1TF.text = [itemSeleccionadoDic objectForKey:@"tt1"];
    _s1TF.text = [itemSeleccionadoDic objectForKey:@"s1"];
}
-(void)setTripulacionForSave{
    //[itemSeleccionadoDic setObject:itemSeleccionado forKey:@"numero"];
    [itemSeleccionadoDic setObject:_nombreTF.text forKey:@"nombre"];
    [itemSeleccionadoDic setObject:_gradoTF.text forKey:@"grado"];
    [itemSeleccionadoDic setObject:_codigoMilitarTF.text forKey:@"codigoMilitar"];
    [itemSeleccionadoDic setObject:_c1TF.text forKey:@"c1"];
    [itemSeleccionadoDic setObject:_cv1TF.text forKey:@"cv1"];
    [itemSeleccionadoDic setObject:_tt1TF.text forKey:@"tt1"];
    [itemSeleccionadoDic setObject:_s1TF.text forKey:@"s1"];
}
-(void)fillMunicion{
    NSLog(@"Filling munición %@", itemSeleccionadoDic);
    _municionTipoTF.text = [itemSeleccionadoDic objectForKey:@"municionTipo"];
    _municionCargadaTF.text = [itemSeleccionadoDic objectForKey:@"municionCargada"];
    _municionDisparadaTF.text = [itemSeleccionadoDic objectForKey:@"municionDisparada"];
    _municionEstadoTF.text = [itemSeleccionadoDic objectForKey:@"municionEstado"];
}
-(void)setMunicionForSave{
    [itemSeleccionadoDic setObject:_municionTipoTF.text forKey:@"municionTipo"];
    [itemSeleccionadoDic setObject:_municionCargadaTF.text forKey:@"municionCargada"];
    [itemSeleccionadoDic setObject:_municionDisparadaTF.text forKey:@"municionDisparada"];
    [itemSeleccionadoDic setObject:_municionEstadoTF.text forKey:@"municionEstado"];
}
-(void)fillPuntos{
    NSLog(@"Filling puntos %@", itemSeleccionadoDic);
    _numeroTF.text = [itemSeleccionadoDic objectForKey:@"numero"];
    _tipoDePuntoTF.text = [itemSeleccionadoDic objectForKey:@"tipoDePunto"];
    _descripcionTF.text = [itemSeleccionadoDic objectForKey:@"descripcion"];
    _latTF.text = [itemSeleccionadoDic objectForKey:@"lat"];
    _grLatTF.text = [itemSeleccionadoDic objectForKey:@"grLat"];
    _minLatTF.text = [itemSeleccionadoDic objectForKey:@"minLat"];
    _segLatTF.text = [itemSeleccionadoDic objectForKey:@"segLat"];
    _lonTF.text = [itemSeleccionadoDic objectForKey:@"lon"];
    _grLonTF.text = [itemSeleccionadoDic objectForKey:@"grLon"];
    _minLonTF.text = [itemSeleccionadoDic objectForKey:@"minLon"];
    _segLonTF.text = [itemSeleccionadoDic objectForKey:@"segLon"];
    _puntoTF.text = [itemSeleccionadoDic objectForKey:@"punto"];
}
-(void)setPuntosForSave{
    //[itemSeleccionadoDic setObject:itemSeleccionado forKey:@"numero"];
    [itemSeleccionadoDic setObject:_numeroTF.text forKey:@"numero"];
    [itemSeleccionadoDic setObject:_tipoDePuntoTF.text forKey:@"tipoDePunto"];
    [itemSeleccionadoDic setObject:_descripcionTF.text forKey:@"descripcion"];
    [itemSeleccionadoDic setObject:_latTF.text forKey:@"lat"];
    [itemSeleccionadoDic setObject:_grLatTF.text forKey:@"grLat"];
    [itemSeleccionadoDic setObject:_minLatTF.text forKey:@"minLat"];
    [itemSeleccionadoDic setObject:_segLatTF.text forKey:@"segLat"];
    [itemSeleccionadoDic setObject:_lonTF.text forKey:@"lon"];
    [itemSeleccionadoDic setObject:_grLonTF.text forKey:@"grLon"];
    [itemSeleccionadoDic setObject:_minLonTF.text forKey:@"minLon"];
    [itemSeleccionadoDic setObject:_segLonTF.text forKey:@"segLon"];
    [itemSeleccionadoDic setObject:_puntoTF.text forKey:@"punto"];
}
-(void)fillImpactos{
    NSLog(@"Filling impactos %@", itemSeleccionadoDic);
    _impactosTipoTF.text = [itemSeleccionadoDic objectForKey:@"impactosTipo"];
    _impactosCargadaTF.text = [itemSeleccionadoDic objectForKey:@"impactosCargada"];
    _impactosDisparadaTF.text = [itemSeleccionadoDic objectForKey:@"impactosDisparada"];
    _impactosEstadoTF.text = [itemSeleccionadoDic objectForKey:@"impactosEstado"];
}
-(void)setImpactosForSave{
    [itemSeleccionadoDic setObject:_impactosTipoTF.text forKey:@"impactosTipo"];
    [itemSeleccionadoDic setObject:_impactosCargadaTF.text forKey:@"impactosCargada"];
    [itemSeleccionadoDic setObject:_impactosDisparadaTF.text forKey:@"impactosDisparada"];
    [itemSeleccionadoDic setObject:_impactosEstadoTF.text forKey:@"impactosEstado"];
}
- (IBAction)save:(id)sender {
    [self saveDispatcherWithType];
    if ([saveType isEqualToString:@"edit"]) {
        [self.delegate overwrite:itemSeleccionadoDic atIndex:[itemSeleccionado intValue]];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"Editing from genericdetailvc");
    }
    else if ([saveType isEqualToString:@"new"]) {
        [self.delegate saveNew:itemSeleccionadoDic];
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"Saving from genericdetailvc");
    }
}
@end
