//
//  UploadImageVC.swift
//  Mobi
//
//  Created by HeoConUnIn on 10/18/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//


import UIKit


class UploadImageVC: BaseViewController {

    @IBOutlet weak var btSend: UIButton!
    
    @IBOutlet var arrViewItem: [UIView]!
    @IBOutlet var arrViewImage: [UIImageView]!
    @IBOutlet var arrButtonChooseImage: [UIButton]!
    
    var simObj : SimObj?
    var cateObj : CategoryObj?
    var typeVC : UploadImageType?
    

    static func initWithStoryboard() -> UploadImageVC{
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UploadImageVC") as! UploadImageVC
        return viewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        super.setupUI()
        
        for item in arrViewItem {
            if item.tag < (self.typeVC?.getItem())! {
                let btChooseImage = self.arrButtonChooseImage[item.tag]
                btChooseImage.makeCornerAndShadowAndBorder(5, shadowRadius: 2, shadowOpacity: 0.2, borderWidth: 1)
                btChooseImage.setTitle(self.typeVC?.getListNameItem()[item.tag], for: .normal)
                item.isHidden = false
                btChooseImage.addTarget(self, action: #selector(self.onTapbtPickerImage(_:)), for: .touchUpInside)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

   
// MARK: - Action
    @IBAction func onTapbtSend(_ sender: UIButton) {
    
    }
    
    @IBAction func onTapbtPickerImage(_ sender: UIButton) {
//        var config = Configuration()
//        config.doneButtonTitle = "Finish"
//        config.noImagesTitle = "Sorry! There are no images here!"
//        config.recordLocation = false
//        config.allowVideoSelection = false
//        
//        let imagePicker = ImagePickerController(configuration: config)
//        imagePicker.view.tag = 10
//        imagePicker.delegate = self
//        
//        present(imagePicker, animated: true, completion: nil)
    }
    
}
