//
//  ProductRequest.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation

public struct ProductRequest: Codable {
    
    public var query: String?
    public var subquery: String?
    public var database: String?
    
    public var prod: String?
    public var pageno: Int?
    public var searchBy: String?
    
    enum CodingKeys: String, CodingKey {
        case query = "query"
        case subquery = "subquery"
        case database = "database"
        case prod = "prod"
        case pageno = "pageno"
        case searchBy = "search_by"
    }

}
