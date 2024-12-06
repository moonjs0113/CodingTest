/*
  Path Sum III
  URL: https://leetcode.com/problems/path-sum-iii
  Difficulty: Medium
  Topic : Tree, Depth-First Search, Binary Tree
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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var result = 0
        func dfs(_ node: TreeNode, _ sums: [Int]) {
            var values: [Int] = [node.val]
            values += sums.map { $0 + node.val }
            values = values.filter { v in
                if v == targetSum {
                    result += 1
                    return false
                }            
                return true
            }
            if let l = node.left {
                dfs(l, values)
            }
            if let r = node.right {
                dfs(r, values)
            }
        }
        if let r = root { dfs(r, []) }
        return result
    }
}
