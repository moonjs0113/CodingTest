/*
  Spiral Matrix IV
  URL: https://leetcode.com/problems/spiral-matrix-iv
  Difficulty: Medium
  Topic : Array, Linked List, Matrix
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        enum Direction {
            case north, east, west, south
        }
        var matrix = Array(repeating: Array(repeating: -1, count: n), count: m)
        var node = head
        var direction: Direction = .east
        var rect = (1, n-1, m-1, 0)
        var x = 0, y = 0
        while true {
            if node == nil { break }
            matrix[y][x] = node?.val ?? -1
            switch direction {
                case .north:
                    if y == rect.0 { 
                        direction = .east
                        x += 1
                        rect.0 += 1
                    } else { y -= 1 }
                case .east:
                    if x == rect.1 {
                        direction = .south
                        y += 1
                        rect.1 -= 1
                    } else { x += 1 }
                case .west:
                    if x == rect.3 {
                        direction = .north
                        y -= 1
                        rect.3 += 1
                    } else { x -= 1 }
                case .south:
                    if y == rect.2 {
                        direction = .west
                        x -= 1
                        rect.2 -= 1
                    } else { y += 1 }
            }
            node = node?.next
        }
        return matrix
    }
}
