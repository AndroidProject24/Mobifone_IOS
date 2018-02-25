//
//  VasVC.swift
//  Mobi
//
//  Created by Hoang Do on 11/1/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import AlamofireImage

class VasVC: BaseViewController {

    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var viewDropdown: UIView!
    @IBOutlet weak var lbDropDown: UILabel!
    @IBOutlet weak var imaCapcha: UIImageView!
    
    @IBOutlet weak var txtCapcha: UITextField!
    
    @IBOutlet weak var btBuy: UIButton!
    @IBOutlet weak var btCheck: UIButton!
    
    
    var arrVas : [VasObj]? = []
    var vasIndex : Int! = 0
    var vasObj : VasObj?
    
    static func initWithStoryboard() -> VasVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VasVC") as! VasVC
        return viewController;
    }
    
    override func setupUI() {
        super.setupUI()
        
        btBuy.makeCornerAndShadowAndBorder(5, shadowRadius: 2, shadowOpacity: 0.3, borderWidth: 1)
        btCheck.makeCornerAndShadowAndBorder(5, shadowRadius: 2, shadowOpacity: 0.3, borderWidth: 1)
        self.navigationItem.title = NSLocalizedString("M_VAS", comment: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBannerVideo(0.1)
        // Do any additional setup after loading the view.
        self.showLoadingIndicator(inView: self.view)
        self.loadData()
        self.reloadCapcha()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadCapcha() {
        self.imaCapcha.image = UIImage()
        ServiceManager.shared.captcha(byUserObj: UserObj.currentUserProfile, _completion: { (myData) in
            self.imaCapcha.image = UIImage(data: myData)
        })
    }
    
    func resetUI() {
        self.txtCapcha.text = ""
        self.txtPhone.text = ""
    }

    
    func  loadData() {
        if arrVas?.count == 0 {
            ServiceManager.shared.listVas(_completion: { (CodeRespont, listVas) in
                self.arrVas = listVas
                self.vasObj = listVas?[self.vasIndex]
                self.lbDropDown.text = (listVas?[self.vasIndex])!.name
                self.dismissLoadingIndicator(inView: self.view)
            }, _failed: { (error) in
                
            })
        }
    }

    // MARK: - Action
    @IBAction func onTapBtCate(_ sender: UIButton) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.tag = 0
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        pickerView.selectRow(self.vasIndex, inComponent: 0, animated: true)
        let editRadiusAlert = UIAlertController(title: "Chọn Gói", message: "", preferredStyle: UIAlertControllerStyle.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "Chọn", style: .default, handler: nil))
        editRadiusAlert.addAction(UIAlertAction(title: "Đóng", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
    
    @IBAction func onTapBtRefesh(_ sender: UIButton) {
        self.reloadCapcha()
    }
    
    @IBAction func onTapBtBuy(_ sender: UIButton) {
        self.showLoadingIndicator(inView: self.view)
        ServiceManager.shared.buyVas(self.txtPhone.text!, strCapcha: self.txtCapcha.text!, strCode: (self.vasObj?.code)!, _completion: { (codeRespon, reason) in
            self.dismissLoadingIndicator(inView: self.view)
            self.reloadCapcha()
            self.resetUI()
            
            let errorVC = ErrorVC.initWithStoryboard()
            self.pushVC(errorVC)
        }) { (strError) in
            self.dismissLoadingIndicator(inView: self.view)
            self.reloadCapcha()
            self.resetUI()
        }
        
    }
    
    @IBAction func onTapBtCheckVas(_ sender: UIButton) {
        let checkVC = VasCheckVC.initWithStoryboard()
        pushVC(checkVC)
    }
}

extension VasVC : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (self.arrVas?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel;
        
        if (pickerLabel == nil) {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Montserrat", size: 16)
            pickerLabel?.textAlignment = NSTextAlignment.left
        }
        let typeVasObj = self.arrVas![row]
        pickerLabel?.text = typeVasObj.name
        
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.vasObj = self.arrVas![row]
        self.lbDropDown.text = self.vasObj?.name
        self.vasIndex = row
    }
}

