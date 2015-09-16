//
//  RegistroDeVueloViewController.m
//  Aviacion
//
//  Created by Andres Abril on 11/09/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "RegistroDeVueloViewController.h"
#import "FileSaver.h"
#import "PiernasListTableViewController.h"

@interface RegistroDeVueloViewController (){
    FileSaver *file;
    NSMutableDictionary *registroDictionary;
    NSString *numeroRegistro;
}

@end

@implementation RegistroDeVueloViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Registro De Vuelo";
    numeroRegistro = @"10";
    [self setPersistance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"piernas"]) {
        //PiernasListTableViewController *plVC =  [segue destinationViewController];
        //plVC.numeroRegistro = numeroRegistro;
    }
    
}

-(void)setPersistance{
    file = [[FileSaver alloc]init];
    [file setDictionary:@{@"id":numeroRegistro} withKey:@"RegistroActual"];
    
    registroDictionary = (NSMutableDictionary*)[file getDictionary:@"RegistroDeVuelo"];
    
    if (![registroDictionary objectForKey:@"Piernas"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Piernas"];
    }
    if (![registroDictionary objectForKey:@"Tripulacion"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Tripulacion"];
    }
    if (![registroDictionary objectForKey:@"Municion"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Municion"];
    }
    if (![registroDictionary objectForKey:@"Servicios"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Servicios"];
    }
    if (![registroDictionary objectForKey:@"Puntos"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Puntos"];
    }
    if (![registroDictionary objectForKey:@"Impactos"]) {
        NSMutableArray *mArray = [[NSMutableArray alloc]init];
        [registroDictionary setObject:mArray forKey:@"Impactos"];
    }
}

@end
