/*
  Flip Equivalent Binary Trees
  URL: https://leetcode.com/problems/flip-equivalent-binary-trees
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
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1?.val != root2?.val { return false }
        let set1: Set<Int?> = [root1?.left?.val, root1?.right?.val]
        let set2: Set<Int?> = [root2?.left?.val, root2?.right?.val]
        if set1 != set2 { return false }
        if set1.count == 1 && set1.first! == nil { return true }
        if root2?.left?.val == root1?.left?.val {
            if !flipEquiv(root1?.left,root2?.left) { return false }
        } else {
            if !flipEquiv(root1?.left,root2?.right) { return false }
        }
        if root2?.right?.val == root1?.right?.val {
            if !flipEquiv(root1?.right,root2?.right) { return false }
        } else {
            if !flipEquiv(root1?.right,root2?.left) { return false }
        }
        return true
    }
}
