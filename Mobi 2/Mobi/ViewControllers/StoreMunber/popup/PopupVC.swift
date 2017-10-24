//
//  PopupVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/17/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class PopupVC: BaseViewController {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var viewDropdown: UIView!
    @IBOutlet weak var lbDropDown: UILabel!
    
    var simObj : SimObj?
    var cateObj : CategoryObj?
    var arrCate : [CategoryObj]? = []
    var customNavigationController: UINavigationController?
    var cateIndex : Int! = 0
    
    static func initWithStoryboard() -> PopupVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupVC") as! PopupVC
        return viewController;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadCate()
        self.viewDropdown.makeCornerAndShadowAndBorder(3, shadowRadius: 1, shadowOpacity: 0.2, borderWidth: 1)
        self.viewMain.makeCornerAndShadowAndBorder(5, shadowRadius: 2, shadowOpacity: 0.2, borderWidth: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCate() {
        self.showLoadingIndicator(inView: self.view, title: "")
        ServiceManager.shared.category(byType: .Get_Cate, _completion: { (codeRespond, listCate) in
            self.arrCate = listCate;
            self.lbDropDown.text = (listCate?[self.cateIndex])?.name
            self.dismissLoadingIndicator(inView: self.view)
        })
    }
    
    @IBAction func onTapBtDissmis(_ sender: UIButton) {
        self.dismissVC(completion: {
            let uploadVC = UploadImageVC.initWithStoryboard()
            uploadVC.simObj = self.simObj
            uploadVC.cateObj = self.cateObj
            uploadVC.typeVC = UploadImageType.ImageShopCard
            self.customNavigationController?.pushViewController(uploadVC, animated: true)
        })
    }
    
    @IBAction func onTapBtCate(_ sender: UIButton) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.tag = 0
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        pickerView.selectRow(self.cateIndex, inComponent: 0, animated: true)
        let editRadiusAlert = UIAlertController(title: "Chọn thể loại", message: "", preferredStyle: UIAlertControllerStyle.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "Chọn", style: .default, handler: nil))
        editRadiusAlert.addAction(UIAlertAction(title: "Đóng", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
}

extension PopupVC : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (self.arrCate?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel;
        
        if (pickerLabel == nil) {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Montserrat", size: 16)
            pickerLabel?.textAlignment = NSTextAlignment.left
        }
        let typeSimObj = self.arrCate![row]
        pickerLabel?.text = typeSimObj.name
        
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.cateObj = self.arrCate![row]
        self.lbDropDown.text = self.cateObj?.name
        self.cateIndex = row
    }
}
