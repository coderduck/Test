//
//  MyDogsViewController.m
//  Test
//
//  Created by Edward Jo on 11/28/13.
//  Copyright (c) 2013 Mark Tran. All rights reserved.
//

#import "MyDogsViewController.h"
#import "AppDelegate.h"
#import "Pet.h"

@interface MyDogsViewController ()
@property (copy) NSMutableArray *myDogNames;
@property (copy) NSMutableArray *myDogBreeds;
@property (copy) NSMutableArray *myDogWeights;
@property (copy) NSMutableArray *myDogFixed;
@property (copy) NSMutableArray *myDogGender;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong)NSArray* fetchedRecordsArray;

@end

@implementation MyDogsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    


    
    // Added a comment where Mark's comment used to be cuz i like #203, i moved him to #204
    // After using mergetool, i chose remote file and manually added this comment
    // fine ill let Ed take 203.  I'll add here.
    
    //loop to print all fetched pet records in array
    
    

    /*
    for (int i = 0; i < self.fetchedRecordsArray.count; i++)
    {
        Pet * pet = [self.fetchedRecordsArray objectAtIndex:i];
        NSLog(@"Dog Name: %@, Breed: %@, Weight: %@, Gender: %@, Fixed: %@", pet.name, pet.breed, pet.weight, pet.gender, pet.fixed);
        [self.myDogNames addObject:pet.name];
        [self.myDogBreeds addObject:pet.breed];
        [self.myDogWeights addObject:pet.weight];
        [self.myDogGender addObject:pet.gender];
        [self.myDogFixed addObject:pet.fixed];

        NSLog(@"In for loop iteration: %d", i);
        NSLog(@"myDogNames @ 0 %@", [myDogNames objectAtIndex:0]);

    }
    */
    

    
    
    self.title = @"My Dogs";
    
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
}

-(void) viewWillAppear: (BOOL) animated
{
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    // Do any additional setup after loading the view, typically from a nib.
    //1
    
    //2
    self.managedObjectContext = appDelegate.managedObjectContext;
    self.fetchedRecordsArray = [[appDelegate getAllPets] mutableCopy] ;
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //if (section == 0) return self.myDogs.count;
    

    return self.fetchedRecordsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     static NSString * CellIdentifier = @"Cell";
     UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     NSString * entry;
     
     if (indexPath.section == 0) {
     entry = self.thingsToLearn[indexPath.row];
     } else {
     entry = self.thingsLearned[indexPath.row];
     }
     cell.textLabel.text = entry;
     */
    
    NSLog(@"Got into cellForRowAtIndexPath");
    
    static NSString *CellIdentifier = @"DogDetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    //Recipe *recipe = [recipes objectAtIndex:indexPath.row];
    Pet * pet = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    
    NSLog(@"Dog Name: %@", pet.name);
    UILabel *dogNameLabel = (UILabel *)[cell viewWithTag:100];
    dogNameLabel.text = pet.name;
    
    UILabel *dogDetailLabel = (UILabel *)[cell viewWithTag:101];
    dogDetailLabel.text = pet.breed;
    
    
    
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //if (section == 0)
    return @"My Dogs";
}

@end
