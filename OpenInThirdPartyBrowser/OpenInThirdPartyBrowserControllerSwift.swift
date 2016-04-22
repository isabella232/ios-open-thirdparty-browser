/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import UIKit

public class OpenInThirdPartyBrowserControllerSwift {
    let scheme = "brave://"
    var basicURL:NSURL {get {
        return NSURL(string: scheme)!
        }}

    // This would need to be changed if used from an extension… but you
    // can't open arbitrary URLs from an extension anyway.
    let app = UIApplication.sharedApplication()

    private func encodeByAddingPercentEscapes(input: NSString) -> NSString {
        return CFURLCreateStringByAddingPercentEscapes(
            kCFAllocatorDefault,
            input as CFStringRef,
            nil,
            "!*'();:@&=+$,/?%#[]" as CFStringRef,
            kCFStringEncodingASCII)
    }

    public func isInstalled() -> Bool {
        return app.canOpenURL(basicURL)
    }

    public func OpenInThirdPartyBrowser(url: NSURL) ->  Bool {
        if !isInstalled() {
            return false
        }

        let scheme = url.scheme
        if scheme == "http" || scheme == "https" {
            let escaped = encodeByAddingPercentEscapes(url.absoluteString)
            if let url = NSURL(string: "\(self.scheme)open-url?url=\(escaped)") {
                return app.openURL(url)
            }
        }
        return false
    }
}
