//
//  PriceTableModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import Foundation

public struct PriceTableModel: Codable {
    
    public var qyt: Int?
    public var unitPrice: Double?
    enum CodingKeys: String, CodingKey {
        case qyt = "qyt"
        case unitPrice = "unitPrice"
    }
}
