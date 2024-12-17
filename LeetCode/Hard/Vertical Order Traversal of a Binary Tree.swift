/*
  Vertical Order Traversal of a Binary Tree
  URL: https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree
  Difficulty: Hard
  Topic : Hash Table, Tree, Depth-First Search, Breadth-First Search, Sorting, Binary Tree
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else {
            return []
        }
        var q = [(r,0)]
        var result: [Int: [(Int,Int)]] = [:]
        var depth = 0
        while !q.isEmpty {
            var buffer: [(TreeNode,Int)] = []
            depth += 1
            for n in q {
                result[n.1, default: []].append((n.0.val, depth))
                if let l = n.0.left {
                    buffer.append((l, n.1 - 1))
                }
                if let r = n.0.right {
                    buffer.append((r, n.1 + 1))
                }
            }
            q = buffer
        }
        return result.sorted { $0.key < $1.key }.map { i in
            return i.value.sorted {
                if $0.1 == $1.1 { return $0.0 < $1.0 }
                return $0.1 < $1.1
            }.map { $0.0 }
        }
    }
}

