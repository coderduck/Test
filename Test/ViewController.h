//
//  ViewController.h
//  Test
//
//  Created by Mark Tran on 11/12/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>



@interface ViewController : UIViewController <NSFetchedResultsControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *fixedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet UITextField *breedText;
@property (weak, nonatomic) IBOutlet UITextField *dogNameText;
@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *dogWeightText;
@property (weak, nonatomic) IBOutlet UISlider *dogWeightS;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong)NSArray* fetchedRecordsArray;
@property UIImagePickerController * picker;
@property UIImagePickerController *picker2;
@property UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)backgroundTapped:(UIControl *)sender;
- (IBAction)clickTheButton:(id)sender;
- (IBAction)dogWeightSlider:(id)sender;
- (IBAction)testButton:(id)sender;
- (IBAction)chooseExistingPhoto:(id)sender;



@end