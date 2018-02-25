//
//  CongNoListImageVC.swift
//  Mobi
//
//  Created by Hoang Do on 12/6/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class CongNoListImageVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
//    var congNoObj : CongNoObj?
    var arrImage = [String]()
    
    static func initWithStoryboard() -> CongNoListImageVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CongNoListImageVC") as! CongNoListImageVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createURLimage(_ congNoObj : CongNoObj) {
        for urlImage in (congNoObj.images?.split(","))! {
            self.arrImage.append("\(urlIMAGEHOST)\(urlImage)")
        }
    }
}

extension CongNoListImageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.arrImage.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urlImg = self.arrImage[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CongNoListImageTableCell.self), for: indexPath) as! CongNoListImageTableCell
        cell.config(urlImg)
        return cell
    }
    
}
