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
    
    
    
    
    
    
    // MARK: - USER
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - pass: <#pass description#>
    ///   - region: <#region description#>
    ///   - _operator: <#_operator description#>
    ///   - completion: <#completion description#>
    func loginUser(byPassword password: String?, byUsername username: String?, _completion:@escaping(_ code: CodeResponse, _ dataResponse: UserObj?) -> Void) {
        
        let url = urlAPI + "dangnhap"
        let parameters: Parameters = [
            "user": username!,
            "pass": password!
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<UserObj>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature)
                }
            case .failure( _):
                 _completion(.CODE_FAILURE, nil)
            }
        }
    }


    /// <#Description#>
    ///
    /// - Parameters:
    ///   - pass: <#pass description#>
    ///   - region: <#region description#>
    ///   - _operator: <#_operator description#>
    ///   - completion: <#completion description#>
    func registerUser(byPassword password: String?, byUsername username: String?, byEmail email: String?, _completion:@escaping(_ code: CodeResponse, _ dataResponse: UserObj?) -> Void) {
        
        let url = urlAPI + "dangkyuser"
        let parameters: Parameters = [
            "user": username!,
            "pass": password!,
            "email": email!
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<UserObj>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - pass: <#pass description#>
    ///   - region: <#region description#>
    ///   - _operator: <#_operator description#>
    ///   - completion: <#completion description#>
    func changePassword(byNewPassword newPassword: String?, byOldPassword oldPassword: String?, byUserObj userObj: UserObj, _completion:@escaping(_ code: CodeResponse, _ dataResponse: UserObj?) -> Void) {
        
        let url = urlAPI + "edituser"
        let parameters: Parameters = [
            "auth_code" : userObj.auth_code!,
            "username" : userObj.username!,
            "iduser" : userObj.id!,
            "old" : oldPassword!,
            "new" : newPassword!
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<UserObj>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - pass: <#pass description#>
    ///   - region: <#region description#>
    ///   - _operator: <#_operator description#>
    ///   - completion: <#completion description#>
    func changeInfo(byUserObj userObj: UserObj, _completion:@escaping(_ code: CodeResponse, _ dataResponse: UserObj?) -> Void) {
        
        let url = urlAPI + "edituser"
        let parameters: Parameters = [
            "auth_code" : userObj.auth_code!,
            "username" : userObj.username!,
            "iduser" : userObj.id!,
            "email" : userObj.email!,
            "phone" : userObj.phone!,
            "last_name" : userObj.lastName!,
            "first_name" : userObj.firstName!
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<UserObj>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
}
