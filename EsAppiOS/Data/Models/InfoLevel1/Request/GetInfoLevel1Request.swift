//
//  GetInfoLevel1Request.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation

public struct GetInfoLevel1Request: Codable {
    
    public var query: String?
    public var searchby: String?
    public var keyword: String?
    public var sortby: String?
    public var salecode: String?
    
    enum CodingKeys: String, CodingKey {
        case query = "query"
        case searchby = "searchby"
        case keyword = "keyword"
        case sortby = "sortby"
        case salecode = "salecode"
    }
}
