//
//  MisionCumplidaViewController.m
//  Aviacion
//
//  Created by Andres Abril on 16/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "MisionCumplidaViewController.h"

@interface MisionCumplidaViewController ()

@end

@implementation MisionCumplidaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mainScrollView.contentSize=CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height*3.7);
    [self.mainScrollView setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:self.mainScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
