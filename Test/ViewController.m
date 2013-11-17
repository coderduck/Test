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


#pragma mark - IBActions
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //code for the done button
    [breedText becomeFirstResponder];
    
    
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
    [dogNameText resignFirstResponder];
    [breedText resignFirstResponder];
    
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
    NSLog(@"%@", self.fetchedRecordsArray);
    
    
    
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
    [dogNameText resignFirstResponder];
    [breedText resignFirstResponder];
    

}






- (IBAction)clickTheButton:(id)sender
{
    [dogNameText resignFirstResponder];
    [breedText resignFirstResponder];
    
    NSLog(@"%@", dogNameText.text);
    dogNameLabel.text = dogNameText.text;
    
    
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
    [dogNameText resignFirstResponder];
    [breedText resignFirstResponder];
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
    [dogNameText resignFirstResponder];
    [breedText resignFirstResponder];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    NSNumber *weightNumber = [formatter numberFromString: dogWeightText.text];
    
    NSLog(@"%@", weightNumber);
    DataController *dh = [[DataController alloc]init];
    NSLog(@"%d", dh.getDiceRoll);
}


@end
