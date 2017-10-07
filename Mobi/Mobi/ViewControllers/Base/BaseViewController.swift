//
//  BaseViewController.swift
//  Mobi
//
//  Created by HeoConUnIn on 9/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import Foundation
import UIKit
//import MBProgressHUD
//import Toast_Swift
//import DropDown

class BaseViewController: UIViewController {

    var leftButton:UIButton!
    var rightButton:UIButton!
    var titleLabel: UILabel!
    var notiLabel: UILabel!
    
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
        print("Deinit \(self.classForCoder)")
    }
    
    override func viewDidLoad() {
        setupUI()
//        self.dropDown = DropDown()
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
        HUDManager.dismissHUD(view, completion: completion)
    }
    
    func getVisibleViewController() -> UIViewController? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.window?.visibleViewController
        } else {
            return nil
        }
    }

    
    /**
     Setup DropDown list
     */
//    func setupDropDown(withList list: [String], withIndex index: Int, inView view: UIView, withWidth width: CGFloat, selectionAction: ((Index, String) -> Void)?) {
//        self.dropDown?.anchorView = view
//        self.dropDown?.direction = .any
//        self.dropDown?.topOffset = CGPoint(x: view.frame.width - width, y: view.bounds.height)
//        self.dropDown?.dataSource = list
//        self.dropDown?.width = width
//        self.dropDown?.selectRow(at: index)
//        self.dropDown?.selectionAction = selectionAction
//        self.dropDown?.show()
//    }

}
