// Copyright 2018-present 650 Industries. All rights reserved.

#import <EXNotifications/EXServerRegistrationModule.h>

static NSString * const kEXDeviceInstallUUIDKey = @"EXDeviceInstallUUIDKey";
static NSString * const kEXRegistrationInfoKey = @"EXNotificationRegistrationInfoKey";

@implementation EXServerRegistrationModule

UM_EXPORT_MODULE(NotificationsServerRegistrationModule)

UM_EXPORT_METHOD_AS(getInstallationIdAsync,
                    getInstallationIdAsyncWithResolver:(UMPromiseResolveBlock)resolve
                                              rejecter:(UMPromiseRejectBlock)reject)
{
  resolve([self getInstallationId]);
}

- (NSString *)getInstallationId
{
  NSString *uuid = [[NSUserDefaults standardUserDefaults] stringForKey:kEXDeviceInstallUUIDKey];
  if (!uuid) {
    uuid = [[NSUUID UUID] UUIDString];
    [[NSUserDefaults standardUserDefaults] setObject:uuid forKey:kEXDeviceInstallUUIDKey];
  }
  return uuid;
}

UM_EXPORT_METHOD_AS(getRegistrationInfoAsync,
                    getRegistrationInfoAsyncWithResolver:(UMPromiseResolveBlock)resolve
                                                rejecter:(UMPromiseRejectBlock)reject)
{
  resolve([[NSUserDefaults standardUserDefaults] stringForKey:kEXRegistrationInfoKey]);
}

UM_EXPORT_METHOD_AS(setRegistrationInfoAsync,
                    setRegistrationInfoAsync:(NSString *)registrationInfo
                                    resolver:(UMPromiseResolveBlock)resolve
                                    rejecter:(UMPromiseRejectBlock)reject)
{
  [[NSUserDefaults standardUserDefaults] setObject:registrationInfo forKey:kEXRegistrationInfoKey];
  resolve(nil);
}

@end
