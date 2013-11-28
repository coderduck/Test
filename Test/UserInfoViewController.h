//
//  UserInfoViewController.h
//  Test
//
//  Created by Edward Jo on 11/17/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface UserInfoViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource,NSFetchedResultsControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate> {
    NSMutableData *_responseData;
    NSArray *states;
    NSArray *pets;
}

@property (weak, nonatomic) IBOutlet UITextField *firstNameText;
@property (weak, nonatomic) IBOutlet UITextField *lastNameText;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressText;
@property (weak, nonatomic) IBOutlet UITextField *cityText;
@property (weak, nonatomic) IBOutlet UITextField *zipText;


@property (weak, nonatomic) IBOutlet UIPickerView *statePicker;
- (IBAction)saveButton:(id)sender;
- (IBAction)testButton:(id)sender;


-(void) fetchPetData;
- (IBAction)backgroundTouched:(id)sender;

@end
