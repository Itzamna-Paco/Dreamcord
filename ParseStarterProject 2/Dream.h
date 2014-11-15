//
//  Dream.h
//  Dreamcord
//
//  Created by Francisco Salazar on 10/21/14.
/*The model for the dream will contain 5 properties:
 dreamTitle to hold the title
 dreamText to hold the dream Text
 dreamAudioFilePath to hold reference to recording
 dreamDreamer to hold the user that created it
 dreamDate to hold date
 
 
 
 */

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Dream : PFObject<PFSubclassing>

+(NSString*)parseClassName;
@property(nonatomic, strong) NSString * dreamTitle;
@property(nonatomic, strong) NSString * dreamText;
@property(nonatomic, strong) NSDate  * dreamDate;
@property(nonatomic, strong) PFUser  * dreamDreamer;
@property(nonatomic, strong) NSString * dreamAudioFilePath;


@end
