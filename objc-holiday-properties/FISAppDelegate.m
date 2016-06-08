//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (NSArray *)holidaysInSeason:(NSString *)season {
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    return self.database[season][holiday];
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    if ([[self.database[season] allKeys] containsObject:holiday]) {
        return YES;
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    if ([self.database[season][holiday] containsObject:supply]) {
        
        return YES;
        
    }
    return NO;
}



- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    [self.database[season] setValue:@[] forKey:holiday];
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    [self.database[season][holiday] addObject:supply];

}


- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
    NSArray *keys = [self.database[season] allKeys];
    if ([keys containsObject:holiday]) {
        
        return YES;
        
    }
    return NO;
    
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSMutableArray *holidayArray = [[NSMutableArray alloc] init];
    [self.database[season] setValue:holidayArray forKey:holiday];
    return self.database;
    
}


- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    [self.database[season][holiday] addObject:supply];
    return self.database;
    
}

@end
