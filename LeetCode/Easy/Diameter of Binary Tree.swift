/*
  Diameter of Binary Tree
  URL: https://leetcode.com/problems/diameter-of-binary-tree
  Difficulty: Easy
  Topic: Tree, Depth-First Search, Binary Tree
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        func dfs(n: TreeNode) -> Int {
            var lDepth = 0
            var rDepth = 0
            if let l = n.left {
                lDepth = dfs(n: l) + 1
            }
            if let r = n.right {
                rDepth = dfs(n: r) + 1
            }
            result = max(result, rDepth + lDepth)
            return max(lDepth, rDepth)
        }
        if let r = root {
            _ = dfs(n: r)
        }
        return result
    }
}
