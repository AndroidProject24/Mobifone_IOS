//
//  SessionToken.swift
//  uHotel
//
//  Created by HungLe-iMac on 9/13/16.
//  Copyright © 2016 uHotel. All rights reserved.
//

import UIKit

class SessionToken: NSObject {
	var pageChangeMenu: Int = -1
	var pageMenu: Int = -1

	// Account
	var modelUser: ModelUser?
	var modelSetting: settingUser?
	var resultTV: resultLiveTV?
	var resultCU: resultComingUp?

	class var sharedInstance: SessionToken {
		struct Singleton {
			static let instance = SessionToken()
		}
		return Singleton.instance
	}
}
