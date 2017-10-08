//
//  HomeVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/5/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static func initWithStoryboard() -> HomeVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        super.setupUI()
        self.collectionView.reloadData()
        self.navigationItem.title = NSLocalizedString("M_HOME", comment: "")
    }
    
    override func setLeftMenuButtonImage() {
        super.setLeftMenuButtonImage()
        self.leftButton?.setImage(UIImage(named: "ic_menu"), for: UIControlState())
    }
    
    override func leftMenuButtonClicked(_ sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
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

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if UserObj.currentUserProfile.isGuest {
            return arrayStringMenuInMainForGest[0].count
        }
        return arrayStringMenuInMain[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeItemCollectionCell.self) , for: indexPath) as! HomeItemCollectionCell
        if UserObj.currentUserProfile.isGuest {
             cell.config(title: arrayStringMenuInMainForGest[0][indexPath.row], imgName: arrayStringMenuInMainForGest[1][indexPath.row])
        } else {
            cell.config(title: arrayStringMenuInMain[0][indexPath.row], imgName: arrayStringMenuInMain[1][indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 2) - 1, height: collectionView.frame.size.height / 6.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // kho so
        if indexPath.row == 0 {
            let subHome = SubHomeVC.initWithStoryboard()
            self.pushVC(subHome)
        }
        
        // Thu Tuc
        if indexPath.row == 1 {

        }

        // Khuyen Mai
        if indexPath.row == 2 {
            let test = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarVC") as! BaseTabBarController
            let tabViewController1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsVC")
            let tabViewController2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsVC") 
            test.viewControllers = [tabViewController1, tabViewController2]
            test.navigationItem.title = "dddd"
            
            
            
            tabViewController1.tabBarItem = UITabBarItem(
                title: "Pie",
                image: UIImage(),
                tag: 1)
            tabViewController2.tabBarItem = UITabBarItem(
                title: "Pizza",
                image:UIImage() ,
                tag:2)
            
            self.pushVC(test)
        }
        
        // Cong No
        if indexPath.row == 3 {
            let congNoVC = CongNoVC.initWithStoryboard()
            self.pushVC(congNoVC)
        }
        
        // Tai anh
        if indexPath.row == 4 {
            
        }
        
        // vas
        if indexPath.row == 5 {
            
        }
        
        // Thanh Toan Tros
        if indexPath.row == 6 {
            let webViewVC = WebViewVC.initWithStoryboard()
            webViewVC.strUrl = "http://n3t.top/test/fire/test"
//            webViewVC.setTitlePage(title: NSLocalizedString("M_PAY_THE_BILL", comment: ""))
            self.pushVC(webViewVC)
        }
    }
}