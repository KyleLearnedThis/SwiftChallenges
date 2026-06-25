//
//  CourseSchedule.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/20/26.
//  https://leetcode.com/problems/course-schedule/
//
//  Approach: DFS cycle detection on a directed graph
//  - Model each course as a node; a prerequisite [a, b] is a directed edge b → a
//  - If a DFS from any node finds a back edge (revisits a node in the current path), there's a cycle
//  - Time: O(V + E)  Space: O(V + E)

class CourseSchedule {

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
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

        func dfs(_ course: Int) -> Bool {
            // Back edge: this course is already in the current DFS path → cycle
            if currentPath.contains(course) {
                return false
            }

            // No prerequisites left → this course is completable
            if adjacencyList[course]!.isEmpty {
                return true
            }

            currentPath.insert(course) // mark as part of current path

            for prerequisite in adjacencyList[course]! {
                if !dfs(prerequisite) {
                    return false
                }
            }

            currentPath.remove(course)             // unmark when backtracking
            adjacencyList[course]!.removeAll()     // memoize: no need to revisit a verified course
            return true
        }

        // A cycle anywhere means not all courses can be finished
        for course in 0..<numCourses {
            if !dfs(course) {
                return false
            }
        }

        return true // no cycles found (trivially true when numCourses == 0)
    }
}
