//
//  LoginResponse.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation

public struct LoginResponse: Codable {
    
    public var USER_ID: String?
    public var ACTIVE: Int?
    public var GROUPDESC: String?
    
    enum CodingKeys: String, CodingKey {
        case USER_ID = "USER_ID"
        case ACTIVE = "ACTIVE"
        case GROUPDESC = "GROUPDESC"
    }
}
