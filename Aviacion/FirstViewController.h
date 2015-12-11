//
//  FirstViewController.h
//  Aviacion
//
//  Created by Andres Abril on 27/08/15.
//  Copyright (c) 2015 iAmStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerCommunicator.h"

@interface FirstViewController : UIViewController<ServerCommunicatorDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@end
