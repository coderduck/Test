//
//  Pet.h
//  Test
//
//  Created by Mark Tran on 11/14/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Pet : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * breed;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSData * fixed;

@end
