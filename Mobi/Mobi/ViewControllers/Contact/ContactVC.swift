//
//  ContactVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/8/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class ContactVC: BaseViewController {
    
    @IBOutlet weak var lbVersion: UILabel!
    
    static func initWithStoryboard() -> ContactVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactVC") as! ContactVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBannerVideo(0.4)
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        super.setupUI()
        self.navigationItem.title = NSLocalizedString("M_CONTAST", comment: "")
        self.lbVersion.text = "v\(String(describing: ez.appVersion!)).\(String(describing: ez.appBuild!))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
