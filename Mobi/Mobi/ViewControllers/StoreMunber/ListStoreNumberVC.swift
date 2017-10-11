//
//  ListStoreNumberVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/11/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ListStoreNumberVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrSim : [SimObj]? = []
    var storeNumber : StoreNumber = .TraSau
    var pageIndex : Int! = 1
    
    static func initWithStoryboard() -> ListStoreNumberVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListStoreNumberVC") as! ListStoreNumberVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func setupUI() {
        super .setupUI()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        self.loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadData() {
        self.showLoadingIndicator(inView: self.view, title: "")
        print("------------- \(self.pageIndex)")
        ServiceManager.shared.searchSim(bySearch: "", byPage: self.pageIndex, byStore: self.storeNumber.getString(), byFirstNumber: "", byTypeNumber: "") { (codeRespone, simObj, nextLink) in
            if self.arrSim == nil {
                self.arrSim = simObj
            } else {
                self.arrSim?.append(contentsOf: simObj as! [SimObj]);
            }
            self.tableView.reloadData()
            self.dismissLoadingIndicator(inView: self.view)
        }
    }

}

extension ListStoreNumberVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrSim == nil {
            return 0
        }
        return (self.arrSim?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let simObj = self.arrSim![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListStoreNumberTableCell.self), for: indexPath) as! ListStoreNumberTableCell
        cell.config(simObj: simObj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == (self.arrSim?.count)! - 1) {
            self.pageIndex = self.pageIndex! + 1
            self.loadData()
        }
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let categoryObj = self.arrCongNo![indexPath.row]
//
//        let webViewVC = WebViewVC.initWithStoryboard()
//        webViewVC.strUrl = categoryObj.url
//        webViewVC.setTitlePage(title: categoryObj.name!)
//        if self.navigationController != nil {
//            self.pushVC(webViewVC)
//        } else {
//            self.customNavigationController?.pushViewController(webViewVC, animated: true)
//        }
//
//
//    }
}
