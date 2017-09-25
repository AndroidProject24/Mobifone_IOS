//
//  BaseViewController.swift
//  uHotel
//
//  Created by HeoConUnIn on 3/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK:- Property
    var leftButton:UIButton!
    var rightButton:UIButton!
    var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = colorBackground
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if previousTraitCollection?.horizontalSizeClass != traitCollection.horizontalSizeClass {
            switch traitCollection.horizontalSizeClass {
            case .compact:
                setupConstraintsForCompactEnvironment()
            case .unspecified: fallthrough
            case .regular:
                // ipad
                setupConstraintsForRegularEnvironment()
            }
        }
    }

    func setupConstraintsForCompactEnvironment() {
        
    }
    
    func setupConstraintsForRegularEnvironment() {
        
    }
    
    // MARK: - NAVIGATION_BAR
    
    func loadNavigationBar(_ isLoad: Bool) {
        if isLoad {
            self.setLeftMenuButtonImage()
            self.setRightMenuButtonImage()
            self.setTitleViewWithImage()
            self.changeNavigationBarToDefaultStyle()
        }
    }
    
    func changeNavigationBarToDefaultStyle() {
        
        let attributes:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as? [NSAttributedStringKey : Any]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.init(hexString: "b0006d")
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
    
    func setLeftMenuButtonImage() {
        // init left button
        self.leftButton = UIButton(frame: CGRect(x: 10, y: 0, width: 44, height: 44))
        self.leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0)
        self.leftButton.addTarget(self, action: #selector(self.leftMenuButtonClicked(_:)), for: .touchUpInside)
        self.leftButton.setImage(UIImage(named: "btn_menu"), for: UIControlState())
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.leftButton)
    }
    
    func setRightMenuButtonImage() {
        // init right button
        self.rightButton = UIButton(frame: CGRect(x: self.view.w - 60, y: 0, width: 44, height: 44))
        self.rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10)
        self.rightButton.addTarget(self, action: #selector(self.rightMenuButtonClicked(_:)), for: .touchUpInside)
        self.rightButton.setImage(UIImage(named: "menu"), for: UIControlState())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.rightButton)
    }
    
    func setTitleViewWithImage() {
        
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
    
    @IBAction func leftMenuButtonClicked(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rightMenuButtonClicked(_ sender: AnyObject) {
        
    }
}
