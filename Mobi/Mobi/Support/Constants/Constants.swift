//
//  Constants.swift
//  uHotel
//
//  Created by HeoConUnIn on 3/28/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import Foundation
import UIKit
import EZSwiftExtensions
import SwiftOverlays

let UTIL: Uitl = Uitl.sharedInstance
let APPDELEGATE: AppDelegate = UIApplication.shared.delegate as! AppDelegate

// MARK: - URL
let urlAPI: String = "http://n3t.top/test/api/"
let urlImage = String(format: "http://bsdev.acuteksolutions.com/restapi/rest/%d/images/")



// MARK: - Array string slide menu
let arrayStringMenuLeft:[[[String]]]   = [[],
                                          [["M_HOME", "M_STORE", "M_PROMOTION", "M_LIABILITIES", "M_PROCEDURE", "M_UPLOAD_PICTURE", "M_PORFILE"],
                                           ["I_HOME", "I_STORE", "I_PROMOTION", "I_LIABILITIES", "I_PROCEDURE", "I_UPLOAD_PICTURE", "I_PORFILE"]
                                          ],
                                          [["M_HELP","M_CONTAST", "M_LOGOUT"], ["","I_CONTAST", "I_LOGOUT"]]]
                                                     

let arrayStringMenuInMain: [[String]]    = [["M_STORE", "M_PROCEDURE", "M_PROMOTION", "M_LIABILITIES", "M_UPLOAD_PICTURE", "M_VAS", "M_PAY_THE_BILL"],
                                            ["I_STORE", "I_PROCEDURE", "I_PROMOTION", "I_LIABILITIES", "I_UPLOAD_PICTURE", "I_VAS", "I_PAY_THE_BILL"]
]
let arrayStringMenuInMainForGest: [[String]]    = [["M_STORE", "M_PROCEDURE", "M_PROMOTION", "M_PAY_THE_BILL"],
                                                   ["I_STORE", "I_PROCEDURE", "I_PROMOTION", "I_PAY_THE_BILL"]
]

let arrayStringSubMenuInSim: [[String]]    = [["M_TRA_TRUOC", "M_TRA_SAU_DOANH_NGHIEP", "M_TRA_SAU", "M_CAM_KET_SO_DEP", "M_KIEM_TRA_TINH_TRANG"],
                                                   ["I_TRA_TRUOC", "I_TRA_SAU_DOANH_NGHIEP", "I_TRA_SAU", "I_CAM_KET_SO_DEP", "I_KIEM_TRA_TINH_TRANG"]
]

let arrayStringFirstNumber: [String]    = ["Đầu số", "090", "093", "083", "0120", "0121", "0122", "0126", "0128"]

// MARK: - Height paging menu
let kHeightMenu: CGFloat = 103

// MARK: - Color
let colorTextSlidMenu       = UIColor(hexString: "FED037")
let colorBackgroundMenu     = UIColor(hexString: "1d1d1d")
let colorBackground         = UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
let colorTitle              = UIColor(hexString: "5f5348")
let colorMain               = UIColor(hexString: "CF8B29")
let colorLoading            = UIColor(hexString: "F39905")
let colorButton             = UIColor(hexString: "1f1f20")
let colorButtonActive       = UIColor(hexString: "cc8904")
let colorButtonBorder       = UIColor(hexString: "F9A704")

// MARK: - FONT
func font_HelveticaNeue(size: CGFloat = 16.0) -> UIFont {
    return UIFont(name: "HelveticaNeue", size: size)!
}
func font_HelveticaNeue_Bold(size: CGFloat = 16.0) -> UIFont {
    return UIFont(name: "HelveticaNeue-Bold", size: size)!
}
func font_HelveticaNeue_Light(size: CGFloat = 16.0) -> UIFont {
    return UIFont(name: "HelveticaNeue-Light", size: size)!
}
func font_HelveticaNeue_Medium(size: CGFloat = 16.0) -> UIFont {
    return UIFont(name: "HelveticaNeue-Medium", size: size)!
}
func font_HelveticaNeue_Thin(size: CGFloat = 16.0) -> UIFont {
    return UIFont(name: "HelveticaNeue-Thin", size: size)!
}

// MARK: - Notification
let kChangeMoviewsPage: String = "kChangeMoviewsPage"


//========================== SCREEN SIZE ==========================
func SCREEN_WIDTH() -> CGFloat{
    return UIScreen.main.bounds.size.width
}

func SCREEN_HEIGHT() -> CGFloat{
    return UIScreen.main.bounds.size.height
}


//========================== Type Menu ==========================
enum SideMenu: Int {
    case concierge = 0
    case liveTV
    case movies
    case food
    case room
    case settings
}

enum StoreNumber: Int {
    case TraSau = 0
    case CamKet
    case TraTruoc
    case TraTruocSoDep
    
    func getString() -> String {
        switch self {
        case .TraSau:
            return "trasau"
        case .CamKet:
            return "camket"
        case .TraTruoc:
            return "tratruoc"
        case .TraTruocSoDep:
            return "tratruocsodep"
        }
    }
}

enum CategoryType: Int {
    case Procedure_Nomal = 113
    case Procedure_HM_Tra_Sau = 119
    case Procedure_HM_Tra_Truoc = 120
    case CTKM_Nomal = 112
    case CTKM_Tra_Sau = 116
    case CTKM_KMTS_Doanh_Nghiep = 124
    case CTKM_KMTS_Ca_Nhan = 123
    case CTKM_Cam_Ket_So_Dep = 117
    case CTKM_KM_Nap_The_Theo_Ngay = 118
}
