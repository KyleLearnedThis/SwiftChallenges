//
//  MappingTransformTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class MappingTransformTest: XCTestCase {

    func testStringToIntArray() {
        let input = ["1", "10", "100", "Hello"]
        let expected = [1, 10, 100]
        let actual = MappingTransform.toIntArrayExample(input)
        let equal = actual.elementsEqual(expected)
        XCTAssertTrue(equal)
    }

    func testTransformArrayIntoPerson() {
        let names = ["Aaron", "Ben", "Chris"]
        let ids = [1, 10, 100]
        var p1: [Person] = [Person]()
        let dict1 = MappingTransform.mergeTwoArrayToDictionary(names, ids)

        dict1.forEach {
            print("===== dict1 - key: \($0.key) value: \($0.value) =====")
            p1.append(Person($0.key, $0.value))
        }

        p1.forEach {
            let name = $0.mName
            let id = $0.mId
            print("===== p1 - key: \(name) value: \(id) =====")
        }

        let dict2 =  MappingTransform.convertPeopleToDictionary(p1)
        dict2.forEach {
            print("===== dict2 - key: \($0.key) value: \($0.value) =====")
        }
    }
}
