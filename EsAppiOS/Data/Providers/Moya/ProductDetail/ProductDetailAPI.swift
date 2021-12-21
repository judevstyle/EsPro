//
//  ProductDetailAPI.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 19/12/2564 BE.
//

import Foundation
import Moya
import UIKit

public enum ProductDetailAPI {
    case getProductDetailInfo(request: GetProductDetailInfoRequest)
}

extension ProductDetailAPI: TargetType {
    public var baseURL: URL {
        switch self {
        case .getProductDetailInfo(_):
            return DomainNameConfig.ProductDetail.url
        }
    }
    
    public var path: String {
        switch self {
        case .getProductDetailInfo(_):
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getProductDetailInfo:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getProductDetailInfo(let request):
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
