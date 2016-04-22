# Opening links in Firefox and Brave for iOS #
This open-source project provides support for opening links in third party browsers for iOS. There are classes (for Objective-C and Swift), along with a sample project that uses them, available for reference and use. 

### Using OpenInThirdPartyBrowserControllerSwift or OpenInThirdPartyBrowserControllerObjC to open links ###
Thes classes provide methods that handle the making of custom URI schemes, checking if Firefox or Brave (or others if we want to add more) is installed on the device and opening the URL in the browser. Swift and Objective-C implementations of these classes are provided to accommodate your language of choice.

### Methods ###
* `isInstalled`: returns true if  installed
* `openInBrowser`: opens the specified URL; used with or without the following:

### The Custom URL ###
The URI schemes are  `firefox://` and `brave://`. The scheme accepts the following query parameter:
* `url`: (required) the URL to open.

For Example: 
```
firefox://open-url?url=https%253A%252F%252Fwww.mozilla.org%252Fen-US%252Fnewsletter%252Fios%252F
```
### Walkthrough ###
1. Download the class file in the language of your choice:
  * Swift: OpenInThirdPartyBrowserControllerSwift.swift
  * Objective-C: OpenInThirdPartyBrowserControllerObjC.m and OpenInThirdPartyBrowserControllerSwiftObjC.h
2. Whitelist the Firefox and Brave URL scheme in Info.plist, under the LSApplicationQueriesSchemes key:
  * Add `firefox` and `brave` to LSApplicationQueriesSchemes
  * If LSApplicationQueriesSchemes isn't already in your app's Info.plist, you can just manually add it
  * In depth example on how to do that [here](http://useyourloaf.com/blog/querying-url-schemes-with-canopenurl.html)
3. Call method `openInBrowser(url)` on OpenInThirdPartyBrowserController(Swift/ObjC)
