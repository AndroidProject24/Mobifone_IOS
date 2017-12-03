//
//  VasObj.swift
//  Mobi
//
//  Created by Hoang Do on 11/1/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import ObjectMapper

class VasObj: Mappable {
    var name: String?
    var code: String?
    var price: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["tengoi"]
        price <- map["giagoi"]
        code <- map["magoi"]
    }
}

class VasMapper: BaseObj  {
    var detail: [VasObj]?
    
    override func mapping(map: Map) {
        detail <- map["data"]
        error <- map["error"]
        reason <- map["reason"]
    }
}
