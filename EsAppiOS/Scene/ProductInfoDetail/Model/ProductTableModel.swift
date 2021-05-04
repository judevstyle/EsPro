//
//  ProductTableModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import Foundation

public struct ProductTableModel: Codable {
    
    public var title: String = ""
    public var value: String = ""
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case value = "value"
    }
}
