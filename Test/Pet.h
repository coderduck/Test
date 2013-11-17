//
//  Pet.h
//  Test
//
//  Created by Edward Jo on 11/16/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Pet : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * breed;
@property (nonatomic, retain) NSString * fixed;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * id;

@end
