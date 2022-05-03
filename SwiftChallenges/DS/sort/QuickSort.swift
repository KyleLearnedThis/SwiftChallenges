//
//  QuickSort.swift
//  SwiftDS
//  https://github.com/zafersevik/algorithms-in-swift/blob/master/QuickSort.playground/Contents.swift

import Foundation

class QuickSort: BaseSort {

    func partition(array: inout [Int], startIndex: Int, endIndex: Int) -> Int {
        var q = startIndex
        for index in startIndex..<endIndex {
            if array[index] < array[endIndex] {
                array.swapAt(q, index)
                q += 1
            }
        }
        array.swapAt(q, endIndex)
        return q
    }

    func sort() -> [Int] {
        if input.isEmpty {
            return input
        }
        quickSort(array: &input, startIndex: 0, endIndex: input.count-1)
        return input
    }

    func quickSort(array: inout [Int], startIndex: Int, endIndex: Int) {
        // Base case
        if startIndex >= endIndex {
            return
        }
        let pivotIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
        quickSort(array: &array, startIndex: startIndex, endIndex: pivotIndex-1)
        quickSort(array: &array, startIndex: pivotIndex+1, endIndex: endIndex)
    }
}
