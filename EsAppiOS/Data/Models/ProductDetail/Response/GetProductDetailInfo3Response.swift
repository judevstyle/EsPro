//
//  GetProductDetailInfo3Response.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation

public struct GetProductDetailInfo3Response: Codable {
    
    public var PO_NO: Int?
    public var ITEM: Int?
    public var PO_DATE: String?
    public var QTY_AVL: Int?
    public var EST_ARR: String?
    public var CON_ARR: String?
    public var BOOK_QTY: Int?
    public var SELL_PRICE: Int?
    public var UPDOWN: Double?
    
    public enum CodingKeys: String, CodingKey {
        case PO_NO = "PO_NO"
        case ITEM = "ITEM"
        case PO_DATE = "PO_DATE"
        case QTY_AVL = "QTY_AVL"
        case EST_ARR = "EST_ARR"
        case CON_ARR = "CON_ARR"
        case BOOK_QTY = "BOOK_QTY"
        case SELL_PRICE = "SELL_PRICE"
        case UPDOWN = "UPDOWN"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        PO_NO = try values.decode(Int?.self, forKey: .PO_NO)
        ITEM = try values.decode(Int?.self, forKey: .ITEM)
        PO_DATE = try values.decode(String?.self, forKey: .PO_DATE)
        QTY_AVL = try values.decode(Int?.self, forKey: .QTY_AVL)
        EST_ARR = try values.decode(String?.self, forKey: .EST_ARR)
        CON_ARR = try values.decode(String?.self, forKey: .CON_ARR)
        BOOK_QTY = try values.decode(Int?.self, forKey: .BOOK_QTY)
        SELL_PRICE = try values.decode(Int?.self, forKey: .SELL_PRICE)
        UPDOWN = try values.decode(Double?.self, forKey: .UPDOWN)
    }
}
