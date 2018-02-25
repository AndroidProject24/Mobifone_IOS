//
//  DialogPromotionVC.swift
//  Mobi
//
//  Created by Hoang Do on 1/15/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

import UIKit

class DialogPromotionVC: BaseViewController {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var btYesOrCaNhan: UIButton!
    @IBOutlet weak var btDoanhNghiep: UIButton!

    var idkm : String = ""
    var customNavigationController: UINavigationController?
    var storeNumber : StoreNumber = .TraSau
    
    static func initWithStoryboard() -> DialogPromotionVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DialogPromotionVC") as! DialogPromotionVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setupUI() {
        if self.storeNumber == .TraSau {
            self.btDoanhNghiep.isHidden = false
            self.btYesOrCaNhan.isHidden = false
            self.btYesOrCaNhan.setTitle("Cá nhân", for: .normal)
        }
    }
    
    func showWebView(isCaNhan : Bool = false) {
        let webViewVC = WebViewVC.initWithStoryboard()
        if self.storeNumber == .TraSau {
            
            if (idkm.range(of: ",") != nil) {
                webViewVC.strUrl = "\(urlWebPromotion)\(isCaNhan ? idkm.split(",")[1] : idkm.split(",")[0])"
            }
            webViewVC.setTitlePage(title: "Khuyến mại")
            if self.customNavigationController != nil {
                self.customNavigationController?.pushViewController(webViewVC, animated: true)
            }
            
        } else if self.storeNumber == .TraTruoc || self.storeNumber == .CamKet {

            webViewVC.strUrl = "\(urlWebPromotion)\(idkm)"
            webViewVC.setTitlePage(title: "Khuyến mại")
            if self.customNavigationController != nil {
                self.customNavigationController?.pushViewController(webViewVC, animated: true)
            }
        }
    }
    
    // MARK: - Action
    @IBAction func onTapBtDissmis(_ sender: UIButton) {
        self.dismissVC(completion: nil)
    }
    
    @IBAction func onTapBtYesOrCaNhan(_ sender: UIButton) {
        self.dismissVC(completion: {
            if self.storeNumber == .TraSau {
                self.showWebView(isCaNhan: true)
            } else {
                self.showWebView()
            }
            
        })

    }
    
    @IBAction func onTapBtDoanhNghiep(_ sender: UIButton) {
        self.dismissVC(completion: {
            self.showWebView()
        })
    }

}
