/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#import <Foundation/Foundation.h>

// This class is used to check if Firefox is installed in the system and
// to open a URL in Firefox either with or without a callback URL.
@interface OpenInThirdPartyBrowserControllerObjC : NSObject

// Returns a shared instance of the OpenInThirdPartyBrowserControllerObjC.
+ (OpenInThirdPartyBrowserControllerObjC *)sharedInstance;

// Returns YES if Firefox is installed in the user's system.
- (BOOL)isInstalled;

// Opens a URL in Firefox.
- (BOOL)OpenInThirdPartyBrowser:(NSURL *)url;

@property NSString *scheme;
@end
