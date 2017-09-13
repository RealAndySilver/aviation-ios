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
    //self.registroDeVueloBtn.hidden = NO;
    self.title = @"Home";
    
    //Check if there is any saved order
    //[self checkSavedOrder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)checkSavedOrder{
    FileSaver *file2 = [[FileSaver alloc]init];
    //NSLog(@"Departamentos %@",[file2 getDictionary:@"ListaLugaresfore"]);
    
    //Get order from file class
    ordenDeVueloDic = [file2 getDictionary:@"OrdenVuelo"];
    
    //NSLog(@"OV: %@",ordenDeVueloDic);
    //If NroOrden Key found
    if ([ordenDeVueloDic objectForKey:@"NroOrden"]) {
        
        //Show title with order number and unhide buttons
        self.ordenDeVueloLabel.text = [ordenDeVueloDic objectForKey:@"NroOrden"];
        self.ordenDeVueloBtn.hidden = NO;
        self.registroDeVueloBtn.hidden = NO;
        //self.misionCumplidaBtn.hidden = NO;
    }
    else{
        //If not found, show none as label text
        self.ordenDeVueloLabel.text = @"Ninguna";
    }
    [self checkFragmentariaSingleCall:NO];
}
-(void)checkFragmentariaSingleCall:(BOOL)singleCall{
    fragmentariaDic = [file getDictionary:@"OperaFrag"];
    
    
    if ([fragmentariaDic objectForKey:@"IdRequerimiento"]) {
        //NSLog(@"OF: %@",fragmentariaDic);
        self.fragmentariaTF.text = @"";
        self.operacionFragmentariaLabel.text = [fragmentariaDic objectForKey:@"ConsecutivoFrag"];
        self.fragmentariaBtn.hidden = NO;
        self.requerimientoBtn.hidden = NO;
        self.riesgoAlaFijaBtn.hidden = NO;
        self.riesgoAlaRotatoriaBtn.hidden = NO;
        if (singleCall) {
            ordenDeVueloDic = nil;
            self.ordenDeVueloLabel.text = @"Ninguna";
            self.ordenDeVueloBtn.hidden = YES;
            self.registroDeVueloBtn.hidden = YES;
            self.misionCumplidaBtn.hidden = YES;
            self.noOrdenTF.text = @"";
            //self.idAeronaveTF.text = @"";
        }
    }
    else{
        self.operacionFragmentariaLabel.text = @"Ninguna";
    }
    
}
-(void)disableWhileChecking{
    self.ordenDeVueloBtn.hidden = YES;
    self.registroDeVueloBtn.hidden = YES;
    self.misionCumplidaBtn.hidden = YES;
    self.fragmentariaBtn.hidden = YES;
    self.requerimientoBtn.hidden = YES;
    self.riesgoAlaFijaBtn.hidden = YES;
    self.riesgoAlaRotatoriaBtn.hidden = YES;
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
    [self dismissInputView];
    [self disableWhileChecking];
    hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Cargando";
    self.operacionFragmentariaLabel.text = @"Cargando";
    self.ordenDeVueloLabel.text = @"Cargando";

    //[server callRESTServerWithPOSTMethod:@"OrdenVuelo" andParameter:@"" options:@"?NroOrden=7&IdAeronave=29"];
    //[server callSOAPServerWithMethod:@"OrdenVuelo" andParameter:[NSString stringWithFormat:@"<NroOrden>%@</NroOrden><IdAeronave>%@</IdAeronave>", self.noOrdenTF.text, self.idAeronaveTF.text]];
    //[server callRESTServerWithPOSTMethod:@"OrdenVueloDescripcion" andParameter:[NSString stringWithFormat:@"NroOrden=%@&IdAeronave=%@", self.noOrdenTF.text,self.idAeronaveTF.text] endpoint:@"ConsultasGenerales"];
    [server callRESTServerWithPOSTMethod:@"OrdenVueloDescripcion" andParameter:[NSString stringWithFormat:@"NroOrden=%@", self.noOrdenTF.text] endpoint:@"WS_SICCA/RESTConsultasGenerales"];
    if (self.noOrdenTF.text.length>0) {
        if (self.idAeronaveTF.text.length>0) {
            
        }
        else{
            
        }
    }
    else{
        
    }
}

