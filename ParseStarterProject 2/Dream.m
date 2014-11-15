//
//  Dream.m
//  Dreamcord
//
//  Created by Francisco Salazar on 10/21/14.
//
//

#import "Dream.h"
#import <Parse/PFObject+Subclass.h>

@implementation Dream

@dynamic dreamAudioFilePath, dreamDate, dreamDreamer, dreamText, dreamTitle;

+(void)load{
    
    
    [self registerSubclass];
}
+(NSString*)parseClassName{
    
    return @"Dream";
    
}

@end
