/*
  Kth Largest Sum in a Binary Tree
  URL: https://leetcode.com/problems/kth-largest-sum-in-a-binary-tree
  Difficulty: Medium
  Topic : Tree, Breadth-First Search, Sorting, Binary Tree
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
    func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
        var result: [Int] = []
        var cur: [TreeNode] = [root!]
        var next: [TreeNode] = []
        while !cur.isEmpty {
            var s = 0
            for n in cur {
                s += n.val
                if let left = n.left { next.append(left) }
                if let right = n.right { next.append(right) }
            }
            result.append(s)
            cur = next
            next = []
        }
        return k <= result.count ? result.sorted(by: >)[k-1] : -1
    }
}
