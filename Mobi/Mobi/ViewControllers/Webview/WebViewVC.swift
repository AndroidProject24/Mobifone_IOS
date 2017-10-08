//
//  WebViewVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/8/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: BaseViewController {

    @IBOutlet weak var webView: WKWebView!
    var strUrl : String?
    
    static func initWithStoryboard() -> WebViewVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewVC") as! WebViewVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // loading URL :
        let url = URL(string: strUrl!);
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url!));
    }
    
    override func setupUI() {
        super.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTitlePage(title: String) {
        self.navigationItem.title = title
    }
}

extension WebViewVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
    }
}
