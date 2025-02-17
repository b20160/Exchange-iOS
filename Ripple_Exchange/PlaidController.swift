//
//  PlaidController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class PlaidViewController:UIViewController,WKNavigationDelegate {
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the link url
        let linkUrl = generateLinkInitializationURL()
        let url = URL(string: linkUrl)
        let request = URLRequest(url: url!)
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = false
        
        webView.frame = view.frame
        webView.scrollView.bounces = false
        self.view.addSubview(webView)
        webView.load(request)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // getUrlParams :: parse query parameters into a Dictionary
    func getUrlParams(url: URL) -> Dictionary<String, String> {
        var paramsDictionary = [String: String]()
        let queryItems = URLComponents(string: (url.absoluteString))?.queryItems
        queryItems?.forEach { paramsDictionary[$0.name] = $0.value }
        return paramsDictionary
    }
    
    // generateLinkInitializationURL :: create the link.html url with query parameters
    func generateLinkInitializationURL() -> String {
        let config = [
            "key": "c2aef4bd8b20d50c52f286bf399db7",
            "env": "sandbox",
            "apiVersion": "v2", // set this to "v1" if using the legacy Plaid API
            "product": "auth",
            "selectAccount": "true",
            "clientName": "Test App",
            "isMobile": "true",
            "isWebview": "true",
            "webhook": "https://requestb.in",
            ]
        
        // Build a dictionary with the Link configuration options
        // See the Link docs (https://plaid.com/docs/quickstart) for full documentation.
        var components = URLComponents()
        components.scheme = "https"
        components.host = "cdn.plaid.com"
        components.path = "/link/v2/stable/link.html"
        components.queryItems = config.map { URLQueryItem(name: $0, value: $1) }
        return components.string!
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping ((WKNavigationActionPolicy) -> Void)) {
        
        let linkScheme = "plaidlink";
        let actionScheme = navigationAction.request.url?.scheme;
        let actionType = navigationAction.request.url?.host;
        let queryParams = getUrlParams(url: navigationAction.request.url!)
        
        if (actionScheme == linkScheme) {
            switch actionType {
                
            case "connected"?:
                // Close the webview
                _ = self.navigationController?.popViewController(animated: true)
                
                // Parse data passed from Link into a dictionary
                // This includes the public_token as well as account and institution metadata
                print("Public Token: \(String(describing: queryParams["public_token"]))");
                print("Account ID: \(String(describing: queryParams["account_id"]))");
                print("Institution type: \(String(describing: queryParams["institution_type"]))");
                print("Institution name: \(String(describing: queryParams["institution_name"]))");
                
                let CLIENT_ID = "58d58e5a4e95b819440e4a09"
                let SECERT = "42c2952b3572b6f92af993daf65ac9"
                let PUBLIC_TOKEN = queryParams["public_token"]
                let ACCOUNT_Id = queryParams["account_id"]
                
                
                break
                
            case "exit"?:
                // Close the webview
                _ = self.navigationController?.popViewController(animated: true)
                
                // Parse data passed from Link into a dictionary
                // This includes information about where the user was in the Link flow
                // any errors that occurred, and request IDs
                print("URL: \(String(describing: navigationAction.request.url?.absoluteString))")
                // Output data from Link
                print("User status in flow: \(String(describing: queryParams["status"]))");
                // The requet ID keys may or may not exist depending on when the user exited
                // the Link flow.
                print("Link request ID: \(String(describing: queryParams["link_request_id"]))");
                print("Plaid API request ID: \(String(describing: queryParams["link_request_id"]))");
                break
                
            default:
                print("Link action detected: \(String(describing: actionType))")
                break
            }
            
            decisionHandler(.cancel)
        } else if (navigationAction.navigationType == WKNavigationType.linkActivated &&
            (actionScheme == "http" || actionScheme == "https")) {
            // Handle http:// and https:// links inside of Plaid Link,
            // and open them in a new Safari page. This is necessary for links
            // such as "forgot-password" and "locked-account"
            UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
        } else {
            print("Unrecognized URL scheme detected that is neither HTTP, HTTPS, or related to Plaid Link: \(String(describing: navigationAction.request.url?.absoluteString))");
            decisionHandler(.allow)
        }
    }
}
