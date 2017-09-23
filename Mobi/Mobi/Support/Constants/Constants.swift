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

let APPDELEGATE: AppDelegate = UIApplication.shared.delegate as! AppDelegate

// MARK: - URL
let urlAPI: String = "http://lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/%@/Beesmart/"
let urlAPILogin: String = String(format: urlAPI, "authorize")
let urlImage = String(format: "http://bsdev.acuteksolutions.com/restapi/rest/%d/images/", (SessionToken.sharedInstance.modelUser?.result?.regionId)!)
let macAddress: String = "00000000ffaa"


// MARK: - Plist constant
let watchTvState: String = "watchTvState"
let fnaState: String = "fnaState"
let moviesState: String = "moviesState"
let roomControlState: String = "roomControlState"
let conciergeState: String = "conciergeState"

let kConcierge: String = "Concierge"
let kLiveTV: String = "Live TV"
let kMovies: String = "Movies"
let kFood: String = "Food & Activities"
let kRoom: String = "Room Control"

// MARK: - Array string slide menu
let arrayStringMenuLeft: [String]   = ["CONCIERGE", "LIVE TV", "MOVIES", "FOOD & ACTIVTIES", "ROOM CONTROL", "SETTINGS"]

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

enum TopMenu: Int {
    case home = 0
    case concierge
    case liveTV
    case movies
    case food
    case room
}
