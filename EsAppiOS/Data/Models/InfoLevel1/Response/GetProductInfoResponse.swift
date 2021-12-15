//
//  GetProductInfoResponse.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation

public struct GetProductInfoResponse: Codable {
    
    public var ES_PN: String?
    public var MFR_PN: String?
    public var DESCRIPTION: String?
    public var QTY: Int?
    public var PRICE1: Int?
    
    public enum CodingKeys: String, CodingKey {
        case ES_PN = "ES_PN"
        case MFR_PN = "MFR_PN"
        case DESCRIPTION = "DESCRIPTION"
        case QTY = "QTY"
        case PRICE1 = "PRICE1"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ES_PN = try values.decode(String.self, forKey: .ES_PN)
        MFR_PN = try values.decode(String.self, forKey: .MFR_PN)
        DESCRIPTION = try values.decode(String.self, forKey: .DESCRIPTION)
        QTY = try values.decode(Int.self, forKey: .QTY)
        PRICE1 = try values.decode(Int.self, forKey: .PRICE1)
    }
}
