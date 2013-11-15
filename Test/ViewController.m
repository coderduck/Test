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

@interface ViewController ()


@end

@implementation ViewController
@synthesize dogNameText;
@synthesize dogNameLabel;
@synthesize dogWeightText;
@synthesize dogWeightS;


#pragma mark - IBActions

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
    newEntry.name = dogNameText.text;
    
    //  3
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
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


@end
