//
//  PacificAtlanticWaterFlow.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/14/26.
//  https://leetcode.com/problems/pacific-atlantic-water-flow/
//
//  Key insight: instead of asking "can water from cell X reach both oceans?"
//  (which requires two separate searches per cell), reverse the question:
//  "starting from each ocean's border, which cells can water flow UP to?"
//  Water flows downhill, so in reverse we move to neighbors with equal or greater height.
//  Any cell reachable from both borders in reverse belongs to the answer.

class PacificAtlanticWaterFlow {
    // BFS approach — O(m*n) time, O(m*n) space
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        guard !heights.isEmpty else { return [] }
        let rows = heights.count, cols = heights[0].count

        // Pacific touches the top row and left column.
        // Atlantic touches the bottom row and right column.
        var pacificStarts: [[Int]] = [], atlanticStarts: [[Int]] = []
        for r in 0..<rows {
            pacificStarts.append([r, 0])        // left column → Pacific
            atlanticStarts.append([r, cols - 1]) // right column → Atlantic
        }
        for c in 0..<cols {
            pacificStarts.append([0, c])          // top row → Pacific
            atlanticStarts.append([rows - 1, c])  // bottom row → Atlantic
        }

        // BFS outward from each ocean; collect all cells reachable in reverse.
        let pacific = bfs(starts: pacificStarts, heights: heights)
        let atlantic = bfs(starts: atlanticStarts, heights: heights)

        // Cells in both sets can drain to both oceans.
        return pacific.filter { atlantic.contains($0) }
    }

    // Expands outward from the border cells, moving to any unvisited neighbor
    // whose height is >= the current cell (reverse of water-flow direction).
    private func bfs(starts: [[Int]], heights: [[Int]]) -> Set<[Int]> {
        let rows = heights.count, cols = heights[0].count
        var visited = Set(starts)
        var queue = starts
        var i = 0
        while i < queue.count {
            let cell = queue[i]; i += 1
            let r = cell[0], c = cell[1]

            func enqueue(_ nr: Int, _ nc: Int) {
                guard nr >= 0, nr < rows, nc >= 0, nc < cols else { return }
                guard !visited.contains([nr, nc]) else { return }
                guard heights[nr][nc] >= heights[r][c] else { return } // uphill only
                visited.insert([nr, nc])
                queue.append([nr, nc])
            }

            enqueue(r - 1, c) // up
            enqueue(r + 1, c) // down
            enqueue(r, c - 1) // left
            enqueue(r, c + 1) // right
        }
        return visited
    }

    // DFS approach (preferred) — O(m*n) time, O(m*n) space
    func pacificAtlanticDFS(_ heights: [[Int]]) -> [[Int]] {
        guard !heights.isEmpty else { return [] }
        let rows = heights.count
        let cols = heights[0].count
        var pacific = Set<[Int]>()
        var atlantic = Set<[Int]>()

        // Recursively marks all cells reachable uphill from (r, c).
        func dfs(_ r: Int, _ c: Int, _ visited: inout Set<[Int]>) {
            visited.insert([r, c])

            func explore(_ nr: Int, _ nc: Int) {
                guard nr >= 0, nr < rows, nc >= 0, nc < cols else { return }
                guard !visited.contains([nr, nc]) else { return }
                guard heights[nr][nc] >= heights[r][c] else { return } // uphill only
                dfs(nr, nc, &visited)
            }

            explore(r - 1, c) // up
            explore(r + 1, c) // down
            explore(r, c - 1) // left
            explore(r, c + 1) // right
        }

        // Seed DFS from every border cell for each ocean.
        for r in 0..<rows {
            dfs(r, 0, &pacific)        // left column → Pacific
            dfs(r, cols - 1, &atlantic) // right column → Atlantic
        }
        for c in 0..<cols {
            dfs(0, c, &pacific)          // top row → Pacific
            dfs(rows - 1, c, &atlantic)  // bottom row → Atlantic
        }

        return pacific.filter { atlantic.contains($0) }
    }
}
