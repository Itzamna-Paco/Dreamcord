//
//  MyDreamsVC.h
//  Dreamcord
//
//  Created by Francisco Salazar on 10/9/14.
//
//

#import <UIKit/UIKit.h>
#import "Dream.h"


@protocol MyDreamsVCDelegate;




@interface MyDreamsVC : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)id<MyDreamsVCDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *myDreamsArray;

- (IBAction)goBack:(id)sender;


@end

@protocol MyDreamsVCDelegate

-(void)myDreamsVCDidExit:(MyDreamsVC*)controller;
-(void)myDreamsVCDidSelectDream:(Dream*)aDream;

@end