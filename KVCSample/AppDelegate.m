//
//  AppDelegate.m
//  KVCSample
//
//  Created by yaozhuoyu on 14-4-10.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "AppDelegate.h"
#import "ObjectA.h"
#import <objc/runtime.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *vc = [[UIViewController alloc] init];
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
    [self testKVC];
    return YES;
}

- (void)testKVC
{
    ObjectA *objA = [[ObjectA alloc] init];
    [objA setValue:@"testA" forKey:@"stringA"];
    [objA setValue:@1 forKey:@"integerA"];
    [objA setValue:@"novisString" forKey:@"novisStringC"];
    //objA stringInstanceA (null), integerInstanceA 0, stringA testA, integerA 1 novisStringC novisString
    NSLog(@"objA %@", objA);
    
    
    [objA setValue:@"testInstanceA" forKey:@"stringInstanceA"];
    [objA setValue:@2 forKey:@"integerInstanceA"];
    //objA stringInstanceA testInstanceA, integerInstanceA 2, stringA testA, integerA 1 novisStringC novisString
    NSLog(@"objA %@", objA);
    
    //当把一个nil设置到一个非对象的属性或者变量上的时候，会调用方法setNilValueForKey
    [objA setValue:nil forKey:@"integerInstanceA"];
    
    NSLog(@">>>>>>>>>>>>>>>>>>>>>> 测试数组");
    
    NSArray *objArray = @[[[ObjectA alloc] init],[[ObjectA alloc] init],[[ObjectA alloc] init]];
    [objArray setValue:@"array_string" forKey:@"stringA"];
    NSLog(@"objArray %@", objArray);
    
    id values = [objArray valueForKey:@"stringA"];
    NSLog(@"values %@", values);
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    NSLog(@"////////////////////////////////////////////////////////////////////////////////////////////////");
    NSLog(@"kvo test");
    
    [objA addObserver:self forKeyPath:@"stringA" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    objA.stringA = @"sssinn";
    
    //下面这句话不会引起KVO，因为直接修改的变量
    [objA changeStringAValue:@"dddinn"];
    
    [objA removeObserver:self forKeyPath:@"stringA"];
    
    
    
    [objA addObserver:self forKeyPath:@"stringInstanceA" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    //下面这句话不会引起KVO，因为直接修改的变量
    [objA changeStringInstanceAValue:@"change1"];
    //下面这句话会引起KVO，因为通过KVC
    [objA setValue:@"change2" forKey:@"stringInstanceA"];
    
    [objA removeObserver:self forKeyPath:@"stringInstanceA"];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"keyPath %@  change %@", keyPath, change);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
