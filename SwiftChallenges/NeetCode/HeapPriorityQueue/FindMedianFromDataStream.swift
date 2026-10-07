//
//  FindMedianFromDataStream.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/27/26.
//  https://leetcode.com/problems/find-median-from-data-stream/

class FindMedianFromDataStream {
    private var low = SimpleHeap<Int>(>)   // max-heap: smaller half
    private var high = SimpleHeap<Int>(<)  // min-heap: larger half
    
    init() {

    }

    func addNum(_ num: Int) {
        low.push(num)
        high.push(low.pop()!)
        if high.count > low.count {
            low.push(high.pop()!)
        }
    }

    func findMedian() -> Double {
        if low.count > high.count {
            return Double(low.peek!)
        }
        return Double(low.peek! + high.peek!) / 2.0
    }
}

struct SimpleHeap<T> {
    // CLRS-style 1-indexed positions: root is 1, children are 2i and 2i + 1, parent is i / 2.
    // Swift arrays start at 0, so element(at:) and swap(_:_:) shift each position down by one.
    private var items: [T] = []
    private let isHigherPriority: (T, T) -> Bool

    init(_ isHigherPriority: @escaping (T, T) -> Bool) {
        self.isHigherPriority = isHigherPriority
    }

    var count: Int { items.count }
    var peek: T? { items.first }

    mutating func push(_ value: T) {
        items.append(value)
        heapifyUp(from: count)
    }

    mutating func pop() -> T? {
        guard !items.isEmpty else { return nil }
        swap(1, count)
        let top = items.removeLast()
        heapifyDown(from: 1)
        return top
    }

    private func parent(_ i: Int) -> Int { i / 2 }
    private func left(_ i: Int) -> Int { 2 * i }
    private func right(_ i: Int) -> Int { 2 * i + 1 }

    private func element(at i: Int) -> T { items[i - 1] }
    private mutating func swap(_ i: Int, _ j: Int) { items.swapAt(i - 1, j - 1) }

    private mutating func heapifyUp(from index: Int) {
        var child = index
        while child > 1 {
            let parentIndex = parent(child)
            if !isHigherPriority(element(at: child), element(at: parentIndex)) { return }
            swap(child, parentIndex)
            child = parentIndex
        }
    }

    // MAX-HEAPIFY from CLRS, recursive like the book.
    private mutating func heapifyDown(from i: Int) {
        let leftIndex = left(i)
        let rightIndex = right(i)
        var highest = i

        if leftIndex <= count && isHigherPriority(element(at: leftIndex), element(at: highest)) {
            highest = leftIndex
        }
        if rightIndex <= count && isHigherPriority(element(at: rightIndex), element(at: highest)) {
            highest = rightIndex
        }

        if highest != i {
            swap(i, highest)
            heapifyDown(from: highest)
        }
    }
}
