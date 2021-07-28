//
//  APIProvider.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/26/21.
//

import Foundation
import Moya


enum APIDomain: String {
    case HOST_API = "https://www.apiesource.com:3000/esprogram_get"
    
    var url: URL {
        return URL(string: self.rawValue)!
    }
}

enum APIService {
    case authLogin(request: LoginRequest)
//    case getProduct(request: ProductRequest)
}

extension APIService: TargetType {
    
    var baseURL: URL {
        switch self {
        default:
            guard let url = URL(string: (Bundle.main.infoDictionary!["API_BASE_URL"] as? String)!) else {
                return  APIDomain.HOST_API.url
            }
            return APIDomain.HOST_API.url
        }
    }
    
    var path: String {
        switch self {
        case .authLogin:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .authLogin:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .authLogin(request):
            guard let json = request.toJSON else {
                return .requestPlain
            }
            return .requestParameters(parameters: json, encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json",
                "Authorization": "Basic " + "appprogrames:es0urceap!fappprogrames".data(using: .nonLossyASCII)!.base64EncodedString()
            ]
        }
    }
    
}

extension APIService: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .basic
    }
}
