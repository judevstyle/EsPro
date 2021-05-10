//
//  CustomerInfoDetailListModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/9/21.
//

import Foundation
import UIKit

public struct CustomerInfoDetailListModel: Codable {
    
    public var arrowImage: String?
    public var title: String = ""
    public var iconImage: String?
    
    enum CodingKeys: String, CodingKey {
        case arrowImage = "arrowImage"
        case title = "title"
        case iconImage = "iconImage"
    }
}
