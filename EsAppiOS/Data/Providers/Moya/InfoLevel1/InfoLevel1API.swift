//
//  InfoLevel1API.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation
import Moya
import UIKit

public enum InfoLevel1API {
    case getInfoLevel1(request: GetInfoLevel1Request)
}

extension InfoLevel1API: TargetType {
    public var baseURL: URL {
        switch self {
        case .getInfoLevel1(_):
            return DomainNameConfig.InfoLevel1.url
        }
    }
    
    public var path: String {
        switch self {
        case .getInfoLevel1(_):
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getInfoLevel1:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getInfoLevel1(let request):
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
