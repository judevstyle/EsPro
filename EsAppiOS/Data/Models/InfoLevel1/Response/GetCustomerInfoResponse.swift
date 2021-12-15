//
//  GetCustomerInfoResponse.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation

public struct GetCustomerInfoResponse: Codable {
    
    public var CUSTOMER_NO: Int?
    public var CUSTOMER_NAME: String?
    
    enum CodingKeys: String, CodingKey {
        case CUSTOMER_NO = "CUSTOMER_NO"
        case CUSTOMER_NAME = "CUSTOMER_NAME"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        CUSTOMER_NO = try values.decode(Int.self, forKey: .CUSTOMER_NO)
        CUSTOMER_NAME = try values.decode(String.self, forKey: .CUSTOMER_NAME)
    }
}
