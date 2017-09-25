//
//  ModelUser.swift
//  uHotel
//
//  Created by HungLe-iMac on 9/13/16.
//  Copyright © 2016 uHotel. All rights reserved.
//

import ObjectMapper

class UserObj: Mappable {
    required init?(map: Map) {
        
    }
    
    var id : String?
    var username : String?
    var email : String?
    var auth_code : String?
    var phone : String?
    var lastName : String?
    var firstName : String?
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        email <- map["email"]
        auth_code <- map["auth_code"]
    }
}

 class UserMaper: BaseObj {
    var detail: UserObj?

    override func mapping(map: Map) {
        detail <- map["0"]
        idk <- map["idk"]
        error <- map["error"]
        reason <- map["reason"]
    }
}
