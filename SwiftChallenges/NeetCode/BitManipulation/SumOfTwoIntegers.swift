//
//  SumOfTwoIntegers.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/sum-of-two-integers/

class SumOfTwoIntegers {

    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        // Repeat until there's no carry left to add in.
        while b != 0 {
            // XOR adds each bit pair without propagating a carry (1+1 -> 0, dropping the carry).
            let sum = a ^ b
            // AND finds every position that generated a carry; shift it left to line up
            // with the next bit position, matching how carries work in grade-school addition.
            let carry = (a & b) << 1
            a = sum
            b = carry
        }
        return a
    }
}
