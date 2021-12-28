//
//  GetSimilarRelatedPartResponse.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation

public struct GetSimilarRelatedPartResponse: Codable {
    
    public var Picture: String?
    public var ESPartNo: String?
    public var MfrPartNo: String?
    public var Desc2: String?
    public var Desc3: String?
    public var Desc4: String?
    public var UnitPrice: Double?

    public enum CodingKeys: String, CodingKey {
        case Picture = "Picture"
        case ESPartNo = "ESPartNo"
        case MfrPartNo = "MfrPartNo"
        case Desc2 = "Desc2"
        case Desc3 = "Desc3"
        case Desc4 = "Desc4"
        case UnitPrice = "UnitPrice"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        Picture = try values.decode(String?.self, forKey: .Picture)
        ESPartNo = try values.decode(String?.self, forKey: .ESPartNo)
        MfrPartNo = try values.decode(String?.self, forKey: .MfrPartNo)
        Desc2 = try values.decode(String?.self, forKey: .Desc2)
        Desc3 = try values.decode(String?.self, forKey: .Desc3)
        Desc4 = try values.decode(String?.self, forKey: .Desc4)
        UnitPrice = try values.decode(Double?.self, forKey: .UnitPrice)
    }
}
