//
//  ViewController.m
//  Test
//
//  Created by Mark Tran on 11/12/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Pet.h"
#import "AppDelegate.h"
#import "DataController.h"



@implementation ViewController
@synthesize dogNameText;
@synthesize dogNameLabel;
@synthesize dogWeightText;
@synthesize dogWeightS;
@synthesize breedText;
@synthesize fixedControl;
@synthesize genderControl;
@synthesize picker;
@synthesize picker2;
@synthesize imageView;
@synthesize image;

#pragma mark - IBActions
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //code for the done button
    
    
    
    if(textField == breedText) {
        [textField resignFirstResponder];
    }
    else {
        [breedText becomeFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldToNext:(UITextField *)
textField {
    [breedText becomeFirstResponder];
    return YES;
}



- (IBAction)chooseExistingPhoto:(id)sender {
    if ([breedText isFirstResponder]) [breedText resignFirstResponder];
    else if ([dogNameText isFirstResponder]) [dogNameText resignFirstResponder];
    
    picker2 = [[UIImagePickerController alloc]init];
    picker2.delegate = self;
    [picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker2 animated:YES completion:NULL];
    
}



- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //1
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    //2
    self.managedObjectContext = appDelegate.managedObjectContext;
    self.fetchedRecordsArray = [appDelegate getAllPets];

    
    
    
    //code for handling keyboard below
    dogNameText.delegate = self;
    dogNameText.returnKeyType = UIReturnKeyNext;
    breedText.delegate = self;
    breedText.returnKeyType = UIReturnKeyDone;

    
    //end code for handling keyboard
}



- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backgroundTapped:(UIControl *)sender {
    //this method entered whenever you click on anything in the background
    if ([breedText isFirstResponder]) [breedText resignFirstResponder];
    else if ([dogNameText isFirstResponder]) [dogNameText resignFirstResponder];
    

}






- (IBAction)clickTheButton:(id)sender
{
    if ([breedText isFirstResponder]) [breedText resignFirstResponder];
    else if ([dogNameText isFirstResponder]) [dogNameText resignFirstResponder];
    

    
    
    //  1
    Pet * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Pet"
                                                      inManagedObjectContext:self.managedObjectContext];
    //  2
    
    //convert string to number from dogWeightText.text
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    NSNumber *weightNumber = [formatter numberFromString: dogWeightText.text];
    //
    
    

    
    newEntry.name = dogNameText.text;
    newEntry.weight = weightNumber;
    newEntry.breed = breedText.text;
    if([genderControl selectedSegmentIndex] == 0){
       newEntry.gender = @"MALE";
    }
    else if([genderControl selectedSegmentIndex] == 1){
        newEntry.gender = @"FEMALE";
    }
    
    if([fixedControl selectedSegmentIndex] == 0){
        newEntry.fixed = @"YES";
    }
    else if([fixedControl selectedSegmentIndex] == 1){
        newEntry.fixed = @"NO";
    }
    
    //  3
    NSLog(@"Before Save..");
    NSError *error;
    if (![self.managedObjectContext save:&error])
    {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    NSLog(@"Before Save..2");
    //  5
    [self.view endEditing:YES];
    NSLog(@"Saved..");
    

    
}

- (IBAction)dogWeightSlider:(id)sender {
    //hides keyboard
    if ([breedText isFirstResponder]) [breedText resignFirstResponder];
    else if ([dogNameText isFirstResponder]) [dogNameText resignFirstResponder];
    //
    
    //takes dogWeightSlider value and converts it to text displaying it on the dogWeightText field everytime the value on slider changes
    float weight = dogWeightS.value;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    NSString *weightText = [formatter stringFromNumber:[NSNumber numberWithFloat:weight]];
    dogWeightText.text = weightText;
    
}

- (IBAction)testButton:(id)sender {
    if ([breedText isFirstResponder]) [breedText resignFirstResponder];
    else if ([dogNameText isFirstResponder]) [dogNameText resignFirstResponder];
    
    
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedRecordsArray = [appDelegate getAllPets];
    
    // Added a comment where Mark's comment used to be cuz i like #203, i moved him to #204
    // After using mergetool, i chose remote file and manually added this comment
    // fine ill let Ed take 203.  I'll add here.
    
    //loop to print all local pet records in array
    for (int i = 0; i < self.fetchedRecordsArray.count; i++)
    {
        Pet * pet = [self.fetchedRecordsArray objectAtIndex:i];
        NSLog(@"Dog Name: %@, Breed: %@, Weight: %@, Gender: %@, Fixed: %@", pet.name, pet.breed, pet.weight, pet.gender, pet.fixed);
    }
    

    //start code for http get request
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    breedText.text, @"breed",
                                    fixedControl.selectedSegmentIndex==0 ? @"Y" : @"N", @"fixed",
                                    genderControl.selectedSegmentIndex==0 ? @"M" : @"F", @"gender",
                                    dogNameText.text, @"name",
                                    dogWeightText.text, @"weight",
                                    nil];
    
    //NSMutableArray * arr = [[NSMutableArray alloc] init];
    NSError *error;
    //[arr addObject:jsonDictionary];
    NSData *jsonData2 = [NSJSONSerialization dataWithJSONObject:jsonDictionary /*change to arr*/ options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData2 encoding:NSUTF8StringEncoding];
    NSLog(@"jsonData as string:\n%@", jsonString);
    

    
    
    
    NSURL *url = [NSURL URLWithString:@"xxxxxx"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSData *requestData = [NSData dataWithBytes:[jsonString UTF8String] length:[jsonString length]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    //NSMutableData *receivedData = [[NSMutableData alloc]init];
    //_responseData = appendData:data;
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

    NSString* responseString = [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@",responseString);
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"didFailWithError:");
}

@end
