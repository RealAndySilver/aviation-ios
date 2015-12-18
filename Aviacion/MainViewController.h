//
//  MainViewController.h
//  Aviacion
//
//  Created by Andres Abril on 27/08/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerCommunicator.h"
#import "MBProgressHUD.h"
#import "OrdenDeVueloViewController.h"
#import "OrdenFragmentariaViewController.h"
#import "RequerimientoViewController.h"
@interface MainViewController : UIViewController<ServerCommunicatorDelegate>
@property (weak, nonatomic) IBOutlet UITextField *noOrdenTF;
@property (weak, nonatomic) IBOutlet UITextField *idAeronaveTF;
@property (weak, nonatomic) IBOutlet UITextField *fragmentariaTF;
@property (weak, nonatomic) IBOutlet UILabel *ordenDeVueloLabel;
@property (weak, nonatomic) IBOutlet UILabel *operacionFragmentariaLabel;
@property (weak, nonatomic) IBOutlet UIButton *ordenDeVueloBtn;
@property (weak, nonatomic) IBOutlet UIButton *registroDeVueloBtn;
@property (weak, nonatomic) IBOutlet UIButton *misionCumplidaBtn;
@property (weak, nonatomic) IBOutlet UIButton *fragmentariaBtn;
@property (weak, nonatomic) IBOutlet UIButton *requerimientoBtn;
@property (weak, nonatomic) IBOutlet UIButton *riesgoAlaFijaBtn;
@property (weak, nonatomic) IBOutlet UIButton *riesgoAlaRotatoriaBtn;

- (IBAction)irAOrdenDeVuelo:(UIButton *)sender;
- (IBAction)irARegistroDeVuelo:(UIButton *)sender;
- (IBAction)cargarOrdenDeVuelo:(UIButton *)sender;
- (IBAction)cargarOrdenFragmentaria:(UIButton *)sender;
@end
