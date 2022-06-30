//
//  MaximumFrequencyStack.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/28/22.
//  https://leetcode.com/problems/maximum-frequency-stack/

import Foundation

class MaximumFrequencyStack {
    var numFrequency: [Int:Int]
    var stack: [Int]

    init() {
        numFrequency = [Int:Int]()
        stack = [Int]()
    }

    func push(_ val: Int) {
        let count = numFrequency[val, default: 0] + 1
        numFrequency[val] = count
        stack.append(val)
    }

    func push(_ input: [Int]) {
        for i in input {
            push(i)
        }
    }

    func pop() -> Int {
        let entries = numFrequency.sorted { $0.1 > $1.1 }
        let maxFreq = entries[0].value
        let maxEntries = entries.filter{ $0.value == maxFreq }

        var cur = 0
        if maxEntries.count > 1 {
            let keys = maxEntries.map {$0.key}
            cur = lastIntersection(array1: keys, array2: stack)
        } else {
            cur = entries[0].key
        }

        let entry = maxEntries.filter{$0.key == cur}.first!
        let key = entry.key
        let freq = entry.value

        if freq == 1 {
            numFrequency.removeValue(forKey: key)
        } else if freq > 1 {
            numFrequency[key] = freq - 1
        }

        let n = stack.count
        for (i, value) in stack.reversed().enumerated() {
            if value == cur {
                stack.remove(at: n - i - 1)
                break
            }
        }
        return key
    }

    func lastIntersection(array1: [Int], array2: [Int]) -> Int {
        let a = NSMutableOrderedSet(array: array1)
        let b = NSMutableOrderedSet(array: array2)
        b.intersect(a)
        let result = b.lastObject as! Int
        return result
    }

    func printAll() {
        for num in stack {
            print("\(num)", terminator: " ")
        }
        print()
    }

    func printFrequency() {
        let entries = numFrequency.sorted { $0.1 > $1.1 }
        for entry in entries {
            let key = entry.key
            let value = entry.value
            print("[\(key) : \(value)]", terminator: " ")
        }
        print()
    }
}

class MaximumFrequencyStackV2 {
    private var numFreq: [Int: Int]
    private var freqNums: [Int: [Int]]
    private var maxFreq: Int

    init() {
        self.numFreq = [Int: Int]()
        self.freqNums = [Int: [Int]]()
        self.maxFreq = 0
    }

    func push(_ x: Int) {
        let freq = numFreq[x, default: 0] + 1
        numFreq[x] = freq
        var array = freqNums[freq, default: [Int]()]
        array.append(x)
        maxFreq = max(maxFreq, freq)
    }

    func pop() -> Int {
        let num = freqNums[maxFreq, default: [Int]()].removeLast()
        numFreq[num, default: Int(0)] -= 1
        if freqNums[maxFreq, default: [Int]()].isEmpty {
            maxFreq -= 1
        }
        return num
    }
}