- (IBAction)cargarOrdenFragmentaria:(UIButton *)sender {
    [self dismissInputView];
    
    [self disableWhileChecking];
    hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Cargando";
    self.operacionFragmentariaLabel.text = @"Cargando";
    [server callRESTServerWithPOSTMethod:@"OperaFragDescripcion" andParameter:[NSString stringWithFormat:@"ConsecutivoFrag=%@", self.fragmentariaTF.text] endpoint:@"WS_SICCA/RESTConsultasGenerales"];
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
    FileSaver *file2 = [[FileSaver alloc]init];
    if ([methodName isEqualToString:@"OrdenVueloDescripcion"]) {
        
        if ([dictionary objectForKey:@"OrdenVuelo"]) {
            NSString *nroOrden = [[dictionary objectForKey:@"OrdenVuelo"] objectForKey:@"NroOrden"];
            //NSLog(@"Orden %@",[dictionary objectForKey:@"OrdenVuelo"]);
            if (nroOrden.length>0) {
                [file2 setDictionary:[dictionary objectForKey:@"OrdenVuelo"] withKey:@"OrdenVuelo"];
            }
            else {
                [self changeHUDTextAndHideWithDelay:@"Orden de vuelo no recibida. Cargando última orden disponible."];
                [self checkSavedOrder];
                return;
            }
            [file2 setDictionary:[[dictionary objectForKey:@"OrdenVuelo"] objectForKey:@"OperaFrag"] withKey:@"OperaFrag"];
            [file2 setDictionary:[[[dictionary objectForKey:@"OrdenVuelo"] objectForKey:@"OperaFrag"] objectForKey:@"Requerimiento"] withKey:@"Requerimiento"];
            [file2 setDictionary:[[dictionary objectForKey:@"OrdenVuelo"] objectForKey:@"ListaTripulacionOrden"] withKey:@"ListaTripulacionOrden"];
        }
        
        
        //NSDictionary *d = [file getDictionary:@"ListaTripulacionOrden"];
        //NSLog(@"Dix: %@",d);
        
        
        [self changeHUDTextAndHideWithDelay:@"Orden de vuelo cargada con éxito"];
    }
    else if([methodName isEqualToString:@"OperaFragDescripcion"]){
        //NSLog(@"Dictionary %@",dictionary);
        NSString *ordenFrag = [[dictionary objectForKey:@"OperaFrag"] objectForKey:@"ConsecutivoFrag"];
        if (ordenFrag.length>0) {
            [file2 setDictionary:[dictionary objectForKey:@"OperaFrag"] withKey:@"OperaFrag"];
            [file2 setDictionary:[[dictionary objectForKey:@"OperaFrag"] objectForKey:@"Requerimiento"] withKey:@"Requerimiento"];
            [self changeHUDTextAndHideWithDelay:@"Operación Fragmentaria cargada con éxito"];
            [self checkFragmentariaSingleCall:YES];
            return;
        }
        else {
            [self changeHUDTextAndHideWithDelay:@"Orden fragmentaria no recibida. Cargando última orden disponible."];
            [self checkSavedOrder];
            return;
        }
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
    else if ([segue.identifier isEqualToString:@"requerimiento"]) {
        if (fragmentariaDic) {
            RequerimientoViewController *rVC =  [segue destinationViewController];
            rVC.requerimientoDic = [fragmentariaDic objectForKey:@"Requerimiento"];
        }
    }
    else if ([segue.identifier isEqualToString:@"mision"]) {
        if (ordenDeVueloDic) {
            MisionCumplidaViewController *mcVC =  [segue destinationViewController];
            mcVC.ordenDic = ordenDeVueloDic;
            mcVC.requerimientoDic = [fragmentariaDic objectForKey:@"Requerimiento"];
            mcVC.fragmentariaDic = fragmentariaDic;
        }
    }
    else if ([segue.identifier isEqualToString:@"registro"]) {
        if (ordenDeVueloDic) {
            RegistroDeVueloViewController *rvVC =  [segue destinationViewController];
            rvVC.ordenDic = ordenDeVueloDic;
            rvVC.requerimientoDic = [fragmentariaDic objectForKey:@"Requerimiento"];
        }
    }
}

#pragma mark - dismiss input view
-(void)dismissInputView{
    [self.noOrdenTF becomeFirstResponder];
    [self.noOrdenTF resignFirstResponder];
}
@end
