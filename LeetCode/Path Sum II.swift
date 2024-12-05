/*
  Path Sum II
  URL: https://leetcode.com/problems/path-sum-ii
  Difficulty: Medium
  Topic : Backtracking, Tree, Depth-First Search, Binary Tree
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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result: [[Int]] = []
        func dfs(_ n: TreeNode, _ s: Int, _ a: [Int]) {
            let sum = n.val + s
            let arr = a + [n.val]
            if n.left == nil && n.right == nil && sum == targetSum {
                result.append(arr)
            }
            if let l = n.left {
                dfs(l, sum, arr)
            }
            if let r = n.right {
                dfs(r, sum, arr)
            }
        }
        if let r = root {
            dfs(r, 0, [])
        }
        return result
    }
}
