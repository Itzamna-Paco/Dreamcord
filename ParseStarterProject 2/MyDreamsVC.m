//
//  MyDreamsVC.m
//  Dreamcord
//
//  Created by Francisco Salazar on 10/9/14.
//
//

#import "MyDreamsVC.h"

@interface MyDreamsVC ()

@end

@implementation MyDreamsVC

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
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"clouds-seamless-background.jpg"]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    /*
     *   If the cell is nil it means no cell was available for reuse and that we should
     *   create a new one.
     */
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCell"]  ;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.tintColor=[UIColor clearColor];
    cell.textLabel.text=@"A Dreamcord";
    return cell;
}



- (IBAction)goBack:(id)sender {
    NSLog(@"REmove from superview");
    [self.delegate myDreamsVCDidExit:self];
}
@end
