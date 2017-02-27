//
//  ViewController.m
//  watchOS2-alertBody-not-localized
//
//  Created by Markus Michel on 27.02.17.
//  Copyright © 2017 Markus Michel. All rights reserved.
//

#import "ViewController.h"
@import UserNotifications;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendNotification:(id)sender {
    void (^senderBlock)(BOOL, NSError *) = ^(BOOL granted, NSError * _Nullable error) {
        if (granted == NO) {
            return;
        }
        
        UNMutableNotificationContent *content = [UNMutableNotificationContent new];
        content.sound = [UNNotificationSound defaultSound];
        content.categoryIdentifier = @"issueNotification";

        // this key should be localized when it is set in UILocalNotification.alertBody by the system
        content.body = [NSString localizedUserNotificationStringForKey:@"should_be_localized" arguments:nil];

        UNNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:4.0 repeats:NO];
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"radar.wtf" content:content trigger:trigger];
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:NULL];
    };
    
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionAlert|UNAuthorizationOptionSound completionHandler:senderBlock];
}

@end
