// 
// Copyright 2021 The Matrix.org Foundation C.I.C
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "MXBooleanCapability.h"

static NSString* const kJSONKeyEnabled = @"enabled";

@interface MXBooleanCapability ()

@property (nonatomic, readwrite, getter=isEnabled) BOOL enabled;

@end

@implementation MXBooleanCapability

+ (instancetype)modelFromJSON:(NSDictionary *)JSONDictionary
{
    if (JSONDictionary[kJSONKeyEnabled])
    {
        MXBooleanCapability *result = [MXBooleanCapability new];

        MXJSONModelSetBoolean(result.enabled, JSONDictionary[kJSONKeyEnabled]);

        return result;
    }
    return nil;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.enabled = [aDecoder decodeBoolForKey:kJSONKeyEnabled];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:self.isEnabled forKey:kJSONKeyEnabled];
}

@end
