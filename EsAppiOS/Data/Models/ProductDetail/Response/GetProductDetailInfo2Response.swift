//
//  GetProductDetailInfo2Response.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 19/12/2564 BE.
//

import Foundation

public struct GetProductDetailInfo2Response: Codable {
    
    public var ES_PN: String?
    public var MFR_PN: String?
    public var MANUFACTURER: String?
    public var INVOICE_DESCRIPTION: String?
    public var PRODUCT_DESCRIPTION1: String?
    public var PRODUCT_DESCRIPTION2: String?
    public var PRODUCT_DESCRIPTION3: String?
    public var PICTURE: String?
    
    public var DATASHEET: String?
    public var BROCHURE: String?
    
    public var PRICE1: Double?
    public var PRICE2: Double?
    public var PRICE3: Double?
    public var PRICE4: Double?
    public var PRICE5: Double?
    public var PRICE6: Double?
    public var PRICE7: Double?
    public var PRICE8: Double?
    public var PRICE9: Double?
    public var PRICE10: Double?
    
    public var PRODUCTPRICE1: Int?
    public var PRODUCTPRICE2: Int?
    public var PRODUCTPRICE3: Int?
    public var PRODUCTPRICE4: Int?
    public var PRODUCTPRICE5: Int?
    public var PRODUCTPRICE6: Int?
    public var PRODUCTPRICE7: Int?
    public var PRODUCTPRICE8: Int?
    public var PRODUCTPRICE9: Int?
    public var PRODUCTPRICE10: Int?
    
    public var QTYA_ONHAND: Double?
    public var QTYB_ONHAND: Double?
    public var QTYC_ONHAND: Double?
    public var QTYD_ONHAND: Double?
    public var QTYE_ONHAND: Double?
    public var QTYF_ONHAND: Double?
    public var QTYG_ONHAND: Double?
//    public var QTYH_ONHAND: Double?
    public var QTYI_ONHAND: Double?
    public var QTYJ_ONHAND: Double?
    public var QTYK_ONHAND: Double?
    public var QTYL_ONHAND: Double?
    public var QTYM_ONHAND: Double?
    public var QTYN_ONHAND: Double?
    
    public var A_BOOKING: Double?
    public var B_BOOKING: Double?
    public var C_BOOKING: Double?
    public var D_BOOKING: Double?
    public var E_BOOKING: Double?
    public var F_BOOKING: Double?
    public var G_BOOKING: Double?
//    public var H_BOOKING: Double?
    public var I_BOOKING: Double?
    public var J_BOOKING: Double?
    public var K_BOOKING: Double?
    public var L_BOOKING: Double?
    public var M_BOOKING: Double?
    public var N_BOOKING: Double?
    
    public enum CodingKeys: String, CodingKey {
        case ES_PN = "ES_PN"
        case MFR_PN = "MFR_PN"
        case MANUFACTURER = "MANUFACTURER"
        case INVOICE_DESCRIPTION = "INVOICE_DESCRIPTION"
        case PRODUCT_DESCRIPTION1 = "PRODUCT_DESCRIPTION1"
        case PRODUCT_DESCRIPTION2 = "PRODUCT_DESCRIPTION2"
        case PRODUCT_DESCRIPTION3 = "PRODUCT_DESCRIPTION3"
        case PICTURE = "PICTURE"
        case DATASHEET = "DATASHEET"
        case BROCHURE = "BROCHURE"
        
        case PRICE1 = "PRICE1"
        case PRICE2 = "PRICE2"
        case PRICE3 = "PRICE3"
        case PRICE4 = "PRICE4"
        case PRICE5 = "PRICE5"
        case PRICE6 = "PRICE6"
        case PRICE7 = "PRICE7"
        case PRICE8 = "PRICE8"
        case PRICE9 = "PRICE9"
        case PRICE10 = "PRICE10"
        
