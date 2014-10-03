/*
 Copyright 2014 OpenMarket Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXRoomData.h"

@interface MXRoomData ()
{
    NSMutableArray *events;
    NSMutableArray *stateEvents;
}
@end

@implementation MXRoomData

- (id)initWithRoomId:(NSString *)room_id
{
    self = [super init];
    if (self)
    {
        _room_id = room_id;
        events = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)events
{
    return events;
}

- (NSArray *)stateEvents
{
    return stateEvents;
}

- (BOOL)handleEvent:(MXEvent*)event
        isLiveEvent:(BOOL)isLiveEvent isStateEvent:(BOOL)isStateEvent
            pagFrom:(NSString*)pagFrom
{
    NSLog(@"handleEvent: %@", event.type);
    if (!isStateEvent)
    {
        if (isLiveEvent)
        {
            [events addObject:event];
        }
        else
        {
            [events insertObject:event atIndex:0];
        }
    }
    else
    {
        [stateEvents addObject:event];
    }

    return YES;
}


@end