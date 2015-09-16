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
@interface FirstViewController (){
    UIViewController *mVC;
    ServerCommunicator *server;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    server = [[ServerCommunicator alloc]init];
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

@end
