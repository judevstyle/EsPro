//
//  ShipmentTableModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import Foundation

public struct ShipmentTableModel: Codable {
    
    public var poNo: String = ""
    public var item: String = ""
    public var poDate: String = ""
    public var qtyAvl: String = ""
    public var estArr: String = ""
    public var conArr: String = ""
//    public var increase: String = ""
//    public var approve: String = ""
    
    enum CodingKeys: String, CodingKey {
        case poNo = "poNo"
        case item = "item"
        case poDate = "poDate"
        case qtyAvl = "qtyAvl"
        case estArr = "estArr"
        case conArr = "conArr"
//        case increase = "increase"
//        case approve = "approve"
    }
}
