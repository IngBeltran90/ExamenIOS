//
//  WheaterMap.m
//  ExamenIOS
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import "WheaterMap.h"
@import GoogleMaps;
#import <GoogleMaps/GoogleMaps.h>

@interface WheaterMap ()

@end

@implementation WheaterMap
GMSMapView *mapView_;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:20.676491
                                                            longitude:-103.339999
                                                                 zoom:15
                                 //bearing:0
                                 //viewingAngle:0
                                 ];
    
    mapView_ = [GMSMapView mapWithFrame:self.viewSubMap.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    [self.view addSubview:self.viewSubMap];
    [self.viewSubMap addSubview:mapView_];

    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(20.676491, -103.339999);
    marker.title = @"Joyeria Amande";
    marker.snippet = @"Guadalajara";
    marker.map = mapView_;
}


@end
