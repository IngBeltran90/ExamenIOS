//
//  ViewController.m
//  ExamenIOS
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnContinuar:(id)sender {
    [self performSegueWithIdentifier:@"Selection" sender:self];
}

/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //if ([segue.destinationViewController isKindOfClass:[MunicipalityLocation class]]) {
    //    MunicipalityLocation *Municipality     = [segue destinationViewController];
    //    Municipality.municipalityTitleLoc        = self.municipalityTitle;
    //}
}


@end
