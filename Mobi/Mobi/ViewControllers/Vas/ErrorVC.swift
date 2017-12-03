//
//  ErrorVC.swift
//  Mobi
//
//  Created by Hoang Do on 11/3/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ErrorVC: BaseViewController {
    
    static func initWithStoryboard() -> ErrorVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ErrorVC") as! ErrorVC
        return viewController;
    }
    
    override func setupUI() {
        super.setupUI()
        self.showBannerVideo(0.1)
        
        self.navigationItem.title = NSLocalizedString("M_VAS", comment: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Action

    @IBAction func onTapComeBack(_ sender: UIGestureRecognizer) {
        popVC()
    }
    

}
