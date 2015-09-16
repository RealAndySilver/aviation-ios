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
        [self setTripulacionForsave];
    }
    else if ([itemType isEqualToString:@"Municion"]) {
        
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        
    }
}
-(void)fillDispatcherWithType{
    if ([itemType isEqualToString:@"Tripulacion"]) {
        [self fillTripulacion];
    }
    else if ([itemType isEqualToString:@"Municion"]) {
        
    }
    else if ([itemType isEqualToString:@"Puntos"]) {
        
    }
    else if ([itemType isEqualToString:@"Impactos"]) {
        
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
-(void)setTripulacionForsave{
    //[itemSeleccionadoDic setObject:itemSeleccionado forKey:@"numero"];
    [itemSeleccionadoDic setObject:_nombreTF.text forKey:@"nombre"];
    [itemSeleccionadoDic setObject:_gradoTF.text forKey:@"grado"];
    [itemSeleccionadoDic setObject:_codigoMilitarTF.text forKey:@"codigoMilitar"];
    [itemSeleccionadoDic setObject:_c1TF.text forKey:@"c1"];
    [itemSeleccionadoDic setObject:_cv1TF.text forKey:@"cv1"];
    [itemSeleccionadoDic setObject:_tt1TF.text forKey:@"tt1"];
    [itemSeleccionadoDic setObject:_s1TF.text forKey:@"s1"];
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
