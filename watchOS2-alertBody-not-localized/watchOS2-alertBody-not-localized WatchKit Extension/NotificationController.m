//
//  NotificationController.m
//  watchOS2-alertBody-not-localized WatchKit Extension
//
//  Created by Markus Michel on 27.02.17.
//  Copyright © 2017 Markus Michel. All rights reserved.
//

#import "NotificationController.h"


@interface NotificationController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *alertBody;

@end


@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

// watchOS 2.x method
- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    self.alertBody.text = localNotification.alertBody; // content of alertBody should be the finally localized string not just the key, right?
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

@end



