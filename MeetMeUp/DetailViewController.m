//
//  EventDetailViewController.m
//  MeetMeUp
//
//  Created by May Yang on 11/3/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet UILabel *rsvpCount;
@property (weak, nonatomic) IBOutlet UILabel *hostingGroup;
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.groupName.text = [self.eventDetails objectForKey:@"name"];

    NSNumber *rsvpCountNumber = [self.eventDetails objectForKey:@"yes_rsvp_count"];
    NSString *rsvpCountString = [NSString stringWithFormat:@"RSVP Count: %@", rsvpCountNumber];
    self.rsvpCount.text = rsvpCountString;

    NSDictionary *groupInfoDictionary = [self.eventDetails objectForKey:@"group"];
    NSString *groupInfoString = [groupInfoDictionary objectForKey:@"name"];
    self.hostingGroup.text = groupInfoString;

    NSString *description = [self.eventDetails objectForKey:@"description"];
    [self.webView loadHTMLString:description baseURL:nil];

//    self.eventDescription.text = [self.eventDetails objectForKey:@"description"];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webVC = segue.destinationViewController;
    NSString *urlString = [self.eventDetails objectForKey:@"event_url"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webVC.urlRequest = request;
}


@end
