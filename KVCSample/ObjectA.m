//
//  ObjectA.m
//  KVCSample
//
//  Created by yaozhuoyu on 14-4-10.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "ObjectA.h"

@interface ObjectA()
{
    NSString *novisStringC;
}

@end

@implementation ObjectA

- (NSString *)description
{
    return [NSString stringWithFormat:@"stringInstanceA %@, integerInstanceA %d, stringA %@, integerA %d novisStringC %@", stringInstanceA, integerInstanceA, _stringA, _integerA, novisStringC];
}

- (void)setNilValueForKey:(NSString *)key
{
    NSLog(@"key %@, %s",key, __func__);
}

- (void)changeStringAValue:(NSString *)value
{
    _stringA = value;
}

- (void)changeStringInstanceAValue:(NSString *)value
{
    stringInstanceA = value;
}
@end
