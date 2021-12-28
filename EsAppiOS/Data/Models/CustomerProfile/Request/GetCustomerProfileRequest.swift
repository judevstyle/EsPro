//
//  GetCustomerProfileRequest.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation

public struct GetCustomerProfileRequest: Codable {

    public var query: String?
    public var custcode: String?
    
    enum CodingKeys: String, CodingKey {
        case query = "query"
        case custcode = "custcode"
    }
}
