//
//  DutchBillDivision.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/22/22.
//  https://www.hackerrank.com/challenges/bon-appetit/problem?isFullScreen=true

import Foundation

class DutchBillDivision {
    /**
     - Parameters:
        - bill: an array of integers representing the cost of each item ordered
        - k: an integer representing the zero-based index of the item Person doesn't eat
        - b: the amount of money that Person contributed to the bill
     - Returns: Void
     */
    func bonAppetit(bill: [Int], k: Int, b: Int) {
        let personSkip = bill[k]
        var personAte = 0
        for i in bill {
            if i != personSkip {
                personAte += i
            }
        }
        let personExpectedToPay = personAte / 2
        let personPaid = b

        if personExpectedToPay >= personPaid {
            print("Bon Appetit")
        } else {
            let diff = personPaid - personExpectedToPay
            print(diff)
        }
    }
}
