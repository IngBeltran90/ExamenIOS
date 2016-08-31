//
//  WheaterMap.h
//  ExamenIOS
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Declarations.h"

@interface WheaterMap : UIViewController

@property double locationLatitude;
@property double locationLongitude;
@property double locationZoom;

@property (strong, nonatomic) IBOutlet UILabel *lblCityName;
@property (strong, nonatomic) IBOutlet UILabel *lblPressureVal;
@property (strong, nonatomic) IBOutlet UILabel *lblHumedadVal;
@property (strong, nonatomic) IBOutlet UILabel *lblTempMinVal;
@property (strong, nonatomic) IBOutlet UILabel *lblTempMaxVal;
@property (strong, nonatomic) IBOutlet UILabel *lblSeaLevelVal;
@property (strong, nonatomic) IBOutlet UITextField *txtLatitud;
@property (strong, nonatomic) IBOutlet UITextField *txtLongitud;
@property (strong, nonatomic) IBOutlet UIButton *btnLoad;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityLoad;
- (IBAction)btnLoad:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewSubMap;

@end
