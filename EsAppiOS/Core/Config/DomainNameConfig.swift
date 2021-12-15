//
//  DomainNameConfig.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation

public enum DomainNameConfig {
    case Login
    case InfoLevel1
}

extension DomainNameConfig {

    public var urlString: String {
        
        let HostURL5000: String = "https://apiesource.com:5000"
        let HostURL5001: String = "http://apiesource.com:5001"
        
        switch self {
        case .Login:
            return "\(HostURL5000)/esprogram"
        case .InfoLevel1:
            return "\(HostURL5001)/esprogram"
        }
    }
    
    public var headerKey: String {
        switch self {
        default:
            return ""
        }
    }
    
    public var url: URL {
        return URL(string: self.urlString)!
    }
}
