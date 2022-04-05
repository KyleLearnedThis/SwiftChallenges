//
//  ProductSumDifference.swift
//  SwiftCodes
//  https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import Foundation

class ProductSumDifference {
    static func subtractProductAndSum(_ n: Int) -> Int {
        let i = String(n)
        var product = 1
        var sum = 0
        
        for c in Array(i) {
            let cur = Int(String(c))!
            product = product * cur
            sum = sum + cur
        }
        return product - sum
    }
}
