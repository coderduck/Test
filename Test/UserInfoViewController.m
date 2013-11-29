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
    
    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"hxxxx"]];

    // Create a mutable (changeable) copy of the immutable request and add more headers
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    [mutableRequest addValue:@"application/json;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [mutableRequest addValue:@"text/html" forHTTPHeaderField:@"Content-Type"];

    request = [mutableRequest mutableCopy];
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    
    
    
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

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    int code = [httpResponse statusCode];
    NSLog(@"HTTP Status Code: %d", code);
    NSLog( @"didReceiveResponse");
    
    if (code < 200 || code > 299)
    {
        [connection cancel];
        NSLog(@"Connection cancelled");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
    NSLog(@"didReceiveData");
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    
    NSLog(@"willCacheResponse");
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSLog(@"connectionDidFinishLoading");
    NSError *error;
    NSDictionary *results = _responseData ? [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error] : nil;
    
    if (results == nil)
    {
        NSLog(@"Invalid JSON Object");
    }
    else
    {
        NSLog(@"%@", results);
        
        NSArray *dogNames = [results objectForKey:@"name"];

        NSLog(@"%@", dogNames);


    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"didFailWithError:");
}
@end