        case PRODUCTPRICE1 = "PRODUCTPRICE1"
        case PRODUCTPRICE2 = "PRODUCTPRICE2"
        case PRODUCTPRICE3 = "PRODUCTPRICE3"
        case PRODUCTPRICE4 = "PRODUCTPRICE4"
        case PRODUCTPRICE5 = "PRODUCTPRICE5"
        case PRODUCTPRICE6 = "PRODUCTPRICE6"
        case PRODUCTPRICE7 = "PRODUCTPRICE7"
        case PRODUCTPRICE8 = "PRODUCTPRICE8"
        case PRODUCTPRICE9 = "PRODUCTPRICE9"
        case PRODUCTPRICE10 = "PRODUCTPRICE10"
        
        case QTYA_ONHAND = "QTYA_ONHAND"
        case QTYB_ONHAND = "QTYB_ONHAND"
        case QTYC_ONHAND = "QTYC_ONHAND"
        case QTYD_ONHAND = "QTYD_ONHAND"
        case QTYE_ONHAND = "QTYE_ONHAND"
        case QTYF_ONHAND = "QTYF_ONHAND"
        case QTYG_ONHAND = "QTYG_ONHAND"
//        case QTYH_ONHAND = "QTYH_ONHAND"
        case QTYI_ONHAND = "QTYI_ONHAND"
        case QTYJ_ONHAND = "QTYJ_ONHAND"
        case QTYK_ONHAND = "QTYK_ONHAND"
        case QTYL_ONHAND = "QTYL_ONHAND"
        case QTYM_ONHAND = "QTYM_ONHAND"
        case QTYN_ONHAND = "QTYN_ONHAND"
        
        case A_BOOKING = "A_BOOKING"
        case B_BOOKING = "B_BOOKING"
        case C_BOOKING = "C_BOOKING"
        case D_BOOKING = "D_BOOKING"
        case E_BOOKING = "E_BOOKING"
        case F_BOOKING = "F_BOOKING"
        case G_BOOKING = "G_BOOKING"
//        case H_BOOKING = "H_BOOKING"
        case I_BOOKING = "I_BOOKING"
        case J_BOOKING = "J_BOOKING"
        case K_BOOKING = "K_BOOKING"
        case L_BOOKING = "L_BOOKING"
        case M_BOOKING = "M_BOOKING"
        case N_BOOKING = "N_BOOKING"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ES_PN = try values.decode(String.self, forKey: .ES_PN)
        MFR_PN = try values.decode(String.self, forKey: .MFR_PN)
        MANUFACTURER = try values.decode(String.self, forKey: .MANUFACTURER)
        INVOICE_DESCRIPTION = try values.decode(String.self, forKey: .INVOICE_DESCRIPTION)
        PRODUCT_DESCRIPTION1 = try values.decode(String.self, forKey: .PRODUCT_DESCRIPTION1)
        PRODUCT_DESCRIPTION2 = try values.decode(String.self, forKey: .PRODUCT_DESCRIPTION2)
        PRODUCT_DESCRIPTION3 = try values.decode(String.self, forKey: .PRODUCT_DESCRIPTION3)
        PICTURE = try values.decode(String.self, forKey: .PICTURE)
        
        DATASHEET = try values.decode(String.self, forKey: .DATASHEET)
        BROCHURE = try values.decode(String.self, forKey: .BROCHURE)
        
        PRICE1 = try values.decode(Double.self, forKey: .PRICE1)
        PRICE2 = try values.decode(Double.self, forKey: .PRICE2)
        PRICE3 = try values.decode(Double.self, forKey: .PRICE3)
        PRICE4 = try values.decode(Double.self, forKey: .PRICE4)
        PRICE5 = try values.decode(Double.self, forKey: .PRICE5)
        PRICE6 = try values.decode(Double.self, forKey: .PRICE6)
        PRICE7 = try values.decode(Double.self, forKey: .PRICE7)
        PRICE8 = try values.decode(Double.self, forKey: .PRICE8)
        PRICE9 = try values.decode(Double.self, forKey: .PRICE9)
        PRICE10 = try values.decode(Double.self, forKey: .PRICE10)
        
