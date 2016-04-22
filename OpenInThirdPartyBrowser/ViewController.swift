/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import UIKit
import WebKit

class ViewController: UIViewController {
    let url = NSURL(string: "https://www.mozilla.org/en-US/firefox/ios/")!

    override func viewDidLoad() {
        super.viewDidLoad()
        let myWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))

        let swiftButton = UIButton(type: UIButtonType.System)
        swiftButton.frame = CGRectMake(100, 100, 200, 50)
        swiftButton.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 150)
        swiftButton.backgroundColor = UIColor.orangeColor()
        swiftButton.setTitle("Open in all browsers with Swift", forState: UIControlState.Normal)
        swiftButton.tintColor = UIColor.whiteColor()
        swiftButton.titleLabel!.adjustsFontSizeToFitWidth = true
        swiftButton.addTarget(self, action: "buttonActionSwift:", forControlEvents: UIControlEvents.TouchUpInside)

        let objCButton = UIButton(type: UIButtonType.System)
        objCButton.frame = CGRectMake(100, 300, 200, 50)
        objCButton.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        objCButton.backgroundColor = UIColor.blueColor()
        objCButton.setTitle("Open in all browsers with Obj-C", forState: UIControlState.Normal)
        objCButton.tintColor = UIColor.whiteColor()
        objCButton.titleLabel!.adjustsFontSizeToFitWidth = true
        objCButton.addTarget(self, action: "buttonActionObjC:", forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(myWebView)
        self.view.addSubview(swiftButton)
        self.view.addSubview(objCButton)
    }

    // Obviously you wouldn't want to open in ALL browsers in your app, you would hide/show
    // browser choices based on isInstalled() and have the user pick
    func buttonActionSwift(sender: UIButton!) {
        for browser in [ThirdPartyBrowser.Brave, ThirdPartyBrowser.Firefox] {
            let controller = OpenInThirdPartyBrowserControllerSwift(browser: browser)
            if controller.isInstalled() {
                controller.openInBrowser(url)
            }
        }
    }

    func buttonActionObjC(sender: UIButton!) {
        for browser in [ThirdPartyBrowserBrave, ThirdPartyBrowserFirefox] {
            let controller = OpenInThirdPartyBrowserControllerObjC(browser: browser)
            if controller.isInstalled() {
                controller.openInBrowser(url)
            }
        }
    }
}