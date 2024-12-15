/*
  Range Sum of BST
  URL: https://leetcode.com/problems/range-sum-of-bst
  Difficulty: Easy
  Topic: Tree, Depth-First Search, Binary Search Tree, Binary Tree
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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let r = root else {
            return 0
        }
        var q = [r]
        var result = 0
        while !q.isEmpty {
            var buffer: [TreeNode] = []
            for n in q {
                if low <= n.val && n.val <= high {
                    result += n.val
                }
                if let l = n.left {
                    buffer.append(l)
                }
                if let r = n.right {
                    buffer.append(r)
                }
            }
            q = buffer
        }
        return result
    }
}
