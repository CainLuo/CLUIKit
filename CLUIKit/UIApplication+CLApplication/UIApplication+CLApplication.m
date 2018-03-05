//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIApplication+CLApplication.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/3/5.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UIApplication+CLApplication.h"

#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBook.h>
#import <EventKit/EventKit.h>

@implementation UIApplication (CLApplication)

#pragma mark - 权限查询
+ (BOOL)cl_getApplicationLocationPermit {
    
    BOOL cl_authorizedAlways    = [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways;
    BOOL cl_authorizedWhenInUse = [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse;

    if (cl_authorizedAlways || cl_authorizedWhenInUse) {
        
        return YES;
    }

    return NO;
}

+ (BOOL)cl_getApplicationAddressBookPermit {
    
    if (@available(iOS 9.0, *)) {
        
        BOOL cl_authorizationStatusAuthorized = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized;
        
        return cl_authorizationStatusAuthorized;
        
    } else {
    
        BOOL cl_authorizationStatusAuthorized = ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized;
        
        return cl_authorizationStatusAuthorized;
    }
}

+ (BOOL)cl_getApplicationCameraPermit {
    
    BOOL cl_authorizationStatusAuthorized = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent] == EKAuthorizationStatusAuthorized;
    
    return cl_authorizationStatusAuthorized;
}

+ (BOOL)cl_getApplicationRemindersPermit {
    
    BOOL cl_authorizationStatusAuthorized = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] == EKAuthorizationStatusAuthorized;
    
    return cl_authorizationStatusAuthorized;
}

+ (BOOL)cl_getApplicationPhotosLibraryPermit {
    
    BOOL cl_authorizationStatusAuthorized = [PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized;
    
    return cl_authorizationStatusAuthorized;
}

+ (void)cl_getApplicationMicrophonePermitWithBlock:(CLPermissionBlock)block {

    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        
        if (block) {
            block(granted);
        }
    }];
}

@end
