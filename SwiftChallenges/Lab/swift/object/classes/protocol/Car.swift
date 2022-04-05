//
//  Car.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class Car {
    func describe() {
        print("====== This is a car ======")
    }
}

extension Car: Sound {
    func makeSound() {
        print("======== HONK! ========")
    }
}
