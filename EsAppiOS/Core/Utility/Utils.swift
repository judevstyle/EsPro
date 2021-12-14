//
//  Utils.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation

class Utils {
    static func jsonData(from object: Any) -> Data? {
        return try? JSONSerialization.data(withJSONObject: object, options: [])
    }
}
