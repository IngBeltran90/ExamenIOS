//
//  WebServices.h
//  ExamenIOS
//
//  Created by Philbert on 8/30/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject
+ (NSDictionary *)getWeatherWithLatitude:(NSString *)latitude AndLongitude:(NSString*)longitude;
+ (NSDictionary*) sendPost:(NSString*)postUrl forData:(NSString *)data andMode:(BOOL)mode;
@end
