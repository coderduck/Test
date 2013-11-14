//
//  ViewController.m
//  Test
//
//  Created by Mark Tran on 11/12/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *dogname;
@property (weak, nonatomic) IBOutlet UILabel *nameSaved;

@end

@implementation ViewController

#pragma mark - IBActions

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickTheButton:(id)sender
{
    NSLog(@"%@", _dogname.text);
    _nameSaved.text = _dogname.text;
    
}

@end
