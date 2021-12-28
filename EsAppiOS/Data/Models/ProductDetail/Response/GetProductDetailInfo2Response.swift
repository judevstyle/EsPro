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
    
    //VAT
    public var VATSTATUS: String?
    
    //PRODUCT SPEC
    public var PRODUCT_CATEGORY: String?
    public var FAMILY: String?
    public var PRODUCT_PART_NO: String?
    public var ES_PART_NO: String?
    public var PACKAGE_CASE: String?
    public var MFR_PACKAGE: String?
    public var PACKAGING: String?
    public var QTY_PACKAGING: String?
    public var MFR_STD_PACK: Int?
    public var ES_STD_PACK: Int?
    public var UNIT: String?
    public var WEIGHT: Int?
    public var Warranty: Int?
    public var PBFREE: String?
    public var ROHS: String?
    
    //Product Info
    public var ProdSpecHead1: String?
    public var ProdSpecHead2: String?
    public var ProdSpecHead3: String?
    public var ProdSpecHead4: String?
    public var ProdSpecHead5: String?
    public var ProdSpecHead6: String?
    public var ProdSpecHead7: String?
    public var ProdSpecHead8: String?
    public var ProdSpecHead9: String?
    public var ProdSpecHead10: String?
    public var ProdSpecHead11: String?
    public var ProdSpecHead12: String?
    public var ProdSpecHead13: String?
    public var ProdSpecHead14: String?
    public var ProdSpecHead15: String?
    
    public var ProdSpecDetail1: String?
    public var ProdSpecDetail2: String?
    public var ProdSpecDetail3: String?
    public var ProdSpecDetail4: String?
    public var ProdSpecDetail5: String?
    public var ProdSpecDetail6: String?
    public var ProdSpecDetail7: String?
    public var ProdSpecDetail8: String?
    public var ProdSpecDetail9: String?
    public var ProdSpecDetail10: String?
    public var ProdSpecDetail11: String?
    public var ProdSpecDetail12: String?
    public var ProdSpecDetail13: String?
    public var ProdSpecDetail14: String?
    public var ProdSpecDetail15: String?
    
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
        
        case VATSTATUS = "VATSTATUS"
        case PRODUCT_CATEGORY = "PRODUCT_CATEGORY"
        case FAMILY = "FAMILY"
        case PRODUCT_PART_NO = "PRODUCT_PART_NO"
        case ES_PART_NO = "ES_PART_NO"
        case PACKAGE_CASE = "PACKAGE_CASE"
        case MFR_PACKAGE = "MFR_PACKAGE"
        case PACKAGING = "PACKAGING"
        case QTY_PACKAGING = "QTY_PACKAGING"
        case MFR_STD_PACK = "MFR_STD_PACK"
        case ES_STD_PACK = "ES_STD_PACK"
        case UNIT = "UNIT"
        case WEIGHT = "WEIGHT"
        case Warranty = "Warranty"
        case PBFREE = "PBFREE"
        case ROHS = "ROHS"
        
        case ProdSpecHead1 = "ProdSpecHead1"
        case ProdSpecHead2 = "ProdSpecHead2"
        case ProdSpecHead3 = "ProdSpecHead3"
        case ProdSpecHead4 = "ProdSpecHead4"
        case ProdSpecHead5 = "ProdSpecHead5"
        case ProdSpecHead6 = "ProdSpecHead6"
        case ProdSpecHead7 = "ProdSpecHead7"
        case ProdSpecHead8 = "ProdSpecHead8"
        case ProdSpecHead9 = "ProdSpecHead9"
        case ProdSpecHead10 = "ProdSpecHead10"
        case ProdSpecHead11 = "ProdSpecHead11"
        case ProdSpecHead12 = "ProdSpecHead12"
        case ProdSpecHead13 = "ProdSpecHead13"
        case ProdSpecHead14 = "ProdSpecHead14"
        case ProdSpecHead15 = "ProdSpecHead15"
        
        case ProdSpecDetail1 = "ProdSpecDetail1"
        case ProdSpecDetail2 = "ProdSpecDetail2"
        case ProdSpecDetail3 = "ProdSpecDetail3"
        case ProdSpecDetail4 = "ProdSpecDetail4"
        case ProdSpecDetail5 = "ProdSpecDetail5"
        case ProdSpecDetail6 = "ProdSpecDetail6"
        case ProdSpecDetail7 = "ProdSpecDetail7"
        case ProdSpecDetail8 = "ProdSpecDetail8"
        case ProdSpecDetail9 = "ProdSpecDetail9"
        case ProdSpecDetail10 = "ProdSpecDetail10"
        case ProdSpecDetail11 = "ProdSpecDetail11"
        case ProdSpecDetail12 = "ProdSpecDetail12"
        case ProdSpecDetail13 = "ProdSpecDetail13"
        case ProdSpecDetail14 = "ProdSpecDetail14"
        case ProdSpecDetail15 = "ProdSpecDetail15"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ES_PN = try values.decode(String?.self, forKey: .ES_PN)
        MFR_PN = try values.decode(String?.self, forKey: .MFR_PN)
        MANUFACTURER = try values.decode(String?.self, forKey: .MANUFACTURER)
        INVOICE_DESCRIPTION = try values.decode(String?.self, forKey: .INVOICE_DESCRIPTION)
        PRODUCT_DESCRIPTION1 = try values.decode(String?.self, forKey: .PRODUCT_DESCRIPTION1)
        PRODUCT_DESCRIPTION2 = try values.decode(String?.self, forKey: .PRODUCT_DESCRIPTION2)
        PRODUCT_DESCRIPTION3 = try values.decode(String?.self, forKey: .PRODUCT_DESCRIPTION3)
        PICTURE = try values.decode(String?.self, forKey: .PICTURE)
        
        DATASHEET = try values.decode(String?.self, forKey: .DATASHEET)
        BROCHURE = try values.decode(String?.self, forKey: .BROCHURE)
        
        PRICE1 = try values.decode(Double?.self, forKey: .PRICE1)
        PRICE2 = try values.decode(Double?.self, forKey: .PRICE2)
        PRICE3 = try values.decode(Double?.self, forKey: .PRICE3)
        PRICE4 = try values.decode(Double?.self, forKey: .PRICE4)
        PRICE5 = try values.decode(Double?.self, forKey: .PRICE5)
        PRICE6 = try values.decode(Double?.self, forKey: .PRICE6)
        PRICE7 = try values.decode(Double?.self, forKey: .PRICE7)
        PRICE8 = try values.decode(Double?.self, forKey: .PRICE8)
        PRICE9 = try values.decode(Double?.self, forKey: .PRICE9)
        PRICE10 = try values.decode(Double?.self, forKey: .PRICE10)
        
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
        
        QTYA_ONHAND = try values.decode(Double?.self, forKey: .QTYA_ONHAND)
        QTYB_ONHAND = try values.decode(Double?.self, forKey: .QTYB_ONHAND)
        QTYC_ONHAND = try values.decode(Double?.self, forKey: .QTYC_ONHAND)
        QTYD_ONHAND = try values.decode(Double?.self, forKey: .QTYD_ONHAND)
        QTYE_ONHAND = try values.decode(Double?.self, forKey: .QTYE_ONHAND)
        QTYF_ONHAND = try values.decode(Double?.self, forKey: .QTYF_ONHAND)
        QTYG_ONHAND = try values.decode(Double?.self, forKey: .QTYG_ONHAND)
        //        QTYH_ONHAND = try values.decode(Double?.self, forKey: .QTYH_ONHAND)
        QTYI_ONHAND = try values.decode(Double?.self, forKey: .QTYI_ONHAND)
        QTYJ_ONHAND = try values.decode(Double?.self, forKey: .QTYJ_ONHAND)
        QTYK_ONHAND = try values.decode(Double?.self, forKey: .QTYK_ONHAND)
        QTYL_ONHAND = try values.decode(Double?.self, forKey: .QTYL_ONHAND)
        QTYM_ONHAND = try values.decode(Double?.self, forKey: .QTYM_ONHAND)
        QTYN_ONHAND = try values.decode(Double?.self, forKey: .QTYN_ONHAND)
        
        A_BOOKING = try values.decode(Double?.self, forKey: .A_BOOKING)
        B_BOOKING = try values.decode(Double?.self, forKey: .B_BOOKING)
        C_BOOKING = try values.decode(Double?.self, forKey: .C_BOOKING)
        D_BOOKING = try values.decode(Double?.self, forKey: .D_BOOKING)
        E_BOOKING = try values.decode(Double?.self, forKey: .E_BOOKING)
        F_BOOKING = try values.decode(Double?.self, forKey: .F_BOOKING)
        G_BOOKING = try values.decode(Double?.self, forKey: .G_BOOKING)
        //        H_BOOKING = try values.decode(Double?.self, forKey: .H_BOOKING)
        I_BOOKING = try values.decode(Double?.self, forKey: .I_BOOKING)
        J_BOOKING = try values.decode(Double?.self, forKey: .J_BOOKING)
        K_BOOKING = try values.decode(Double?.self, forKey: .K_BOOKING)
        L_BOOKING = try values.decode(Double?.self, forKey: .L_BOOKING)
        M_BOOKING = try values.decode(Double?.self, forKey: .M_BOOKING)
        N_BOOKING = try values.decode(Double?.self, forKey: .N_BOOKING)
        
        VATSTATUS = try values.decode(String?.self, forKey: .VATSTATUS)
        PRODUCT_CATEGORY = try values.decode(String?.self, forKey: .PRODUCT_CATEGORY)
        FAMILY = try values.decode(String?.self, forKey: .FAMILY)
        PRODUCT_PART_NO = try values.decode(String?.self, forKey: .PRODUCT_PART_NO)
        ES_PART_NO = try values.decode(String?.self, forKey: .ES_PART_NO)
        PACKAGE_CASE = try values.decode(String?.self, forKey: .PACKAGE_CASE)
        MFR_PACKAGE = try values.decode(String?.self, forKey: .MFR_PACKAGE)
        PACKAGING = try values.decode(String?.self, forKey: .PACKAGING)
        QTY_PACKAGING = try values.decode(String?.self, forKey: .QTY_PACKAGING)
        MFR_STD_PACK = try values.decode(Int?.self, forKey: .MFR_STD_PACK)
        ES_STD_PACK = try values.decode(Int?.self, forKey: .ES_STD_PACK)
        UNIT = try values.decode(String?.self, forKey: .UNIT)
        WEIGHT = try values.decode(Int?.self, forKey: .WEIGHT)
        Warranty = try values.decode(Int?.self, forKey: .Warranty)
        PBFREE = try values.decode(String?.self, forKey: .PBFREE)
        ROHS = try values.decode(String?.self, forKey: .ROHS)
        
        ProdSpecHead1 = try values.decode(String?.self, forKey: .ProdSpecHead1)
        ProdSpecHead2 = try values.decode(String?.self, forKey: .ProdSpecHead2)
        ProdSpecHead3 = try values.decode(String?.self, forKey: .ProdSpecHead3)
        ProdSpecHead4 = try values.decode(String?.self, forKey: .ProdSpecHead4)
        ProdSpecHead5 = try values.decode(String?.self, forKey: .ProdSpecHead5)
        ProdSpecHead6 = try values.decode(String?.self, forKey: .ProdSpecHead6)
        ProdSpecHead7 = try values.decode(String?.self, forKey: .ProdSpecHead7)
        ProdSpecHead8 = try values.decode(String?.self, forKey: .ProdSpecHead8)
        ProdSpecHead9 = try values.decode(String?.self, forKey: .ProdSpecHead9)
        ProdSpecHead10 = try values.decode(String?.self, forKey: .ProdSpecHead10)
        ProdSpecHead11 = try values.decode(String?.self, forKey: .ProdSpecHead11)
        ProdSpecHead12 = try values.decode(String?.self, forKey: .ProdSpecHead12)
        ProdSpecHead13 = try values.decode(String?.self, forKey: .ProdSpecHead13)
        ProdSpecHead14 = try values.decode(String?.self, forKey: .ProdSpecHead14)
        ProdSpecHead15 = try values.decode(String?.self, forKey: .ProdSpecHead15)
        
        ProdSpecDetail1 = try values.decode(String?.self, forKey: .ProdSpecDetail1)
        ProdSpecDetail2 = try values.decode(String?.self, forKey: .ProdSpecDetail2)
        ProdSpecDetail3 = try values.decode(String?.self, forKey: .ProdSpecDetail3)
        ProdSpecDetail4 = try values.decode(String?.self, forKey: .ProdSpecDetail4)
        ProdSpecDetail5 = try values.decode(String?.self, forKey: .ProdSpecDetail5)
        ProdSpecDetail6 = try values.decode(String?.self, forKey: .ProdSpecDetail6)
        ProdSpecDetail7 = try values.decode(String?.self, forKey: .ProdSpecDetail7)
        ProdSpecDetail8 = try values.decode(String?.self, forKey: .ProdSpecDetail8)
        ProdSpecDetail9 = try values.decode(String?.self, forKey: .ProdSpecDetail9)
        ProdSpecDetail10 = try values.decode(String?.self, forKey: .ProdSpecDetail10)
        ProdSpecDetail11 = try values.decode(String?.self, forKey: .ProdSpecDetail11)
        ProdSpecDetail12 = try values.decode(String?.self, forKey: .ProdSpecDetail12)
        ProdSpecDetail13 = try values.decode(String?.self, forKey: .ProdSpecDetail13)
        ProdSpecDetail14 = try values.decode(String?.self, forKey: .ProdSpecDetail14)
        ProdSpecDetail15 = try values.decode(String?.self, forKey: .ProdSpecDetail15)
    }
}
