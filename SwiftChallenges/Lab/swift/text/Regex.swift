//
//  Regex.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

struct Regex: ExpressibleByStringLiteral, Equatable {

    static let phone: Regex = "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$"

    fileprivate let expression: NSRegularExpression

    init(stringLiteral: String) {
        do {
            self.expression = try NSRegularExpression(pattern: stringLiteral, options: [])
        } catch {
            print("Failed to parse \(stringLiteral) as a regular expression")
            self.expression = try! NSRegularExpression(pattern: ".*", options: [])
        }
    }

    fileprivate func match(_ input: String) -> Bool {
        let result = expression.rangeOfFirstMatch(in: input, options: [],
                                                  range: NSRange(input.startIndex..., in: input))
        return !NSEqualRanges(result, NSMakeRange(NSNotFound, 0))
    }
}

extension Regex {
    static func ~=(pattern: Regex, value: String) -> Bool {
        return pattern.match(value)
    }
}
