//
//  VasCheckVC.swift
//  Mobi
//
//  Created by Hoang Do on 11/1/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class VasCheckVC: BaseViewController {
    
    var aPopupContainer: PopupContainer?
    var testCalendar = Calendar(identifier: .gregorian)
    var indexButtonShowPicker = 0
    var currentStartDate: Date! = Date() {
        didSet {
            setDate(true)
        }
    }
    
    var currentEndDate: Date! = Date() {
        didSet {
            setDate(false)
        }
    }
    
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtStartDate: UITextField!
    @IBOutlet weak var txtEndDate: UITextField!
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var btCheck: UIButton!
    
    static func initWithStoryboard() -> VasCheckVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VasCheckVC") as! VasCheckVC
        return viewController;
    }
    
    override func setupUI() {
        super.setupUI()
        
        btCheck.makeCornerAndShadowAndBorder(5, shadowRadius: 2, shadowOpacity: 0.3, borderWidth: 1)
        self.navigationItem.title = NSLocalizedString("M_VAS", comment: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentStartDate = Date()
        currentEndDate = Date()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Action
    @IBAction func onTapBtCheck(_ sender: UIButton) {
        self.showBannerVideo(0.2)
        self.showLoadingIndicator(inView: self.view)
        ServiceManager.shared.checkVas(self.txtPhone.text!, strFrom: self.txtStartDate.text!, strTo: self.txtEndDate.text!, _completion: { (codeRespon, reason) in
            self.dismissLoadingIndicator(inView: self.view)
            self.lbMessage.text = reason
        }) { (strError) in
            self.dismissLoadingIndicator(inView: self.view)
            self.lbMessage.text = strError
        }
    }
    
    @IBAction func showCalendar(_ sender: UIButton) {
        self.view.endEditing(true)
        let xibView = Bundle.main.loadNibNamed("CalendarPopUp", owner: nil, options: nil)?[0] as! CalendarPopUp
        xibView.calendarDelegate = self
        xibView.selected = sender.tag == 0 ? currentStartDate : currentEndDate
        self.indexButtonShowPicker = sender.tag
        PopupContainer.generatePopupWithView(xibView).show()
    }
    
    func setDate(_ isStart: Bool) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat="dd/MM/yyyy"
        
        if isStart {
            self.txtStartDate.text = formatter.string(from: currentStartDate)
        } else {
            self.txtEndDate.text = formatter.string(from: currentEndDate)
        }
    }
}


extension VasCheckVC: CalendarPopUpDelegate {
    func dateChaged(date: Date) {
        if indexButtonShowPicker == 0 {
            currentStartDate = date
        } else {
            currentEndDate = date
        }
        
    }
}
