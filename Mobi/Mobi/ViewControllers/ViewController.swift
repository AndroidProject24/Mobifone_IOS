//
//  ViewController.swift
//  Mobi
//
//  Created by HeoConUnIn on 9/23/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ServiceManager.sharedInstance.SearchSim(bySearch: "", byStore: StoreNumber.TraSau.getString(), byFirstNumber: "", byTypeNumber: "", _completion: { (codeResponse, SimObj) in
            print(String(" con cho : \(String(describing: SimObj?.count))"))
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

