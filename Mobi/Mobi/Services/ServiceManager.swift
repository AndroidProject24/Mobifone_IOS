//
//  ServiceManager.swift
//  uHotel
//
//  Created by HeoConUnIn on 3/30/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ServiceManager {
    public static let sharedInstance: ServiceManager = {
        return ServiceManager()
    }()
    
    
    // MARK: - Login
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - pass: <#pass description#>
    ///   - region: <#region description#>
    ///   - _operator: <#_operator description#>
    ///   - completion: <#completion description#>
    func loginUser(byPassworf password: String?, Region strRegion: String? = "default", Operator strOperator: String? = "default", _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelUser?) -> Void) {
        let string = String(format: "AuthorizeService/%@/%@?region=%@&operator=%@", macAddress, password!, strRegion!, strOperator!)
        let url = urlAPILogin + string
        print("\(url)")
        Alamofire.request(url, method: .post).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelUser>().map(JSONObject: data)
                
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    // MARK: - LiveTV
    
    //	http: // lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/request/00000000ffee/Beesmart?path=/restapi/rest/1/channels
    
    /// <#Description#>
    ///
    /// - Parameter _completion: <#_completion description#>
    func getAllChannel(_completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelLiveTV?) -> Void) {
        let path = String(format: "/restapi/rest/%d/channels",(SessionToken.sharedInstance.modelUser?.result?.regionId)!)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        print("\(url)")
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelLiveTV>().map(JSONObject: data)
                
                if feature!.result != nil {
                    SessionToken.sharedInstance.resultTV = resultLiveTV(JSONString: (feature?.result)!)
                }
                
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    //    http://lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/request/00000000ffee/Beesmart?path=/restapi/rest/1/tvprogram?date="2016-09-26"
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - date: <#date description#>
    ///   - _completion: <#_completion description#>
    func getAllProgramChannel(withDate date: String, _completion:@escaping( _ code: CodeResponse, _ dataResponse: ModelLiveTV?) -> Void) {
        let path = String(format: "/restapi/rest/%d/tvprogram?date=%@",(SessionToken.sharedInstance.modelUser?.result?.regionId)!, date)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        
        print("\(url)")
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelLiveTV>().map(JSONObject: data)
                
                if feature?.result != nil {
                    SessionToken.sharedInstance.resultCU = resultComingUp(JSONString: (feature?.result)!)
                }
                
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    // MARK: - Movies
    
    //    http://lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/request/00000000ffee/Beesmart?path=/restapi/rest/1/content/info?include_details=true
    
    /// <#Description#>
    ///
    /// - Parameter completion: <#completion description#>
    func getAllMovies(_completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelMovies?) -> Void) {
        let path = String(format: "/restapi/rest/%d/content/info?include_details=true", (SessionToken.sharedInstance.modelUser?.result?.regionId)!)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelMovies>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    //http://lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/request/00000000ffaa/Beesmart?path=/restapi/rest/1/content/media?include_media_resources=true&content_info_id=62bed9d9-a551-4c0b-a39e-1dd20a7bd8a8
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - movieID: <#movieID description#>
    ///   - completion: <#completion description#>
    func getMoviesWithID(byMoviesID movieID:String?, _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelVOD?) -> Void) {
        let path = String(format: "/restapi/rest/%d/content/media?include_media_resources=true&content_info_id=%@", (SessionToken.sharedInstance.modelUser?.result?.regionId)!, movieID!)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        print(url)
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelVOD>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    //http://lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/request/00000000ffaa/Beesmart?path=/restapi/rest/1/store/categories
    
    /// <#Description#>
    ///
    /// - Parameter completion: <#completion description#>
    func getAllCategories(_completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelCategory?) -> Void) {
        let path = String(format: "/restapi/rest/%d/store/categories", (SessionToken.sharedInstance.modelUser?.result?.regionId)!)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelCategory>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    //http://lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/request/00000000ffaa/Beesmart?path=/restapi/rest/1/store/products?purchase_category_id=1882cb01-1a7f-4f7a-bcc4-1d8869505425
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - idCategory: <#idCategory description#>
    ///   - completion: <#completion description#>
    func getPurchaseItemInEachCategory(byCategoryId idCategory:String, _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelPurchaseItem?) -> Void) {
        let path = String(format: "/restapi/rest/%d/store/products?purchase_category_id=%@", (SessionToken.sharedInstance.modelUser?.result?.regionId)!, idCategory)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelPurchaseItem>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - idmovie: <#idmovie description#>
    ///   - completion: <#completion description#>
    func getMoviesInfo(byMovieId idmovie: String, _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelVOD?) -> Void) {
        let path = String(format: "/vod/info/%@", idmovie)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelVOD>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - idList: <#idList description#>
    ///   - _completion: <#_completion description#>
    func getMultipleMovieInfo(byIDlist idList: String, _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelVOD?) -> Void) {
        let path = String(format: "/vod/info?purchase_item_list=%@", idList)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelVOD>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    //    http://lv-api.acuteksolutions.com/cxf/ws/messagebus/rest/request/00000000ffaa/Beesmart/?path=/restapi/rest/1/43/store/purchased-products
    
    /// <#Description#>
    ///
    /// - Parameter completion: <#completion description#>
    func getAllPurchaseMovie(_completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelPurchaseItem?) -> Void) {
        let path = String(format: "/restapi/rest/%d/%d/store/purchased-products", (SessionToken.sharedInstance.modelUser?.result?.regionId)!, (SessionToken.sharedInstance.modelUser?.result?.userId)!)
        let url = String(format: "%@?path=%@", String(format: urlAPI, "request/00000000ffaa"), path.urlEncoded())
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelPurchaseItem>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    // MARK: - ParentalControl
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - newpin: <#newpin description#>
    ///   - oldpin: <#oldpin description#>
    ///   - completion: <#completion description#>
    func changePin(byNewPin newpin: String?, withOldPin oldpin: String?, _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelPIN?) -> Void) {
        let url = String(format: "%@PinCodeService/%@/%@/changepin?data=%@&parentalPin=%@", String(format: urlAPI, "check"), macAddress, (SessionToken.sharedInstance.modelUser?.result?.profileUid)!, newpin!, oldpin!)
        
        Alamofire.request(url, method: .post).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelPIN>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - pin: <#pin description#>
    ///   - completion: <#completion description#>
    func verifiPin(byPin pin: String?, _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelPIN?) -> Void) {
        let url = String(format: "%@PinCodeService/%@/%@/authorize?parentalPin=%@", String(format: urlAPI, "check"), macAddress, (SessionToken.sharedInstance.modelUser?.result?.profileUid)!, pin!)
        print("\(url)")
        Alamofire.request(url, method: .post).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelPIN>().map(JSONObject: data)
                if feature?.type == "NORMAL" {
                    _completion(.CODE_FAILURE, feature)
                } else {
                    _completion(.CODE_SUCCESS, nil)
                }
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - isTV: <#isTV description#>
    ///   - isfood: <#isfood description#>
    ///   - ismovies: <#ismovies description#>
    ///   - isroom: <#isroom description#>
    ///   - isCon: <#isCon description#>
    ///   - pin: <#pin description#>
    ///   - completion: <#completion description#>
    func changeStatePage(byTV isTV: Bool, Food isfood: Bool, Movies ismovies: Bool, Room isroom: Bool, Concierge isCon: Bool, Pin pin: String, _completion:@escaping(_ code: CodeResponse, _ dataResponse: ModelPIN?) -> Void) {
        let parentalSetting = String(format: "{\"watchTvState\":%@,\"fnaState\":%@,\"moviesState\":%@,\"roomControlState\":%@,\"conciergeState\":%@}", isTV ? "true" : "false", isfood ? "true" : "false", ismovies ? "true" : "false", isroom ? "true" : "false", isCon ? "true" : "false")
        let url = String(format: "%@PinCodeService/%@/%@/update?data=%@&parentalPin=%@", String(format: urlAPI, "check"), macAddress, (SessionToken.sharedInstance.modelUser?.result?.profileUid)!, parentalSetting, pin)
        
        Alamofire.request(url.urlEncoded(), method: .post).responseJSON { response in
            if let data = response.result.value as? [String:Any] {
                let feature = Mapper<ModelPIN>().map(JSONObject: data)
                _completion(.CODE_SUCCESS, feature)
            } else {
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    
}
