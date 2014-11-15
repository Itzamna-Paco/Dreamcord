//
//  NewDreamVC.h
//  Dreamcord
//
//  Created by Francisco Salazar on 10/9/14.
//
//

#import <UIKit/UIKit.h>
#import "Dream.h"
@protocol NewDreamsVCDelegate;

@interface NewDreamVC : UIViewController
@property (nonatomic, strong) id<NewDreamsVCDelegate>delegate;



- (IBAction)goBackHome:(id)sender;
@end

@protocol NewDreamsVCDelegate

-(void)newDreamVCDidExit:(NewDreamVC*) controller;
-(void)newDreamVCDidExitWithDream: (NewDreamVC*)controller andDream:(Dream*)aDream;


@end