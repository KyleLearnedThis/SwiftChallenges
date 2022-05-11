//
//  StudentGrading.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/10/22.
//  https://www.hackerrank.com/challenges/grading/problem?isFullScreen=true

import Foundation

class StudentGrading {
    static func gradingStudents(grades: [Int]) -> [Int] {
        let result = grades.map { grade -> Int in
            if grade >= 38 {
                let temp = grade % 10
                if [3,4,8,9].contains(temp) {
                    var diff = 0
                    if [3,4].contains(temp) {
                        diff = 5 - temp
                    } else {
                        diff = 10 - temp
                    }
                    return grade + diff
                } else {
                    return grade
                }
            } else {
                return grade
            }
        }
        return result
    }
}
