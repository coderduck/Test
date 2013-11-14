//
//  ViewController.h
//  Test
//
//  Created by Mark Tran on 11/12/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *dogNameText;
@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;


- (IBAction)clickTheButton:(id)sender;

@end
