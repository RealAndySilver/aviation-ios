//
//  MainViewController.m
//  Aviacion
//
//  Created by Andres Abril on 27/08/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import "MainViewController.h"
@interface MainViewController (){
    ServerCommunicator *server;
    MBProgressHUD *hud;
    FileSaver *file;
    NSDictionary *ordenDeVueloDic;
    NSDictionary *fragmentariaDic;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    server = [[ServerCommunicator alloc]init];
    server.delegate = self;
    file = [[FileSaver alloc]init];
    [self checkSavedOrder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)checkSavedOrder{
    ordenDeVueloDic = [file getDictionary:@"OrdenVuelo"];
    
    //NSLog(@"OV: %@",ordenDeVueloDic);
    if ([ordenDeVueloDic objectForKey:@"NroOrden"]) {
         self.ordenDeVueloLabel.text = [ordenDeVueloDic objectForKey:@"NroOrden"];
        self.ordenDeVueloBtn.hidden = NO;
        self.registroDeVueloBtn.hidden = NO;
    }
    else{
        self.ordenDeVueloLabel.text = @"Ninguna";
    }
    [self checkFragmentaria];
}
-(void)checkFragmentaria{
    fragmentariaDic = [file getDictionary:@"OperaFrag"];
    
    
    if ([fragmentariaDic objectForKey:@"IdRequerimiento"]) {
        //NSLog(@"OF: %@",fragmentariaDic);
        self.operacionFragmentariaLabel.text = [fragmentariaDic objectForKey:@"ConsecutivoFrag"];
        self.fragmentariaBtn.hidden = NO;
        self.requerimientoBtn.hidden = NO;
        self.riesgoAlaFijaBtn.hidden = NO;
    }
    else{
        self.operacionFragmentariaLabel.text = @"Ninguna";
    }
}
-(void)disableWhileChecking{
    self.ordenDeVueloBtn.hidden = YES;
    self.registroDeVueloBtn.hidden = YES;
    self.fragmentariaBtn.hidden = YES;
    self.requerimientoBtn.hidden = YES;
    self.riesgoAlaFijaBtn.hidden = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)irAOrdenDeVuelo:(UIButton *)sender {
}

- (IBAction)irARegistroDeVuelo:(UIButton *)sender {
}

- (IBAction)cargarOrdenDeVuelo:(UIButton *)sender {
    [self disableWhileChecking];
    hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Cargando";
    self.operacionFragmentariaLabel.text = @"Cargando";
    self.ordenDeVueloLabel.text = @"Cargando";

    //[server callRESTServerWithPOSTMethod:@"OrdenVuelo" andParameter:@"" options:@"?NroOrden=7&IdAeronave=29"];
    [server callSOAPServerWithMethod:@"OrdenVuelo" andParameter:[NSString stringWithFormat:@"<NroOrden>%@</NroOrden><IdAeronave>%@</IdAeronave>", self.noOrdenTF.text, self.idAeronaveTF.text]];
    if (self.noOrdenTF.text.length>0) {
        if (self.idAeronaveTF.text.length>0) {
            
        }
        else{
            
        }
    }
    else{
        
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
#pragma mark - server delegate
-(void)receivedDataFromServer:(NSDictionary *)dictionary withMethodName:(NSString *)methodName{
    if ([methodName isEqualToString:@"OrdenVuelo"]) {
        
        if ([dictionary objectForKey:@"OrdenVuelo"]) {
            NSString *nroOrden = [[dictionary objectForKey:@"OrdenVuelo"] objectForKey:@"NroOrden"];
            if (nroOrden.length>0) {
                [file setDictionary:[dictionary objectForKey:@"OrdenVuelo"] withKey:@"OrdenVuelo"];
            }
            else {
                [self changeHUDTextAndHideWithDelay:@"Orden de vuelo no recibida. Cargando última orden disponible."];
                [self checkSavedOrder];
                return;
            }
            [file setDictionary:[[dictionary objectForKey:@"OrdenVuelo"] objectForKey:@"OperaFrag"] withKey:@"OperaFrag"];
            [file setDictionary:[[dictionary objectForKey:@"OrdenVuelo"] objectForKey:@"ListaTripulacionOrden"] withKey:@"ListaTripulacionOrden"];
        }
        
        
        //NSDictionary *d = [file getDictionary:@"ListaTripulacionOrden"];
        //NSLog(@"Dix: %@",d);
        
        
        [self changeHUDTextAndHideWithDelay:@"Orden de vuelo cargada con éxito"];
    }
    else if([methodName isEqualToString:@"Fragmentaria"]){
        [self changeHUDTextAndHideWithDelay:@"Operación Fragmentaria cargada con éxito"];
    }
    else{
        [self changeHUDTextAndHideWithDelay:@"Información cargada con éxito"];
    }
    [self checkSavedOrder];
}
-(void)serverError:(NSError *)error withMethodName:(NSString *)method{
    NSLog(@"Error: %@",error);
    [self changeHUDTextAndHideWithDelay:@"Error al cargar información"];
    [self checkSavedOrder];

}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"orden"]) {
        if (ordenDeVueloDic) {
            OrdenDeVueloViewController *ovVC =  [segue destinationViewController];
            ovVC.ordenDic = ordenDeVueloDic;
        }
    }
    else if ([segue.identifier isEqualToString:@"fragmentaria"]) {
        if (fragmentariaDic) {
            OrdenFragmentariaViewController *ofVC =  [segue destinationViewController];
            ofVC.ordenFragmentariaDic = fragmentariaDic;
        }
    }
}
@end
