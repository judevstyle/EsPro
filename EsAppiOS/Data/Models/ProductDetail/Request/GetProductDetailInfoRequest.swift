//
//  GetProductDetailInfoRequest.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 21/12/2564 BE.
//

import Foundation

public struct GetProductDetailInfoRequest: Codable {
    
    public var prod: String?
    public var query: String?
    public var mfrprod: String?
    
    enum CodingKeys: String, CodingKey {
        case prod = "prod"
        case query = "query"
        case mfrprod = "mfrprod"
    }
}
