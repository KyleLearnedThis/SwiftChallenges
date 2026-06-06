//
//  EvaluateReversePolishNotation.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/26.
//  https://leetcode.com/problems/evaluate-reverse-polish-notation/

class EvaluateReversePolishNotation {
    enum operation: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case divide = "/"
    }
    
    var stack = [Int]()

    func evalRPN(_ tokens: [String]) -> Int {
        let operations: [operation] = [.plus, .minus, .multiply, .divide]
        
        for token in tokens {
            if operations.contains(where: { $0.rawValue == token }) {
                let b = stack.removeLast()
                let a = stack.removeLast()
                
                switch token {
                case operation.plus.rawValue:
                    stack.append(a + b)
                case operation.minus.rawValue:
                    stack.append(a - b)
                case operation.multiply.rawValue:
                    stack.append(a * b)
                case operation.divide.rawValue:
                    stack.append(a / b)
                default:
                    break
                }
            } else {
                stack.append(Int(token)!)
            }
        }
        let result = stack.removeLast()
        return result
    }
}
