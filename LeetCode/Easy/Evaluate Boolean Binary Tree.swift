/*
  Evaluate Boolean Binary Tree
  URL: https://leetcode.com/problems/evaluate-boolean-binary-tree
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
    func evaluateTree(_ root: TreeNode?) -> Bool {
        if root!.val < 2 {
            return root!.val == 1
        }
        let l = evaluateTree(root!.left)
        let r = evaluateTree(root!.right)
        return root!.val == 2 ? (l || r) : (l && r)
    }
}
