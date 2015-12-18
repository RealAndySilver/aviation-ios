//
//  FirstViewController.m
//  Aviacion
//
//  Created by Andres Abril on 27/08/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "FirstViewController.h"
#import "MainViewController.h"
#import "ServerCommunicator.h"
#import "FileSaver.h"
@interface FirstViewController (){
    UIViewController *mVC;
    ServerCommunicator *server;
    FileSaver *file;
    NSArray *array;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    file = [[FileSaver alloc]init];
    server = [[ServerCommunicator alloc]init];
    server.delegate = self;
    //if (![file getDictionary:@"ListaAeronaveEscoltaFac"]) {
        [server callRESTServerWithGETMethod:@"listas" andParameter:@"" endpoint:@"Listas"];
    //}
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    [self goToNextVC];
}

-(void)goToNextVC{
    mVC = [[MainViewController alloc]init];
    mVC=[self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self.navigationController pushViewController:mVC animated:YES];
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return NO;
}

#pragma mark - ServerCommunicator Delegate
-(void)receivedDataFromServer:(NSDictionary *)dictionary withMethodName:(NSString *)methodName{
//    array = @[@"PersonaTripulacion",
//              @"NumeroOrden",
//              @"Misiones",
//              @"Personas",
//              @"Configuraciones",
//              @"DeALugares",
//              @"Operaciones",
//              @"Aeronaves",
//              @"UnidadOpMenor",
//              @"Organizaciones",
//              @"TipoPax",
//              @"CargosTripulacion",
//              @"UnidadOpMayor",
//              @"DeA",
//              @"EntidadApoyada",
//              @"Enemigos"];
    
    array = @[@"ListaAeronaveEscoltaFac",
              @"ListaUnidadOpMayores",
              @"ListaTipoPax",
              @"ListaPuntosTanqueos",
              @"ListaPersonasRecuperadas",
              @"ListaLugaresCoordenadas",
              @"ListaCompañiasVuelos",
              @"ListaNumerosOrdenesVuelosSinRegistrosVuelos",
              @"ListaEnemigos",
              @"ListaUnidadesAviaciones",
              @"ListaLugares",
              @"ListaAeronavesFac",
              @"ListaEquipos",
              @"ListaEquiposAlseAeronave",
              @"ListaContingencias",
              @"ListaTiposEscoltasPiernasRegistros",
              @"ListaCargos",
              @"ListaRegistroVuelos",
              @"ListaMisiones",
              @"ListaControles",
              @"ListaArmamentos",
              @"ListaFasesVuelos",
              @"ListaTiposServicios",
              @"ListaRequerimientos",
              @"ListaTiposFuerzas",
              @"ListaAeronaves",
              @"ListaTropasPropias",
              @"ListaNombresPersonas",
              @"ListaRestricciones",
              @"ListaCombustibles",
              @"ListaOperaciones",
              @"ListaUbicaciones",
              @"ListaComandantes",
              @"ListaPuntosVuelos",
              @"ListaUnidadOpMenores",
              @"ListaValoresA",
              @"ListaMunicionesUsadas",
              @"ListaTipoMisiones",
              @"ListaAeronaveEscoltaEjc",
              @"ListaLugaresSalidas",
              @"ListaOrganizaciones",
              @"ListaEstadosMuniciones",
              @"ListaPersonas",
              @"ListaMunicionesDisparadas",
              @"ListaUnidadesMedidas",
              @"ListaAeronavesEjc",
              @"ListaLugaresOperaciones",
              @"ListaUnidadesApoyadas",
              @"ListaMunicipios",
              @"ListaMatriculasAeronaves",
              @"ListaMaterialesAeronave"];
    //NSLog(@"Dicz: %@",dictionary);
    for (int i=0; i<array.count; i++) {
        if ([dictionary objectForKey:array[i]]) {
            NSDictionary *dic = @{@"array":[dictionary objectForKey:array[i]]};
            [file setDictionary:dic withKey:array[i]];
            //NSLog(@"Guardado %i %@:",i,[file getDictionary:array[i]]);
        }
    }
}
-(void)serverError:(NSError *)error withMethodName:(NSString *)method{
     NSLog(@"LLegó este método: %@ y este dic de respuesta %@",method, error);
}
@end
