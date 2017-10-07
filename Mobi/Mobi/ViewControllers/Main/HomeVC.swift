//
//  HomeVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/5/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeVC - viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func setLeftMenuButtonImage() {
        var _leftButton:UIButton!
        _leftButton = UIButton(frame: CGRect(x: 10, y: 0, width: 44, height: 44))
        _leftButton?.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0)
        _leftButton?.tintColor = UIColor.white
        _leftButton?.addTarget(self, action: #selector(self._leftMenuButtonClicked(_:)), for: .touchUpInside)
        _leftButton?.setImage(UIImage(named: "ic_menu"), for: UIControlState())
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: _leftButton!)
    }
    
    @IBAction func _leftMenuButtonClicked(_ sender: AnyObject) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapOk(_ sender: UIButton) {
        APPDELEGATE.resetToRootViewLogin { (ok) in
            
        }
    }
    
}
