/*
  Minimum Time to Visit a Cell In a Grid
  URL: https://leetcode.com/problems/minimum-time-to-visit-a-cell-in-a-grid
  Difficulty: Hard
  Topic: Array, Breadth-First Search, Graph, Heap (Priority Queue), Matrix, Shortest Path
  Heap Source: https://github.com/moonjs0113/CodingTest/blob/main/DataStructure/Heap.swift
*/

class Solution {
    func minimumTime(_ grid: [[Int]]) -> Int {
        let move = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        if grid[0][1] > 1 && grid[1][0] > 1 { return -1 }
        let rows = grid.count
        let cols = grid[0].count
        var visitied: Set<[Int]> = []
        var heap = Heap<Cell>(priorityFunction: <)
        heap.push(Cell(time: grid[0][0], row: 0, col: 0))
        while !heap.isEmpty {
            guard let cell = heap.pop() else {
                break
            }
            if cell.row == rows - 1 && cell.col == cols - 1 {
                return cell.time
            }
            if visitied.contains([cell.row, cell.col]) {
                continue
            }
            visitied.insert([cell.row, cell.col])
            for m in move {
                let next = [cell.row + m[0], cell.col + m[1]]
                if !(0 <= next[0] && next[0] < rows && 0 <= next[1] && next[1] < cols) {
                    continue
                }
                let waitTime = ((grid[next[0]][next[1]] - cell.time) % 2 == 0 ? 1 : 0)
                let nextTime = max(grid[next[0]][next[1]] + waitTime, cell.time + 1)
                heap.push(Cell(time: nextTime, row: next[0], col: next[1]))
            }
        }
        return 0
    }
}

class Cell: Comparable {
    var time: Int
    var row: Int
    var col: Int
    static func < (lhs: Cell, rhs: Cell) -> Bool {
        lhs.time < rhs.time
    }
    
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        lhs.time == rhs.time
    }
    init(time: Int, row: Int, col: Int) {
        self.time = time
        self.row = row
        self.col = col
    }
}
