//
//  LoginVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 9/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import GoogleMobileAds

class LoginVC: BaseViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btLoginForGuest: UIButton!
    @IBOutlet weak var ggBannerView: GADBannerView!
    
    static func initWithStoryboard() -> LoginVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar?.isHidden = true
        // Do any additional setup after loading the view.
        
        self.btLogin.defaultButton()
        self.btLoginForGuest.defaultButton()
        
        let request = GADRequest()
        request.testDevices = ["0ff4b3f74aa5b753cd59507ffbf002c4", "f4bf8d0a4972137dd6f933ac3ab829d7"];                       // Sample device ID
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        ggBannerView.adUnitID = "ca-app-pub-4837358488793511/3750776743"
        ggBannerView.rootViewController = self
//        ggBannerView.delegate = self
        ggBannerView.load(request)
        
        
    
//        emailField.detail = "Error, incorrect email"
//        emailField.textColor = .black
//        emailField.isClearIconButtonEnabled = true
//        emailField.delegate = self
//        emailField.isPlaceholderUppercasedWhenEditing = true
//        //        emailField.placeholderAnimation = .hidden
//
//        // Set the colors for the emailField, different from the defaults.
//        emailField.placeholderNormalColor = Color.red.darken4
//        emailField.placeholderActiveColor = Color.pink.base
//        emailField.dividerNormalColor = Color.grey.base
//        emailField.dividerActiveColor = Color.red.base
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapBtLogin(_ sender: UIButton) {
        self.showLoadingIndicator(inView: self.view, title: "")
        ServiceManager.shared.loginUser(byPassword: self.txtPassword!.text, byUsername: self.txtUserName!.text, _completion: { (CodeRespone, userObj) in
            userObj?.isGuest = false
            UserObj.currentUserProfile = userObj!
            APPDELEGATE.resetToRootViewHome(onComplete: nil)
            
            self.dismissLoadingIndicator(inView: self.view)
        }, _failed: { (strMessage) in
            self.showToastFailure(message: strMessage!)
            self.dismissLoadingIndicator(inView: self.view)
        })
        
        
    }
    
    @IBAction func onTapBtLoginGuest(_ sender: UIButton) {
        let user = UserObj()
        user.isGuest = true
        UserObj.currentUserProfile = user
        
        (UIApplication.shared.delegate as! AppDelegate).resetToRootViewHome { (ok) in
            
        }
    }
    
    @IBAction func onTapBtForGetPassword(_ sender: UIButton) {
        
    }

    @IBAction func onTapBtRegister(_ sender: UIButton) {
        let registerViewControler = RegisterVC.initWithStoryboard()
        self.pushVC(registerViewControler)
    }
    
}

//extension LoginVC : GADBannerViewDelegate {
//    /// Tells the delegate an ad request loaded an ad.
//    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
//        print("adViewDidReceiveAd")
//    }
//    
//    /// Tells the delegate an ad request failed.
//    func adView(_ bannerView: GADBannerView,
//                didFailToReceiveAdWithError error: GADRequestError) {
//        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
//    }
//    
//    /// Tells the delegate that a full screen view will be presented in response
//    /// to the user clicking on an ad.
//    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
//        print("adViewWillPresentScreen")
//    }
//    
//    /// Tells the delegate that the full screen view will be dismissed.
//    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
//        print("adViewWillDismissScreen")
//    }
//    
//    /// Tells the delegate that the full screen view has been dismissed.
//    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
//        print("adViewDidDismissScreen")
//    }
//    
//    /// Tells the delegate that a user click will open another app (such as
//    /// the App Store), backgrounding the current app.
//    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
//        print("adViewWillLeaveApplication")
//    }
//}

