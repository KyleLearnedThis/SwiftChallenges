//
//  IPDefanger.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class IPDefanger {
    func defangIPaddr(_ address: String) -> String {
        let n = address.components(separatedBy: ".")
        var result = ""
        for i in n.indices {
            result += n[i]
            if i != n.count - 1 {
                result += "[.]"
            }
        }
        return result
    }
}
