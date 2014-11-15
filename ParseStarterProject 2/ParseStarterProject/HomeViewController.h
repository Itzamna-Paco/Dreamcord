//
//  HomeViewController.h
//  ParseStarterProject
//
//  Created by Francisco Salazar on 10/2/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MyDreamsVC.h"
#import "NewDreamVC.h"

@interface HomeViewController : UIViewController <MyDreamsVCDelegate, NewDreamsVCDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *cloudBG;
@property (strong, nonatomic) IBOutlet UILabel *dreamcordLabel;
@property (nonatomic, strong) PFUser *user;
@property (nonatomic, strong) IBOutlet UIButton *myDreamsButton;
@property (strong, nonatomic) IBOutlet UILabel *usrNameLbl;

@property(strong, nonatomic) MyDreamsVC *myDreamsVC;
@property(strong, nonatomic) NewDreamVC *addNewDreamVC;
- (IBAction)doThis:(id)sender;
 
- (IBAction)loadMyDreams:(id)sender;

- (IBAction)loadNewDream:(id)sender;
-(IBAction)goBack:(id)sender;

@end
