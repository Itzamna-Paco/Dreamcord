//
//  ParseStarterProjectViewController.m
//  ParseStarterProject
//
//  Copyright 2014 Parse, Inc. All rights reserved.
//

#import "ParseStarterProjectViewController.h"
#import <FacebookSDK/FacebookSDK.h>



@implementation ParseStarterProjectViewController

#pragma mark - UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
 //   [PFUser logOut];
    
    [super viewDidLoad];
   // PFUser* currentUser=[PFUser currentUser];
    
    
    
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
    
    if([PFUser currentUser]){
        
        
        self.user = [PFUser currentUser];
    }
    
    NSLog(@"user>>> %@", [self.user objectForKey:@"username"] );
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:YES];
    
    
   
    if ([PFUser currentUser].objectId == nil) {
        
        
        
        LoginVC *login=[[LoginVC alloc] init];
        
        
        
        [login setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil] ];
        login.fields = PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton | PFLogInFieldsFacebook | PFLogInFieldsTwitter | PFLogInFieldsDismissButton | PFLogInFieldsUsernameAndPassword;
        
        login.delegate=self;
        login.signUpController.delegate=self;
       
        [self presentViewController:login animated:NO completion:nil];
    } else {
    
        NSLog(@"We have a user signed in. so present home vc");
        [self presentHomeVC];
    
    }
    
    
    
    
    
  
    
   
}

-(void)presentHomeVC{
    
    HomeViewController* homevc = [[HomeViewController alloc] init];
    NSLog(@"%@",[[PFUser currentUser]valueForKey:@"username"]);
    
    homevc.user=[PFUser currentUser];
    NSLog(@"USER: %@", [[PFUser currentUser] valueForKey:@"username"  ]);
    
    homevc.user=[PFUser currentUser];
    [self presentViewController:homevc animated:YES completion:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
      [self dismissViewControllerAnimated:NO completion:NULL];
    
    HomeViewController* homevc = [[HomeViewController alloc] init];
    NSLog(@"%@",[[PFUser currentUser]valueForKey:@"username"]);
    
    homevc.user=[PFUser currentUser];
    NSLog(@"USER: %@", [[PFUser currentUser] valueForKey:@"username"  ]);
    
    homevc.user=user;
    [self presentViewController:homevc animated:YES completion:nil];
    
    
  
}
-(void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user{
    
    
     [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void) signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
