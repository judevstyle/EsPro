//
//  CustomerProfileAPI.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation
import Moya
import UIKit

public enum CustomerProfileAPI {
    case getCustomerProfile(req: GetCustomerProfileRequest)
}

extension CustomerProfileAPI: TargetType {
    public var baseURL: URL {
        switch self {
        case .getCustomerProfile(_):
            return DomainNameConfig.CustomerProfile.url
        }
    }
    
    public var path: String {
        switch self {
        case .getCustomerProfile(_):
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getCustomerProfile:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getCustomerProfile(let request):
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
