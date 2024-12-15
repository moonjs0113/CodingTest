/*
  Pseudo-Palindromic Paths in a Binary Tree
  URL: https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree
  Difficulty: Medium
  Topic : Bit Manipulation, Tree, Depth-First Search, Breadth-First Search, Binary Tree
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
    var paths = 0
    
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        getIntArray(root, Set<Int>())
        return paths
    }
    
    func getIntArray(_ node: TreeNode, _ intSet: Set<Int>)  {
        var newIntSet = intSet
        if newIntSet.contains(node.val) {
            newIntSet.remove(node.val)  
        } else {
            newIntSet.insert(node.val)  
        }
        
        if node.right == nil && node.left == nil {
            paths += (newIntSet.count < 2 ? 1 : 0)
            return
        }
        
        if let left = node.left { getIntArray(left, newIntSet) }
        if let right = node.right { getIntArray(right, newIntSet) }
    }
}
