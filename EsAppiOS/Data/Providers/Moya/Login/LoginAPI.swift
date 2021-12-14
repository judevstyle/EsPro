//
//  LoginAPI.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation
import Moya
import UIKit

public enum LoginAPI {
    case login(request: GetLoginRequest)
}

extension LoginAPI: TargetType {
    public var baseURL: URL {
        switch self {
        case .login(_):
            return DomainNameConfig.Login.url
        }
    }
    
    public var path: String {
        switch self {
        case .login(_):
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(let request):
            return .requestParameters(parameters: request.toJSON(), encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json",
                "Authorization": "Basic " + "appprogrames:es0urceap!fappprogrames".data(using: .nonLossyASCII)!.base64EncodedString()
            ]
        }
    }

    public var authorizationType: AuthorizationType? {
        return .basic
    }
}
