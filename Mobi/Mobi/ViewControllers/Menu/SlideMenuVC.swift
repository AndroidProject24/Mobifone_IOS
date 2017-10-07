//
//  SlideMenuVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/5/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class SlideMenuVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SlideMenuVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayStringMenuLeft.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return arrayStringMenuLeft[section][0].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BannerTableViewCell.self), for: indexPath) as! BannerTableViewCell
            return cell
        
        } else {
            if indexPath.section == 2 && indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath) as! HeaderTableViewCell
                cell.config(title: arrayStringMenuLeft[indexPath.section][0][indexPath.row])
                return cell
            
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuTableViewCell.self), for: indexPath) as! MenuTableViewCell
                cell.config(title: arrayStringMenuLeft[indexPath.section][0][indexPath.row], imgName: arrayStringMenuLeft[indexPath.section][1][indexPath.row])
                
                return cell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return BannerTableViewCell.height()
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        UserObj.currentUserProfile = UserObj()
        APPDELEGATE.resetToRootViewLogin(onComplete: nil)
        
//        self.frostedViewController.contentViewController = navigationController
//        self.frostedViewController.hideMenuViewController()
    }
}
