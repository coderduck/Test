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
    else if(textField == streetAddressText)
    {
        [streetAddressText resignFirstResponder];
        [cityText becomeFirstResponder];
        
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
    cityText.delegate = self;
    cityText.returnKeyType = UIReturnKeyNext;
    
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
-(void) fetchPetData
{
    
    /*
    
    NSURL *url = [[NSURL alloc]init];
    [url initWithString:@"https://darkwing.dsmynas.com/api/Pet/1"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    // Fetch the JSON response
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    // Make synchronous request
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&response
                                                error:&error];
    
    // Construct a String around the Data from the response
    NSString *result = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];

    NSLog(@"%@", result);
     */
    /*
    CFMutableDictionaryRef securityDictRef = CFDictionaryCreateMutable (kCFAllocatorDefault,
                                                                        0 ,
                                                                        & kCFTypeDictionaryKeyCallBacks,
                                                                        & kCFTypeDictionaryValueCallBacks);
    NSString *urlString = @"https://darkwing.dsmynas.com/api/Pet/1";
    NSError *error = nil;
    NSHTTPURLResponse *response = nil;
    NSURLRequest *request = [NSURLRequest
                             requestWithURL:[NSURL URLWithString:urlString]
                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                             timeoutInterval:5.0];
    
    
    NSData *conn = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ];
    */
    
    
    /*
    NSString *urlAsString = [NSString stringWithFormat:@"https://darkwing.dsmynas.com/api/Pet/1"];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            //[self.delegate fetchingGroupsFailedWithError:error];
        } else {
            //[self.delegate receivedGroupsJSON:data];
        }
    }];
    */
     
    /*
    
    NSString *query = @"https://darkwing.dsmynas.com/api/Pet/1";
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error] : nil;
    
    
    
    
    NSString *text = [results objectForKey:@"text"];
    NSLog(@"%@", text);
     
    */
}

- (IBAction)backgroundTouched:(id)sender {
    if([firstNameText isFirstResponder])
        [firstNameText resignFirstResponder];
    else if([lastNameText isFirstResponder])
        [lastNameText resignFirstResponder];
    else if([streetAddressText isFirstResponder])
        [streetAddressText resignFirstResponder];
    else if([cityText isFirstResponder])
        [cityText resignFirstResponder];
    else if([zipText isFirstResponder])
        [zipText resignFirstResponder];

}


- (IBAction)saveButton:(id)sender {
}

- (IBAction)testButton:(id)sender {
    [self fetchPetData];
    
}
@end
