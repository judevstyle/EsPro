//
//  ProductResponse.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation

public struct ProductResponse: Codable {
    
    public var RowNum: String?
    public var ESPART: String = ""
    public var MFRPART: String = ""
    public var DESCRIPTION: String?
    public var PRICE1: Double?
    
    enum CodingKeys: String, CodingKey {
        case RowNum = "RowNum"
        case ESPART = "ESPART"
        case MFRPART = "MFRPART"
        case DESCRIPTION = "DESCRIPTION"
        case PRICE1 = "PRICE1"
    }
}
