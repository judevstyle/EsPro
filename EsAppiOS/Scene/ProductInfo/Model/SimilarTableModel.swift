//
//  SimilarTableModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/27/21.
//

import Foundation

public struct SimilarTableModel: Codable {
    
    public var image: String?
    public var title: String = ""
    public var type: String = ""
    public var desc: String = ""
    public var price: String = ""
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case title = "title"
        case type = "type"
        case desc = "desc"
        case price = "price"
    }
}
