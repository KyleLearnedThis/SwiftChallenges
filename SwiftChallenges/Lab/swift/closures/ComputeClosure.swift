//
//  CustomClosure.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 6/23/20.
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import Foundation

class ComputeClosure {
    var result = 0

    func addOne(input: Int, closure: (Int)->Int ) {
        result = closure(input)
        result += 1
        print("Step 2: result is \(result)")
    }

    func greet(name: String, closure: () -> ()) {
        print("Hello, \(name)!")
        closure()
    }

    func add(x: Int, y: Int, closure: ((Int, Int) -> Int)) -> Int {
        let result = closure(x, y)
        return result
    }
}
