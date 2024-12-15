/*
  Binary Tree Right Side View
  URL: https://leetcode.com/problems/binary-tree-right-side-view
  Difficulty: Medium
  Topic : Tree, Depth-First Search, Breadth-First Search, Binary Tree
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var q = [root!]
        var result: [Int] = []
        while !q.isEmpty {
            var temp: [TreeNode] = []
            if let value = q.last?.val  {
                result.append(value)
            }
            for n in q {
                if let left = n.left { temp.append(left) }
                if let right = n.right { temp.append(right) }
            }
            q = temp
        }
        return result
    }
}
