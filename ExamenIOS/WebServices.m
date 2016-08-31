//
//  WebServices.m
//  ExamenIOS
//
//  Created by Philbert on 8/30/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import "WebServices.h"

#import "WebServices.h"
#import "Declarations.h"

#define nURLMain            @"http://api.openweathermap.org/data/2.5/"
#define nURLByGeoCoord      @"weather?lat="

#define nGET                0
#define nPOST               1
#define nAPPID              @"56c64ab8cd011e60acee9d64e51123e7"


@implementation WebServices
//Customize methods
+ (NSDictionary *)getWeatherWithLatitude:(NSString *)latitude AndLongitude:(NSString*)longitude {
    print(NSLog(@"getWeatherWithLatitude"))
    NSMutableDictionary *diData = [[NSMutableDictionary alloc] init];
    NSString  *stData           = [diData JSONRepresentation];
    
    NSString *stURL = [nURLMain stringByAppendingString:nURLByGeoCoord];
    print(NSLog(@"String URL: %@",stURL))
    print(NSLog(@"latitude URL: %@",latitude))
    print(NSLog(@"longitude URL: %@",longitude))
    
    stURL           = [stURL stringByAppendingString:latitude];
    
    print(NSLog(@"Si llego"))
    
    stURL           = [stURL stringByAppendingString:@"&lon="];
    stURL           = [stURL stringByAppendingString:longitude];
    stURL           = [stURL stringByAppendingString:@"&appid="];
    stURL           = [stURL stringByAppendingString:nAPPID];
    
    
    return [self sendPost:stURL forData:stData andMode:nGET];
}

/**********************************************************************************************/
#pragma mark - json common method
/**********************************************************************************************/
+ (NSDictionary*) sendPost:(NSString*)postUrl forData:(NSString *)data andMode:(BOOL)mode {
    @try {
        NSString *post;
        if (mode) {
            //Post method
            post = [[NSString alloc] initWithFormat:@"data=%@", data];
        }
        else {
            //Get method
            post = [[NSString alloc] initWithFormat:@""];
        }
        print(NSLog(@"post parameters: %@",post))
        post                    = [post stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSURL *url              = [NSURL URLWithString:postUrl];
        print(NSLog(@"URL post  = %@", url))
        NSData *postData        = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength    = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        if (mode) {
            [request setHTTPMethod:@"POST"];
        }
        else {
            [request setHTTPMethod:@"GET"];
        }
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"UAG_1.0" forHTTPHeaderField:@"User-Agent"];
        [request setHTTPBody:postData];
        [NSURLRequest requestWithURL:url];
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        //Check response
        print(NSLog(@"[response statusCode] %d",(int)[response statusCode]))
        print(NSLog(@"[response] %@",response))
        
        if ([response statusCode] >=200 && [response statusCode] <308) {
            //get json response
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
            print(NSLog(@"response received %@",jsonResponse))
            
            //return response
            return jsonResponse;
        }
        else { if (error) {print(NSLog(@"Error response")) return nil; } else {print(NSLog(@"Conect Fail"))return nil;}
            return nil;
        }
    }
    @catch (NSException * e) {print(NSLog(@"Exception")) return nil;}
}

@end
