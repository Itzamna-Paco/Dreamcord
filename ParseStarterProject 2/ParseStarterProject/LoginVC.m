//
//  LoginVC.m
//  ParseStarterProject
//
//  Created by Francisco Salazar on 10/2/14.
//
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.logInView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"clouds-seamless-background.jpg"]];
    
   
    
    // Do any additional setup after loading the view.
}
-(void)viewDidLayoutSubviews{
    
    UILabel *logoLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0, 400, 300)];
    [logoLabel setText:@"DreamCord"];
    
    self.logInView.logo=logoLabel;
    [ self.logInView.logo setFrame:CGRectMake(20, 20, 400, 300)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
