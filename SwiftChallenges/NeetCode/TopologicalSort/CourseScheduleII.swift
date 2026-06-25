//
//  CourseScheduleII.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/24/26.
//  https://leetcode.com/problems/course-schedule-ii

class CourseScheduleII {

    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // Build adjacency list: course → list of its prerequisites
        var adjacencyList = [Int: [Int]]()
        for course in 0..<numCourses {
            adjacencyList[course] = []
        }

        // Each pair [course, prereq] means "to take course, you must first take prereq"
        for pair in prerequisites {
            let course = pair[0]
            let prereq = pair[1]
            adjacencyList[course]!.append(prereq)
        }

        // Tracks nodes in the current DFS path — a revisit means a cycle
        var currentPath = Set<Int>()
        // Tracks nodes that are fully processed, so we never redo work for them
        var visited = Set<Int>()
        // Builds up in post-order: a course is appended only after all its prereqs are
        var order = [Int]()

        // Returns false the moment a cycle is detected, true otherwise
        func dfs(_ course: Int) -> Bool {
            // Already fully resolved on an earlier call — nothing left to do
            if visited.contains(course) {
                return true
            }
            // Found a node already being explored higher up this same DFS branch — cycle
            if currentPath.contains(course) {
                return false
            }

            // Mark this course as "in progress" for cycle detection
            currentPath.insert(course)
            // Resolve every prerequisite before this course can be considered done
            for prereq in adjacencyList[course]! {
                if !dfs(prereq) {
                    return false
                }
            }
            // Done exploring this branch — no longer "in progress"
            currentPath.remove(course)
            // Mark complete so future calls can skip straight past it
            visited.insert(course)
            // All prereqs are already in `order`, so it's now safe to append this course
            order.append(course)
            return true
        }

        // Run DFS from every course; memoization (`visited`) means already-processed
        // courses short-circuit immediately when reached again from another branch
        for course in 0..<numCourses {
            if !dfs(course) {
                // Cycle found somewhere in the graph — no valid order exists
                return []
            }
        }
        return order
    }
}
