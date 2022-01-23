//
//  GetLoginResponse.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation

public struct GetLoginResponse: Codable {
    
    public var PASSWORD: String?
    public var TYPE: String?
    public var GROUPDESC: String?
    public var SALECODE: String?
    
    enum CodingKeys: String, CodingKey {
        case PASSWORD = "PASSWORD"
        case TYPE = "TYPE"
        case GROUPDESC = "GROUPDESC"
        case SALECODE = "SALE_CODE"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        PASSWORD = try values.decode(String.self, forKey: .PASSWORD)
        TYPE = try values.decode(String.self, forKey: .TYPE)
        GROUPDESC = try values.decode(String.self, forKey: .GROUPDESC)
        SALECODE = try values.decode(String.self, forKey: .SALECODE)
    }
}
