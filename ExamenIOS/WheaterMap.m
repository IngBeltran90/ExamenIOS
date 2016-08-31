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

#define nLat @"20.765890"
#define nLng @"-103.421752"

@interface WheaterMap ()
@end

@implementation WheaterMap{
GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnLoad:(id)sender {
    if (![self.txtLatitud.text isEqual:@""] && ![self.txtLongitud.text isEqual:@""]) {
        [self qeueLoadData];
    }
    else {
        self.lblCityName.text = @"Error, campo vacío";
    }
    
}

/**********************************************************************************************/
#pragma mark - Task methods
/**********************************************************************************************/
- (void)qeueLoadData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = YES;
    [self.activityLoad startAnimating];
    
    NSOperationQueue *queue         = [NSOperationQueue new];
    NSInvocationOperation *opGet    = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadData) object:nil];
    [queue addOperation:opGet];
    
    NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    [opDidGet addDependency:opGet];
    [queue addOperation:opDidGet];
}
//----------------------------------------------------------------------------------------------
- (void)loadData {
    print(NSLog(@"Antes del Json"))
    NSString *latText = [NSString stringWithFormat:@"%f", (self.locationLatitude)];
    NSString *lonText = [NSString stringWithFormat:@"%f", (self.locationLongitude)];
    
    
    
    mjsonGeo = [WebServices getWeatherWithLatitude:latText AndLongitude:lonText];
    //mjsonGeo = [WebServices getWeatherWithLatitude:@"20.765890" AndLongitude:@"-103.421752"];

    print(NSLog(@"JoBe mjsonGeo  = %@",mjsonGeo))
}
//----------------------------------------------------------------------------------------------
- (void)didLoadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        ObjectResponse *object          = [Parser parseGeoObject];
        Coord *coordObject              = object.coord;
        float lat                       = coordObject.lat;
        float lng                       = coordObject.lon;
        NSString *stName                = object.name;
        
        MainObject *mainObject          = object.main;
        //float tempCelsius               = mainObject.temp - 273.15;
        
        //self.lblTempValue.text          = [NSString stringWithFormat:@"%.1f", tempCelsius];
        //self.lblTempValue.text          = [self.lblTempValue.text  stringByAppendingString:@" ºC"];
        self.lblPressureVal.text      = [NSString stringWithFormat:@"%f", mainObject.pressure];
        self.lblHumedadVal.text      = [NSString stringWithFormat:@"%f", mainObject.humidity];
        self.lblTempMinVal.text       = [NSString stringWithFormat:@"%f", mainObject.temp_min];
        self.lblTempMaxVal.text       = [NSString stringWithFormat:@"%f", mainObject.temp_max];
        self.lblSeaLevelVal.text      = [NSString stringWithFormat:@"%f", mainObject.sea_level];
        //self.lblGroundLevel.text        = [NSString stringWithFormat:@"%f", mainObject.grnd_level];
        
        
        self.lblCityName.text          = stName;
        print(NSLog(@"We are at %@ with latitude %f and longitude %f",stName, lat, lng))
        [UIApplication sharedApplication].networkActivityIndicatorVisible   = NO;
        [self.activityLoad stopAnimating];
    });
}

- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.locationLatitude
                                                            longitude:self.locationLongitude
                                                                 zoom:self.locationZoom];
    
    mapView_ = [GMSMapView mapWithFrame:self.viewSubMap.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    
    [mapView_ animateToCameraPosition:camera];
    [self.view addSubview:self.viewSubMap];
    [self.viewSubMap addSubview:mapView_];

    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(self.locationLatitude, self.locationLongitude);
    marker.title = @"Mi Casa";
    marker.snippet = @"Zapopan";
    marker.map = mapView_;
}

@end
