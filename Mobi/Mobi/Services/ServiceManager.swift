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
    ///   - password: <#password description#>
    ///   - username: <#username description#>
    ///   - _completion: <#_completion description#>
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
                    let feature = Mapper<UserMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                 _completion(.CODE_FAILURE, nil)
            }
        }
    }

    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - userObj: <#userObj description#>
    ///   - _completion: <#_completion description#>
    func logoutUser(byUserObj userObj: UserObj, _completion:@escaping(_ code: CodeResponse, _ dataResponse: UserObj?) -> Void) {
        
        let url = urlAPI + "dangxuat"
        let parameters: Parameters = [
            "auth_code": userObj.auth_code!,
            "iduser": userObj.id!
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<UserMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }

    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - password: <#password description#>
    ///   - username: <#username description#>
    ///   - email: <#email description#>
    ///   - _completion: <#_completion description#>
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
                    let feature = Mapper<UserMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - newPassword: <#newPassword description#>
    ///   - oldPassword: <#oldPassword description#>
    ///   - userObj: <#userObj description#>
    ///   - _completion: <#_completion description#>
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
                    let feature = Mapper<UserMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - userObj: <#userObj description#>
    ///   - _completion: <#_completion description#>
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
                    let feature = Mapper<UserMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
//MARK: - StoreNumber
    
    /// <#Description#>
    ///
    /// - Parameter _completion: <#_completion description#>
    func typeSim( _completion:@escaping(_ code: CodeResponse, _ dataResponse: [TypeSimObj]?) -> Void) {
        let url = urlAPI + "dangsim"
        Alamofire.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<TypeSimMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - search: <#search description#>
    ///   - store: <#store description#>
    ///   - firstNumber: <#firstNumber description#>
    ///   - typeNumber: <#typeNumber description#>
    ///   - _completion: <#_completion description#>
    func searchSim(bySearch search: String?, byStore store: String?, byFirstNumber firstNumber: String?, byTypeNumber typeNumber: String?, _completion:@escaping(_ code: CodeResponse, _ dataResponse: [SimObj]?) -> Void) {
        let url = urlAPI + "timsim"
        let parameters: Parameters = [
            "dau" : firstNumber!,
            "kho" : store!,
            "dang" : typeNumber!,
            "search" : search!
        ]
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<SimMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
    
    /// <#Description#>
    ///
    /// - Parameter userObj: <#userObj description#>
    /// - Returns: <#return value description#>
    func captcha(byUserObj userObj: UserObj) -> String {
        return urlAPI + "captcha?auth_code=\(userObj.auth_code!)&iduser=\(userObj.id!)"
    }
    
    
    func category(byType type:CategoryType, _completion:@escaping(_ code: CodeResponse, _ dataResponse: [SimObj]?) -> Void) {
        let url = urlAPI + "theloai/\(type)"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.result.value as? [String:Any] {
                    let feature = Mapper<SimMapper>().map(JSONObject: data)
                    
                    _completion(.CODE_SUCCESS, feature!.detail)
                }
            case .failure( _):
                _completion(.CODE_FAILURE, nil)
            }
        }
    }
    
}
