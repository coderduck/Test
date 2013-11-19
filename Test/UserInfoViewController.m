//
//  UserInfoViewController.m
//  Test
//
//  Created by Edward Jo on 11/17/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import "UserInfoViewController.h"
#import "AppDelegate.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

@synthesize firstNameText;
@synthesize lastNameText;
@synthesize streetAddressText;
@synthesize cityText;
@synthesize zipText;
@synthesize statePicker;

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //code for the done button
    
    
    
    if(textField == firstNameText) {
        [textField resignFirstResponder];
        [lastNameText becomeFirstResponder];
        
    }
    else if(textField == lastNameText){
        [lastNameText resignFirstResponder];
        [streetAddressText becomeFirstResponder];
    }
    return YES;
}

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
	// Do any additional setup after loading the view.
    
    states = [[NSArray alloc] initWithObjects:@"Connecticutt", @"Delaware", @"Massachusetts",@"New Jersey", @"New York", nil];
    

    
    firstNameText.delegate = self;
    firstNameText.returnKeyType = UIReturnKeyNext;
    lastNameText.delegate = self;
    lastNameText.returnKeyType = UIReturnKeyNext;
    streetAddressText.delegate = self;
    streetAddressText.returnKeyType = UIReturnKeyNext;
    

}
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return states.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [states objectAtIndex:row];
}

- (IBAction)saveButton:(id)sender {
}

- (IBAction)testButton:(id)sender {

}
@end
