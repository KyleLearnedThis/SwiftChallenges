//
//  OnlineStockSpan.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/online-stock-span/

class OnlineStockSpan {
    var stack = [(price: Int, span: Int)]()
    func next(_ price: Int) -> Int {
        var span = 1
        while let top = stack.last, top.price <= price {
            span += top.span
            stack.removeLast()
        }
        stack.append((price, span))
        return span
    }
}
