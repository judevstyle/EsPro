//
//  GetLoginRequest.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation

public struct GetLoginRequest: Codable {
    
    public var query: String?
    public var userid: String?
    
    enum CodingKeys: String, CodingKey {
        case query = "query"
        case userid = "userid"
    }
}
