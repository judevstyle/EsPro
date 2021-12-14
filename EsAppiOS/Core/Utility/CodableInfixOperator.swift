//
//  CodableInfixOperator.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation

infix operator <-

let delimiter = "."

// MARK: Decodable
//for non-optional T
public func <- <T: Decodable>(left: inout T, right: (Decoder, String)) throws  {
    let (decoder, key) = right
    let container = try decoder.container(keyedBy: AnyKey.self)
    if key.contains(delimiter) {
        left = try container.decodeDelimiter(T.self, fullKey: key)
    } else {
        left = try container.decode(T.self, forKey: AnyKey(stringValue: key))
    }
}

//for optional T
public func <- <T: Decodable>(left: inout T?, right: (Decoder, String)) throws  {
    let (decoder, key) = right
    let container = try decoder.container(keyedBy: AnyKey.self)
    if key.contains(delimiter) {
        left = try container.decodeDelimiterIfPresent(T.self, fullKey: key)
    } else {
        do {
            left = try container.decodeIfPresent(T.self, forKey: AnyKey(stringValue: key))
        } catch {
            left = nil
        }
    }
}
