//
//  InventoryTableModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import Foundation

public struct InventoryTableModel: Codable {
    
    public var key: String = ""
    public var location: String = ""
    public var onhand: String = ""
    public var booking: String = ""
    public var balance: String = ""
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case location = "location"
        case onhand = "onhand"
        case booking = "booking"
        case balance = "balance"
    }
}
