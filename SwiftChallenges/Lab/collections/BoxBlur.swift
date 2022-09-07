//
//  BoxBlur.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/6/22.
//  https://en.wikipedia.org/wiki/Box_blur

import Foundation

class BoxBlur {
    static func blur(image: [[Int]]) -> [[Int]] {
        let m = image[0].count - 2
        let n = image.count - 2
        var result = [[Int]]()

        for i in 0 ..< n {
            var temp = [Int]()
            for j in 0 ..< m {
                let x = i + 1
                let y = j + 1

                let z1 = image[x-1][y-1]
                let z2 = image[x][y-1]
                let z3 = image[x+1][y-1]

                let z4 = image[x-1][y]
                let z5 = image[x][y]
                let z6 = image[x+1][y]

                let z7 = image[x-1][y+1]
                let z8 = image[x][y+1]
                let z9 = image[x+1][y+1]

                let array = [z1,z2,z3, z4,z5,z6, z7, z8, z9]
                let average = array.reduce(0,+)/9
                temp.append(average)
            }

            result.append(temp)
        }

        return result
    }
}
