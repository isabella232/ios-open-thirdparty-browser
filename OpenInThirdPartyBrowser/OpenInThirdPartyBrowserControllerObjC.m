/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#import <UIKit/UIKit.h>
#import "OpenInThirdPartyBrowserControllerObjC.h"

static NSString *const firefoxScheme = @"firefox:";

@implementation OpenInThirdPartyBrowserControllerObjC

// Creates a shared instance of the controller.
+ (OpenInThirdPartyBrowserControllerObjC *)sharedInstance {
    static OpenInThirdPartyBrowserControllerObjC *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// Custom function that does complete percent escape for constructing the URL.
static NSString *encodeByAddingPercentEscapes(NSString *string) {
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
    kCFAllocatorDefault,
    (CFStringRef)string,
    NULL,
    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
    kCFStringEncodingUTF8));
    return encodedString;
}

-(instancetype)init
{
    if (self = [super init]) {
        self.scheme = @"brave://";
    }
    return self;
}

// Checks if Firefox is installed.
- (BOOL)isInstalled {
    NSURL *url = [NSURL URLWithString:self.scheme];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

// Opens the URL in Firefox.
- (BOOL)OpenInThirdPartyBrowser:(NSURL *)url {
    if (![self isInstalled]) {
        return NO;
    }

    NSString *scheme = [url.scheme lowercaseString];
    if (![scheme isEqualToString:@"http"] && ![scheme isEqualToString:@"https"]) {
        return NO;
    }

    NSString *urlString = [NSString stringWithFormat:@"%@open-url?url=%@",
                           self.scheme,
                           encodeByAddingPercentEscapes([url absoluteString])];

    // Open the URL with Firefox.
    return [UIApplication.sharedApplication openURL:[NSURL URLWithString: urlString]];
}

@end
