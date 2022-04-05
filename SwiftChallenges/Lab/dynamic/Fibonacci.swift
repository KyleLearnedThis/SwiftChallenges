//
//  Fibonacci.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

class Fibonacci {

    func v1(n: Int) -> Int {
        if(n == 0) {
            return 0
        } else if(n == 1) {
            return 1
        }
        return v1(n: n - 1) + v1(n: n - 2);
    }
    
    func v2(n: Int) -> Int {
        var map: [Int: Int] = [:]
        map[0] = 0
        map[1] = 1
        if(n == 0 || n == 1) {
            return map[n]!
        } else {
            for i in 2 ... n {
                let x = map[i-1]! + map[i-2]!
                map[i] = x
            }
        }
        return map[n]!
    }
}
