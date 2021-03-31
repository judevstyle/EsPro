//
//  LoginRequest.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation

public struct LoginRequest: Codable {
    
    public var query: String?
    public var subquery: String?
    public var user_id: String?
    public var password: String?
    public var database: String?
    
    enum CodingKeys: String, CodingKey {
        case query = "query"
        case subquery = "subquery"
        case user_id = "user_id"
        case password = "password"
        case database = "database"
    }

}
