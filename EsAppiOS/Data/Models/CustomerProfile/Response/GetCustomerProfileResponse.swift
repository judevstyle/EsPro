//
//  GetCustomerProfileResponse.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation

public struct GetCustomerProfileResponse: Codable {
    
    public var CUSTOMER_NO: Int?
    public var PREFIX: String?
    public var NAME: String?
    public var NAMEENG: String?
    public var SHORTNAME: String?
    public var ADDR: String?
    public var ADDRL2: String?
    public var POSTCODE: String?
    public var TEL: String?
    public var FAX: String?
    public var TAX_ID: String?
    public var BRANCH: String?
    public var OPEN_DATE: String?
    public var SALENAME: String?
    public var SALECODE1: String?
    public var SALECODE2: String?
    public var SALECODE3: String?
    public var SALECODE4: String?
    public var CREDIT: Double?
    public var AMOUNT: Double?
    public var CREDIT_AMOUNT: Double?
    public var AR: Double?
    public var CHQ_RET: Double?
    public var TERM: Int?
    public var CONDITION: String?
    public var REM: String?
    public var REM1: String?
    public var REM2: String?
    public var DESCRIPTION1: String?
    public var DESCRIPTION2: String?
    public var DESCRIPTION3: String?
    public var BUSS_CODE1: String?
    public var BUSS_CODE2: String?
    public var BUSS_CODE3: String?
    public var BUSS_CODE4: String?
    public var BUSS_PROD1: String?
    public var BUSS_PROD2: String?
    public var BUSS_PROD3: String?
    public var BUSS_PROD4: String?
    public var CE_NAME: String?
    public var CE_JOBDESC: String?
    public var CE_POSITION: String?
    public var CE_HANDPHONE: String?
    public var CE_EMAIL: String?

    public enum CodingKeys: String, CodingKey {
        case CUSTOMER_NO = "CUSTOMER_NO"
        case PREFIX = "PREFIX"
        case NAME = "NAME"
        case NAMEENG = "NAMEENG"
        case SHORTNAME = "SHORTNAME"
        case ADDR = "ADDR"
        case ADDRL2 = "ADDRL2"
        case POSTCODE = "POSTCODE"
        case TEL = "TEL"
        case FAX = "FAX"
        case TAX_ID = "TAX_ID"
        case BRANCH = "BRANCH"
        case OPEN_DATE = "OPEN_DATE"
        case SALENAME = "SALENAME"
        case SALECODE1 = "SALECODE1"
        case SALECODE2 = "SALECODE2"
        case SALECODE3 = "SALECODE3"
        case SALECODE4 = "SALECODE4"
        case CREDIT = "CREDIT"
        case AMOUNT = "AMOUNT"
        case CREDIT_AMOUNT = "CREDIT_AMOUNT"
        case AR = "AR"
        case CHQ_RET = "CHQ_RET"
        case TERM = "TERM"
        case CONDITION = "CONDITION"
        case REM = "REM"
        case REM1 = "REM1"
        case REM2 = "REM2"
        case DESCRIPTION1 = "DESCRIPTION1"
        case DESCRIPTION2 = "DESCRIPTION2"
        case DESCRIPTION3 = "DESCRIPTION3"
        case BUSS_CODE1 = "BUSS_CODE1"
        case BUSS_CODE2 = "BUSS_CODE2"
        case BUSS_CODE3 = "BUSS_CODE3"
        case BUSS_CODE4 = "BUSS_CODE4"
        case BUSS_PROD1 = "BUSS_PROD1"
        case BUSS_PROD2 = "BUSS_PROD2"
        case BUSS_PROD3 = "BUSS_PROD3"
        case BUSS_PROD4 = "BUSS_PROD4"
        case CE_NAME = "CE_NAME"
        case CE_JOBDESC = "CE_JOBDESC"
        case CE_POSITION = "CE_POSITION"
        case CE_HANDPHONE = "CE_HANDPHONE"
        case CE_EMAIL = "CE_EMAIL"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        CUSTOMER_NO = try values.decode(Int?.self, forKey: .CUSTOMER_NO)
        PREFIX = try values.decode(String?.self, forKey: .PREFIX)
        NAME = try values.decode(String?.self, forKey: .NAME)
        NAMEENG = try values.decode(String?.self, forKey: .NAMEENG)
        SHORTNAME = try values.decode(String?.self, forKey: .SHORTNAME)
        ADDR = try values.decode(String?.self, forKey: .ADDR)
        ADDRL2 = try values.decode(String?.self, forKey: .ADDRL2)
        POSTCODE = try values.decode(String?.self, forKey: .POSTCODE)
        TEL = try values.decode(String?.self, forKey: .TEL)
        FAX = try values.decode(String?.self, forKey: .FAX)
        TAX_ID = try values.decode(String?.self, forKey: .TAX_ID)
        BRANCH = try values.decode(String?.self, forKey: .BRANCH)
        OPEN_DATE = try values.decode(String?.self, forKey: .OPEN_DATE)
        SALENAME = try values.decode(String?.self, forKey: .SALENAME)
        SALECODE1 = try values.decode(String?.self, forKey: .SALECODE1)
        SALECODE2 = try values.decode(String?.self, forKey: .SALECODE2)
        SALECODE3 = try values.decode(String?.self, forKey: .SALECODE3)
        SALECODE4 = try values.decode(String?.self, forKey: .SALECODE4)
        CREDIT = try values.decode(Double?.self, forKey: .CREDIT)
        AMOUNT = try values.decode(Double?.self, forKey: .AMOUNT)
        CREDIT_AMOUNT = try values.decode(Double?.self, forKey: .CREDIT_AMOUNT)
        AR = try values.decode(Double?.self, forKey: .AR)
        CHQ_RET = try values.decode(Double?.self, forKey: .CHQ_RET)
        TERM = try values.decode(Int?.self, forKey: .TERM)
        CONDITION = try values.decode(String?.self, forKey: .CONDITION)
        REM = try values.decode(String?.self, forKey: .REM)
        REM1 = try values.decode(String?.self, forKey: .REM1)
        REM2 = try values.decode(String?.self, forKey: .REM2)
        DESCRIPTION1 = try values.decode(String?.self, forKey: .DESCRIPTION1)
        DESCRIPTION2 = try values.decode(String?.self, forKey: .DESCRIPTION2)
        DESCRIPTION3 = try values.decode(String?.self, forKey: .DESCRIPTION3)
        BUSS_CODE1 = try values.decode(String?.self, forKey: .BUSS_CODE1)
        BUSS_CODE2 = try values.decode(String?.self, forKey: .BUSS_CODE2)
        BUSS_CODE3 = try values.decode(String?.self, forKey: .BUSS_CODE3)
        BUSS_CODE4 = try values.decode(String?.self, forKey: .BUSS_CODE4)
        BUSS_PROD1 = try values.decode(String?.self, forKey: .BUSS_PROD1)
        BUSS_PROD2 = try values.decode(String?.self, forKey: .BUSS_PROD2)
        BUSS_PROD3 = try values.decode(String?.self, forKey: .BUSS_PROD3)
        BUSS_PROD4 = try values.decode(String?.self, forKey: .BUSS_PROD4)
        CE_NAME = try values.decode(String?.self, forKey: .CE_NAME)
        CE_JOBDESC = try values.decode(String?.self, forKey: .CE_JOBDESC)
        CE_POSITION = try values.decode(String?.self, forKey: .CE_POSITION)
        CE_HANDPHONE = try values.decode(String?.self, forKey: .CE_HANDPHONE)
        CE_EMAIL = try values.decode(String?.self, forKey: .CE_EMAIL)

    }
}
