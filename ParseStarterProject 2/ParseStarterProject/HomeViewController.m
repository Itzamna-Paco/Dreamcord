//
//  HomeViewController.m
//  ParseStarterProject
//
//  Created by Francisco Salazar on 10/2/14.
//
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

double myCounter=0;

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
    
     
    
    NSLog(@"Home VC did load with %@", [self.user valueForKey:@"username"] );
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"clouds-seamless-background.jpg"]];
   
    self.usrNameLbl.textColor=[UIColor whiteColor];
    
    
    self.usrNameLbl.text=[self.user valueForKey:@"username"];
   //  welcomeLabel.text=[[PFUser currentUser]valueForKey:@"username"];
    [self.view addSubview:self.usrNameLbl];
    
    [self performSelector:@selector(doThis:) withObject:self afterDelay:0];
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

-(void)callMe:(NSTimer*)sender{
    myCounter++;
    
    
    NSLog(@"timer running...");
    
    if (myCounter>40) {
        
        [self.cloudBG removeFromSuperview];
    }
}

- (IBAction)doThis:(id)sender {
    
    
   // self.dreamcordLabel.layer.anchorPoint = CGPointMake(200, 300);
   // self.dreamcordLabel.layer.contentsGravity = @"center";
   // self.dreamcordLabel.layer.bounds =CGRectMake(self.dreamcordLabel.frame.origin.x, self.dreamcordLabel.frame.origin.y, self.dreamcordLabel.frame.size.width, self.dreamcordLabel.frame.size.height);
    
    
   // [self.dreamcordLabel.layer setAnchorPoint:CGPointMake(300, 300  )];
    
    [NSTimer scheduledTimerWithTimeInterval:0.70
                                     target:self
                                   selector:@selector(callMe:)
                                   userInfo:nil
                                    repeats:YES];
    
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 8.0f;
    animation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue =[NSNumber numberWithFloat:.2];
    animation.toValue = [NSNumber numberWithFloat:0.9];
    animation.autoreverses = YES;
    animation.repeatCount = 1.e10f;
    
    CABasicAnimation*scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.toValue=[NSNumber numberWithFloat:1.125];
   
    scaleAnimation.duration= 4.5f;
    scaleAnimation.autoreverses=YES;
    scaleAnimation.repeatCount=1.e10f;
    
    CABasicAnimation*bganimation = [CABasicAnimation animationWithKeyPath:@"position"];
    bganimation.duration=62.0f;
    bganimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    bganimation.autoreverses=NO;
    //bganimation.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
    bganimation.toValue=[NSValue valueWithCGPoint:CGPointMake(-self.cloudBG.frame.size.width, 0)];
    bganimation.removedOnCompletion=YES;
    
    CABasicAnimation*bganimationScale =[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    bganimationScale.duration=62.0f;
    bganimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
     bganimationScale.fromValue=[NSNumber numberWithFloat:0.4];
     bganimationScale.toValue=[NSNumber numberWithFloat:0.725];
     bganimationScale.autoreverses=NO;
    
    CABasicAnimation* bganimationOpacity=[CABasicAnimation animationWithKeyPath:@"opacity"];
    bganimationOpacity.duration=30.0f;
    bganimationOpacity.autoreverses=NO;
    bganimationOpacity.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    bganimationOpacity.fromValue =[NSNumber numberWithFloat:1.0];
    bganimationOpacity.toValue = [NSNumber numberWithFloat:0.0];
    
    [self.cloudBG.layer addAnimation:bganimationOpacity forKey:@"opacity"]    ;
                           
    [self.cloudBG.layer addAnimation:bganimation forKey:@"position"];
    [self.cloudBG.layer addAnimation:bganimationScale forKey:@"transform.scale"];
    
    [self.dreamcordLabel.layer addAnimation:scaleAnimation forKey:@"scale"];
    
    [self.dreamcordLabel.layer addAnimation:animation forKey:@"opacity"];
    
}

- (IBAction)loadMyDreams:(id)sender {
    
    NSLog(@"loadMyDreams");
    MyDreamsVC * myDreamsVC=[ [MyDreamsVC alloc] init];
    myDreamsVC.delegate = self;
    
    [self presentViewController:myDreamsVC animated:YES completion:nil];
    
    
    
}
#pragma mark delegate methods
- (IBAction)loadNewDream:(id)sender {
    
    
    NewDreamVC *addNewDreamVController =[[NewDreamVC alloc] init];
    addNewDreamVController.delegate = self;
    [self presentViewController:addNewDreamVController animated:YES completion:nil];
    
    NSLog(@"loadNewDream");
}
-(void)myDreamsVCDidExit:(MyDreamsVC*)controller{
    NSLog(@"removed from superview");
    [controller dismissViewControllerAnimated:NO completion:nil];
}

-(void)newDreamVCDidExit:(NewDreamVC*) controller{
    NSLog(@"newDreamsVCDIDExit");
    [controller dismissViewControllerAnimated:NO completion:nil];
    
}
-(void)newDreamVCDidExitWithDream: (NewDreamVC*)controller andDream:(Dream*)aDream{
    NSLog(@"newDReamsVCDidExitWithDream");
    
    
}
@end
