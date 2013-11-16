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


#pragma mark - IBActions


- (IBAction)chooseExistingPhoto:(id)sender {
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

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
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
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickTheButton:(id)sender
{
    NSLog(@"%@", dogNameText.text);
    dogNameLabel.text = dogNameText.text;
    
    //  1
    Pet * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Pet"
                                                      inManagedObjectContext:self.managedObjectContext];
    //  2
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    NSNumber *weightNumber = [formatter numberFromString: dogWeightText.text];

    newEntry.name = dogNameText.text;
    newEntry.weight = weightNumber;
    
    
    
    
    //  3
    NSError *error;
    if (![self.managedObjectContext save:&error])
    {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
   
    //  5
    [self.view endEditing:YES];
    NSLog(@"Saved..");
    

    
}

- (IBAction)dogWeightSlider:(id)sender {
    float weight = dogWeightS.value;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    NSString *weightText = [formatter stringFromNumber:[NSNumber numberWithFloat:weight]];
    dogWeightText.text = weightText;
    
}

- (IBAction)testButton:(id)sender {
    
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    NSNumber *weightNumber = [formatter numberFromString: dogWeightText.text];
    
    NSLog(@"%@", weightNumber);
    DataController *dh = [[DataController alloc]init];
    NSLog(@"%d", dh.getDiceRoll);
}


@end
