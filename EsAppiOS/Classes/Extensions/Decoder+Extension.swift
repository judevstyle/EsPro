//
//  Decoder+Extension.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation

extension Decoder {
    public subscript(_ key: String) -> (Decoder, String) {
        return (self, key)
    }
}
