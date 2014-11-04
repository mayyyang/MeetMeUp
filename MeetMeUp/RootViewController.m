//
//  ViewController.m
//  MeetMeUp
//
//  Created by May Yang on 11/3/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#define kURL @"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=1b4a6943b1b2d56681c436835c4073"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *events;



@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     NSURL *url = [NSURL URLWithString:kURL];
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
     [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (connectionError)
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network Error" message:connectionError.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Gosh Darnit" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:okButton];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.events = [dict objectForKey:@"results"];

//
//            self.resultsKeyArray = self.events[@"results"];
//            [self nestedLevelIterator];


            [self.tableView reloadData];
        }
    }];
//    [self.tableView reloadData];
}


/*
- (void) nestedLevelIterator;
{
    if (!self.itemNameArray) {
        self.itemNameArray = [[NSMutableArray alloc]init];
    }
//    for (NSMutableDictionary *dict in self.resultsKeyArray)
//        for (id *dictionaryItem in self.resultsKeyArray)

    for (int i = 0; i < [self.resultsKeyArray count]; i++)
    {

        NSMutableDictionary *dictItem = self.resultsKeyArray[i];


        NSMutableDictionary *venueItem = [dictItem objectForKey:@"venue"];



//        venueItem = dictItem[@"venue"];

        NSMutableString *itemName = [venueItem objectForKey:@"name"];

        [self.itemNameArray addObject:itemName];

    }
    




//        NSLog(@"Dict is now: %@", dictionaryItem);

//        NSMutableDictionary *venueItem = [NSMutableDictionary dictionaryWithObject:dict forKey:@"venue"];

//        NSMutableDictionary *innerVenue = [NSMutableDictionary dictionaryWithObject:venueItem forKey:@"venue"];

//        NSMutableString *itemName = [NSMutableString string];


//        [self.itemNameArray addObject:itemName];




    }
*/



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *metaDictionary = self.events[indexPath.row];
    NSDictionary *venue = [metaDictionary objectForKey:@"venue"];

    cell.textLabel.text = [metaDictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [venue objectForKey:@"address_1"];

//    NSString *eventName = self.itemNameArray[indexPath.row];
//    cell.textLabel.text = eventName;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.events.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *eventDetailVC = segue.destinationViewController;
    NSInteger rowNumber = [self.tableView indexPathForSelectedRow].row;
    NSDictionary *details = [self.events objectAtIndex:rowNumber];
    eventDetailVC.eventDetails = details;
}

@end
