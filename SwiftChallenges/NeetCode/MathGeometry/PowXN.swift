//
//  PowXN.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/13/26.
//  https://leetcode.com/problems/powx-n/

class PowXN {

    func myPow(_ x: Double, _ n: Int) -> Double {
        // Exponent is unsigned: n.magnitude is safe even for Int.min,
        // whereas abs(Int.min) traps on overflow.
        func power(_ x: Double, _ n: UInt) -> Double {
            if x == 0 {
                return 0.0
            }
            if n == 0 {
                return 1.0
            }
            // Solve the half-exponent subproblem ONCE, then square it.
            // T(n) = T(n/2) + O(1) -> O(log n).
            let half = power(x, n / 2)
            let squared = half * half
            if n.isMultiple(of: 2) {
                return squared
            } else {
                return squared * x
            }
        }
        let result = power(x, n.magnitude)
        if n < 0 {
            return 1.0 / result
        } else {
            return result
        }
    }
}
