//
//  DataController.m
//  Test
//
//  Created by Mark Tran on 11/13/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import "DataController.h"

@implementation DataController

- (int)getDiceRoll
{
    int roll = (arc4random() % 6) + 1;
    
    return roll;
    
}

@end
