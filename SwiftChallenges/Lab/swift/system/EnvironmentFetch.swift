//
//  EnvironmentFetch.swift
//  SwiftCodes
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import Foundation

class EnvironmentFetch {
    static func get(name: String) -> String{
        if let value = ProcessInfo.processInfo.environment[name] {
            return value
        } else {
            return ""
        }
    }
}
