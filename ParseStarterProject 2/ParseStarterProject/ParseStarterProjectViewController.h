//
//  ParseStarterProjectViewController.h
//  ParseStarterProject
//
//  Copyright 2014 Parse, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LoginVC.h"
#import "HomeViewController.h"

@interface ParseStarterProjectViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate > {
    
    
    
}
@property (nonatomic, strong) LoginVC *loginvc;
@property (nonatomic, strong) HomeViewController *homevc;
@property (strong, nonatomic) PFUser *user;

@end
