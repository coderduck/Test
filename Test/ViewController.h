//
//  ViewController.h
//  Test
//
//  Created by Mark Tran on 11/12/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dogNameText;
@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *dogWeightText;
@property (weak, nonatomic) IBOutlet UISlider *dogWeightS;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong)NSArray* fetchedRecordsArray;

- (IBAction)clickTheButton:(id)sender;
- (IBAction)dogWeightSlider:(id)sender;

@end