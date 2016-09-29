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

#define RESTENDPOINT @"http://app.sinte.co:8383/WS_SICCA/REST"

@interface FirstViewController (){
    UIViewController *mVC;
    ServerCommunicator *server;
    MBProgressHUD *hud;
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
    
    self.title = @"Login";
    //[file setDictionary:@{@"listsDownloaded":@NO} withKey:@"ListsInfo"];
    
    //Si no existe diccionario de ListaAeronaveEscoltaFac traer datos del servidor
    //if (![file getDictionary:@"ListaAeronaveEscoltaFac"]) {
    
    
    if([[[file getDictionary:@"EndpointInfo"] objectForKey:@"url"] length] > 0){
        self.endpointTF.text = [[file getDictionary:@"EndpointInfo"] objectForKey:@"url"];
    }
    else{
        NSLog(@"Nope %@",[[file getDictionary:@"EndpointInfo"] objectForKey:@"url"]);
        self.endpointTF.text = RESTENDPOINT;
        [file setDictionary:@{@"url":RESTENDPOINT} withKey:@"EndpointInfo"];
    }
    
    if([[[file getDictionary:@"ListsInfo"] objectForKey:@"listsDownloaded"] boolValue] == YES){
    }
    else{
        //[self downloadLists];
    }
    //self.userTF.text = [[file getDictionary:@"User"] objectForKey:@"username"];
    //self.passwordTF.text = [[file getDictionary:@"User"] objectForKey:@"password"];
    
    
    
}
- (void)downloadLists{
    hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Descargando listas. Esta operación puede tomar unos minutos.";
    [server callRESTServerWithGETMethod:@"listas" andParameter:@"" endpoint:@"Listas"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    if([self.userTF.text isEqualToString:@"admin"] && [self.passwordTF.text isEqualToString:@"siccaplmnko0"]){
        [self showEndpoint];
        return;
    }
    if([[[file getDictionary:@"ListsInfo"] objectForKey:@"listsDownloaded"] boolValue] == YES){
        if([self.userTF.text length]){
            if([self.passwordTF.text length]){
                hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                hud.labelText = @"Cargando";
                [server callRESTServerWithPOSTMethod:@"login" andParameter:[NSString stringWithFormat:@"user=%@&pass=%@", self.userTF.text,self.passwordTF.text] endpoint:@"ConsultasGenerales"];
            }
        }
    }
    else{
        [self downloadLists];
    }
    
    
}
-(void)showEndpoint{
    self.endpointTF.text = [[file getDictionary:@"EndpointInfo"] objectForKey:@"url"];
    self.endpointContainerView.hidden = NO;
}
- (IBAction)downloadLists:(UIButton *)sender {
    [self downloadLists];
}
-(void)goToNextVC{
    mVC = [[MainViewController alloc]init];
    mVC=[self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self.navigationController pushViewController:mVC animated:YES];
    self.endpointContainerView.hidden = YES;
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return NO;
}

- (IBAction)saveEndpoint:(UIButton *)sender {
    if(self.endpointTF.text.length > 0){
        NSLog(@"Yes");
        [file setDictionary:@{@"url":self.endpointTF.text} withKey:@"EndpointInfo"];
    }
    else{
        NSLog(@"NO");
        [file setDictionary:@{@"url":RESTENDPOINT} withKey:@"EndpointInfo"];
    }
    NSLog(@"Guardado %@ endpoint length %@",[[file getDictionary:@"EndpointInfo"] objectForKey:@"url"], self.endpointTF.text);
    self.endpointContainerView.hidden = YES;
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
    if([methodName isEqualToString:@"listas"]){
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
                  @"ListaPersonasOV",
                  @"ListaMunicionesDisparadas",
                  @"ListaUnidadesMedidas",
                  @"ListaAeronavesEjc",
                  @"ListaLugaresOperaciones",
                  @"ListaUnidadesApoyadas",
                  @"ListaMunicipios",
                  @"ListaMatriculasAeronaves",
                  @"ListaMaterialesAeronave",
                  @"ListaPuntosArmamento",
                  @"ListaNumerosOrdenesVuelosSinRegistrosVuelos",
                  @"ListaOperacionesOVNoReg",
                  @"ListaUnidadesApoyadasOV",
                  @"ListaMConfig"];
        //NSLog(@"Dicz: %@",dictionary);
        for (int i=0; i<array.count; i++) {
            if ([dictionary objectForKey:array[i]]) {
                NSDictionary *dic = @{@"array":[dictionary objectForKey:array[i]]};
                [file setDictionary:dic withKey:array[i]];
                //NSLog(@"Guardado %i %@:",i,[file getDictionary:array[i]]);
            }
        }
        [file setDictionary:@{@"listsDownloaded":@YES} withKey:@"ListsInfo"];
        [self changeHUDTextAndHideWithDelay:@"Listas descargadas!"];
    }
    else if([methodName isEqualToString:@"login"]){
        BOOL status = [dictionary objectForKey:@"status"] ? [[dictionary objectForKey:@"status"] boolValue]:NO;
        if(status){
            //Login exitoso
            [self changeHUDTextAndHideWithDelay:@"Login Exitoso"];
            [file setDictionary:@{@"username":self.userTF.text, @"password":self.passwordTF.text} withKey:@"User"];
            [self goToNextVC];
        }
        else{
            //Login fallido
            [self changeHUDTextAndHideWithDelay:@"Usuario ó Contraseña incorrectos"];
        }
    }
}
-(void)serverError:(NSError *)error withMethodName:(NSString *)method{
    NSLog(@"LLegó este método: %@ y este dic de respuesta %@",method, error);
    if([method isEqualToString:@"login"]){
        if([self.userTF.text isEqualToString:[[file getDictionary:@"User"] objectForKey:@"username"]]){
            if([self.passwordTF.text isEqualToString:[[file getDictionary:@"User"] objectForKey:@"password"]]){
                [self changeHUDTextAndHideWithDelay:@"Login offline Exitoso"];
                [self goToNextVC];
            }
        }
        else{
            [self changeHUDTextAndHideWithDelay:@"Error de internet.."];
        }
    }
    else if([method isEqualToString:@"listas"]){
        [self changeHUDTextAndHideWithDelay:@"Las listas no pudieron ser cargadas."];
    }
}
#pragma mark delayed hud
-(void)changeHUDTextAndHideWithDelay:(NSString*)text{
    hud.labelText=text;
    [self performSelector:@selector(hideHud) withObject:nil afterDelay:2.0];
}
-(void)hideHud{
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
}
@end
