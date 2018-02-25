//
//  BaseViewController.swift
//  Mobi
//
//  Created by HeoConUnIn on 9/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class BaseViewController: UIViewController {

    var leftButton:UIButton!
    var rightButton:UIButton!
    var titleLabel: UILabel!
    var notiLabel: UILabel!
    
    var isShowBanner: Bool! = true
    var ggBannerView: GADBannerView!
    var ggInterstitial: GADInterstitial!
    
    
//    fileprivate var hud: MBProgressHUD = MBProgressHUD()
    
    var isHiddenRightButton: Bool = false {
        didSet {
            if isHiddenRightButton {
                self.navigationItem.rightBarButtonItem = nil
            } else {
                if let rightButton = self.rightButton {
                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
                }
            }
        }
    }
    
    var isHiddenLeftButton: Bool = false {
        didSet {
            if isHiddenLeftButton {
                self.navigationItem.leftBarButtonItem = nil
            } else {
                if let leftButton = self.leftButton {
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
                }
            }
        }
    }
    
    var isEnableLeftButton: Bool = true {
        didSet {
            self.navigationItem.leftBarButtonItem?.isEnabled = isEnableLeftButton
        }
    }
    
    var isEnableRightButton: Bool = true {
        didSet {
            self.navigationItem.rightBarButtonItem?.isEnabled = isEnableRightButton
        }
    }
    
//    private var dropDown: DropDown?
    
    deinit {
//        print("Deinit \(self.classForCoder)")
    }
    
    override func viewDidLoad() {
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBannerAD(isShowBanner)
    }
    
    /**
     Setup UI with has Navigation Bar
     - parameters:
     - isHas: Bool, has Navigation is true, otherwise false
     */
    func setupUI() {
        self.loadNavigationBar(true)
    }
    
    func loadNavigationBar(_ isLoad: Bool) {
        if isLoad {
            self.configureNavBar()
        }
    }
    
    func configureNavBar() {
        self.setLeftMenuButtonImage()
        self.setTitleViewWithImage()
        self.changeNavigationBarToDefaultStyle()
    }
    
    func changeNavigationBarToDefaultStyle() {
        
        let attributes:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as? [NSAttributedStringKey : Any]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.colorWithHexString("36609E")
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func changeNavigationBarToTransparentStyle() {
        
        let attributes:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as? [NSAttributedStringKey : Any]
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
    
    func setLeftButton(withButton button: UIButton? = nil) {
        if let button = button {
            self.leftButton = button
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setRightButton(withButton button: UIButton? = nil) {
        if let button = button {
            self.rightButton = button
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setLeftMenuButtonImage() {
        // init left button
        self.leftButton = UIButton(frame: CGRect(x: 10, y: 0, width: 44, height: 44))
        self.leftButton?.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0)
        self.leftButton?.addTarget(self, action: #selector(self.leftMenuButtonClicked(_:)), for: .touchUpInside)
        self.leftButton?.setImage(UIImage(named: "left_arrow"), for: UIControlState())
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.leftButton!)
    }
    
    func setNavigationBarTitleColor(_ color: UIColor) {
        let attributes:NSDictionary = [NSAttributedStringKey.foregroundColor: color]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as? [NSAttributedStringKey : Any]
    }
    
    func hideLeftButton() {
        self.navigationItem.leftBarButtonItem = nil
    }
    
    func hideRightButton() {
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func setTitleViewWithImage() {
        
    }
    
    @IBAction func leftMenuButtonClicked(_ sender: AnyObject) {
        self.showBannerVideo(0.1)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rightMenuButtonClicked(_ sender: AnyObject) {
        
    }
    
    func showWarningButton(onTextField textField: UITextField) {
        let warningButton = UIButton(type: .custom)
        warningButton.setImage(UIImage(named: "warning"), for: UIControlState())
        warningButton.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        textField.rightViewMode = .always
        textField.rightView = warningButton
    }
    
    func removeWarningButton(fromTextField textField: UITextField) {
        textField.rightViewMode = .never
    }
    
    func showLoadingIndicator(inView view: UIView, title: String = "DANG TAI DU LIEU") {
        HUDManager.showHUDInView(view, hubTitle: title)
    }

    func dismissLoadingIndicator(inView view: UIView, completion: (() -> Void)? = nil) {
        HUDManager.dismissHUD(view)
    }
    
    func getVisibleViewController() -> UIViewController? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.window?.visibleViewController
        } else {
            return nil
        }
    }
    
    func addBannerAD(_ isShow: Bool) {
        guard isShow else {
            return
        }
        
        if (self.ggBannerView != nil) {
            return
        }
        
        self.ggBannerView = GADBannerView.init(adSize: kGADAdSizeBanner)
        self.ggBannerView.adSize = kGADAdSizeBanner
        
        
        let request = GADRequest()
        // Sample device ID
//        request.testDevices = [kGADSimulatorID, "44b324e56431f8cc849fbbc4a34c2f1e"];

//        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        ggBannerView.adUnitID = "ca-app-pub-4837358488793511/3750776743"
        ggBannerView.rootViewController = self
        ggBannerView.load(request)
        self.ggBannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.ggBannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: self.ggBannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: self.ggBannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    func showBannerVideo(_ numberAdd: CGFloat = 0.6) {
        APPDELEGATE.intClick = APPDELEGATE.intClick + numberAdd
        if (APPDELEGATE.intClick <= numShowBanner) {
            return
        }
        
        createAndLoadInterstitial()
        if ggInterstitial.isReady {
            ggInterstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        
    }
    
    func createAndLoadInterstitial() {
        
        let request = GADRequest()
        // Sample device ID
//        request.testDevices = [kGADSimulatorID , "44b324e56431f8cc849fbbc4a34c2f1e"];
        
        ggInterstitial = GADInterstitial(adUnitID: "ca-app-pub-4837358488793511/2892866937")
        ggInterstitial.delegate = self
        ggInterstitial.load(request)
    }
}

//extension BaseObj : GADBannerViewDelegate {
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

extension BaseViewController : GADInterstitialDelegate {
    /// Tells the delegate an ad request succeeded.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
        APPDELEGATE.intClick = APPDELEGATE.intClick - numShowBanner
        self.ggInterstitial.present(fromRootViewController: self);
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
//        self.createAndLoadInterstitial()
    }
    
    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        print("interstitialWillLeaveApplication")
    }
}


