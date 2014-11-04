//
//  EventDetails.h
//  MeetMeUp
//
//  Created by May Yang on 11/3/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDetails : NSObject
@property NSString *eventName;
@property NSInteger *rsvpCount;
@property NSString *hostingGroupInformation;
@property NSString *eventDescription;

- (instancetype) initWithName: (NSString *)eventName withRSVPCount:(NSInteger)rsvpCount withHostingGroupInformation:(NSString *)hostingGroupInformation withEventDescription:(NSString *)eventDescription;

@end
