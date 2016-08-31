//
//  OCMapperConfig.m
//  ExamenIOS
//
//  Created by Philbert on 8/30/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import "OCMapperConfig.h"
#import "Declarations.h"
#import "OCMapper.h"

@implementation OCMapperConfig
+ (void)configure {
    InCodeMappingProvider *inCodeMappingProvider = [[InCodeMappingProvider alloc] init];
    CommonLoggingProvider *commonLoggingProvider = [[CommonLoggingProvider alloc] initWithLogLevel:LogLevelError];
    
    [[ObjectMapper sharedInstance] setMappingProvider:inCodeMappingProvider];
    [[ObjectMapper sharedInstance] setLoggingProvider:commonLoggingProvider];
    
    /******************* Customized objects **********************/
    
}
@end
