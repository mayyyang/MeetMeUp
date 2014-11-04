//
//  EventDetails.m
//  MeetMeUp
//
//  Created by May Yang on 11/3/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "EventDetails.h"

@implementation EventDetails

-(instancetype) initWithName:(NSString *)eventName withRSVPCount:(NSInteger)rsvpCount withHostingGroupInformation:(NSString *)hostingGroupInformation withEventDescription:(NSString *)eventDescription
{
    self = [super init];
    self.eventName = eventName;
    self.rsvpCount = &(rsvpCount);

    return self;
}

@end
