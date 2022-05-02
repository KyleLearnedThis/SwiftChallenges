//
//  QueueRemovals.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/2/22.
//  https://leetcode.com/discuss/interview-question/1039925/Facebook-Practice-question-or-Queue-Removals

class QueueRemovals {

    class Position {
        var index: Int
        var val: Int
        init(index: Int = 0, val: Int = 0) {
            self.index = index
            self.val = val
        }
    }

    static func findPositions(input: [Int], x: Int) -> [Int] {
        var output = [Int](repeating: -1, count: x)
        var queue = [Position]()
        for (i, v) in input.enumerated() {
            let pos = Position(index: i+1, val: v)
            queue.append(pos)
        }

        var popped = [Position]()
        var pass = 0

        for _ in 0..<x {
            popped = [Position]()
            var maxValue = Int.min
            var maxIndex = Int.max

            var j = 0
            while j < x && !queue.isEmpty {
                let p = queue.removeFirst()
                popped.append(p)
                if p.val > maxValue {
                    maxValue = p.val
                    maxIndex = p.index
                }
                j += 1
            }

            output[pass] = maxIndex
            pass += 1

            for p in popped {
                if p.index != maxIndex {
                    let entry = Position(index: p.index, val: (p.val == 0) ? p.val : p.val - 1)
                    queue.append(entry)
                }
            }
        }

        return output
    }
}
