/*
  Find Largest Value in Each Tree Row
  URL: https://leetcode.com/problems/find-largest-value-in-each-tree-row
  Difficulty: Medium
  Topic: Tree, Depth-First Search, Breadth-First Search, Binary Tree
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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let r = root else {
            return []
        }
        var q = [r]
        var result: [Int] = []

        while !q.isEmpty {
            var v = Int.min
            var buffer: [TreeNode] = []
            for n in q {
                v = max(v, n.val)
                if let l = n.left {
                    buffer.append(l)
                }
                if let r = n.right {
                    buffer.append(r)
                }
            }
            q = buffer
            result.append(v)
        }
        return result
    }
}