        PRODUCTPRICE1 = try values.decode(Int.self, forKey: .PRODUCTPRICE1)
        PRODUCTPRICE2 = try values.decode(Int.self, forKey: .PRODUCTPRICE2)
        PRODUCTPRICE3 = try values.decode(Int.self, forKey: .PRODUCTPRICE3)
        PRODUCTPRICE4 = try values.decode(Int.self, forKey: .PRODUCTPRICE4)
        PRODUCTPRICE5 = try values.decode(Int.self, forKey: .PRODUCTPRICE5)
        PRODUCTPRICE6 = try values.decode(Int.self, forKey: .PRODUCTPRICE6)
        PRODUCTPRICE7 = try values.decode(Int.self, forKey: .PRODUCTPRICE7)
        PRODUCTPRICE8 = try values.decode(Int.self, forKey: .PRODUCTPRICE8)
        PRODUCTPRICE9 = try values.decode(Int.self, forKey: .PRODUCTPRICE9)
        PRODUCTPRICE10 = try values.decode(Int.self, forKey: .PRODUCTPRICE10)
        
        QTYA_ONHAND = try values.decode(Double.self, forKey: .QTYA_ONHAND)
        QTYB_ONHAND = try values.decode(Double.self, forKey: .QTYB_ONHAND)
        QTYC_ONHAND = try values.decode(Double.self, forKey: .QTYC_ONHAND)
        QTYD_ONHAND = try values.decode(Double.self, forKey: .QTYD_ONHAND)
        QTYE_ONHAND = try values.decode(Double.self, forKey: .QTYE_ONHAND)
        QTYF_ONHAND = try values.decode(Double.self, forKey: .QTYF_ONHAND)
        QTYG_ONHAND = try values.decode(Double.self, forKey: .QTYG_ONHAND)
//        QTYH_ONHAND = try values.decode(Double.self, forKey: .QTYH_ONHAND)
        QTYI_ONHAND = try values.decode(Double.self, forKey: .QTYI_ONHAND)
        QTYJ_ONHAND = try values.decode(Double.self, forKey: .QTYJ_ONHAND)
        QTYK_ONHAND = try values.decode(Double.self, forKey: .QTYK_ONHAND)
        QTYL_ONHAND = try values.decode(Double.self, forKey: .QTYL_ONHAND)
        QTYM_ONHAND = try values.decode(Double.self, forKey: .QTYM_ONHAND)
        QTYN_ONHAND = try values.decode(Double.self, forKey: .QTYN_ONHAND)
        
        A_BOOKING = try values.decode(Double.self, forKey: .A_BOOKING)
        B_BOOKING = try values.decode(Double.self, forKey: .B_BOOKING)
        C_BOOKING = try values.decode(Double.self, forKey: .C_BOOKING)
        D_BOOKING = try values.decode(Double.self, forKey: .D_BOOKING)
        E_BOOKING = try values.decode(Double.self, forKey: .E_BOOKING)
        F_BOOKING = try values.decode(Double.self, forKey: .F_BOOKING)
        G_BOOKING = try values.decode(Double.self, forKey: .G_BOOKING)
//        H_BOOKING = try values.decode(Double.self, forKey: .H_BOOKING)
        I_BOOKING = try values.decode(Double.self, forKey: .I_BOOKING)
        J_BOOKING = try values.decode(Double.self, forKey: .J_BOOKING)
        K_BOOKING = try values.decode(Double.self, forKey: .K_BOOKING)
        L_BOOKING = try values.decode(Double.self, forKey: .L_BOOKING)
        M_BOOKING = try values.decode(Double.self, forKey: .M_BOOKING)
        N_BOOKING = try values.decode(Double.self, forKey: .N_BOOKING)
    }
}
