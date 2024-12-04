/*
  Path Sum
  URL: https://leetcode.com/problems/path-sum
  Difficulty: Easy
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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        var result = false
        func dfs(_ n: TreeNode, _ re: Int) {
            if result {
                return
            }
            let nr = re - n.val
            if nr == 0 && n.left == nil && n.right == nil {
                result = true
                return
            }
            if let l = n.left {
                dfs(l, nr)
            }
            if let r = n.right {
                dfs(r, nr)
            }
        }
        if let r = root {
            dfs(r, targetSum)
        }
        return result
    }
}
