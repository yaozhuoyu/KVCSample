//
//  ObjectA.h
//  KVCSample
//
//  Created by yaozhuoyu on 14-4-10.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectA : NSObject
{
    NSString *stringInstanceA;
    NSUInteger integerInstanceA;
}

@property (nonatomic, strong) NSString *stringA;
@property (nonatomic, assign) NSUInteger integerA;


- (void)changeStringAValue:(NSString *)value;
- (void)changeStringInstanceAValue:(NSString *)value;

@end
