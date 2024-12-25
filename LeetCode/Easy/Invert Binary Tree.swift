/*
  Invert Binary Tree
  URL: https://leetcode.com/problems/invert-binary-tree
  Difficulty: Easy
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let n = root else {
            return nil
        }
        invertTree(n.left)
        invertTree(n.right)
        swap(&n.left, &n.right)
        return n
    }
}
