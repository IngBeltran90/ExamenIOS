//
//  GeoApi.h
//  Web Services
//
//  Created by Walter Gonzalez Domenzain on 15/07/16.
//  Copyright © 2016 UAG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"
#import "MainObject.h"

@interface ObjectResponse : NSObject
@property (nonatomic,strong) Coord *coord;
@property (nonatomic,strong) MainObject *main;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *laonda;
@end
