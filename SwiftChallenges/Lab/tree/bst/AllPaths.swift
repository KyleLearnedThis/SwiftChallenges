//
//  AllPaths.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//


public class AllPaths {
    public func binaryTreePaths(root: TreeNode<Int>?) -> Array<String> {
        var finalResult: Array<String> = []
        if root == nil {
            return finalResult
        }
        var node = root
        var curr = Array<String>()
        var results = Array<Array<String>>()

        if root != nil {
            dfs(root: &node, allPaths: &results, path: &curr)
        }

        finalResult = formatPaths(results: results)
        return finalResult
    }

    func dfs(root: inout TreeNode<Int>?, allPaths: inout Array<Array<String>>, path: inout Array<String>) {
        if let x = root?.data {
            path.append(String(x))
        }

        if root?.left == nil && root?.right == nil {
            allPaths.append(path)
            return
        }

        if root?.left != nil {
            var temp = Array<String>(path)
            var left = root?.left
            dfs(root: &left, allPaths: &allPaths, path: &temp)
        }

        if root?.right != nil {
            var temp = Array<String>(path)
            var right = root?.right
            dfs(root: &right, allPaths: &allPaths, path: &temp)
        }
    }

    public func formatPaths(results: Array<Array<String>>) -> Array<String> {
        var formattedResult = Array<String>()
        for al in results {
            var line = al[0]
            for i in 1..<al.count {
                let x = al[i]
                line.append("->\(x)")
            }
            print("======== line: \(line)")
            formattedResult.append(line)
        }
        return formattedResult
    }
}

