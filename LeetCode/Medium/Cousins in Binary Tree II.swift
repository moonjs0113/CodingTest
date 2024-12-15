/*
  Cousins in Binary Tree II
  URL: https://leetcode.com/problems/cousins-in-binary-tree-ii
  Difficulty: Medium
  Topic : Hash Table, Tree, Depth-First Search, Breadth-First Search, Binary Tree
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
    func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        var depthSum = root!.val
        var nextSum = [root!.val]
        var cur: [[TreeNode]] = [[root!]]
        var next: [[TreeNode]] = []
        while !cur.isEmpty {
            var newDepthSum = 0
            var newNextSum: [Int] = []
            for i in 0..<cur.count {
                for node in cur[i] {
                    node.val = depthSum - nextSum[i]
                    var pair: [TreeNode] = []
                    var sum = 0
                    if let left = node.left {
                        pair.append(left)
                        sum += left.val
                    }
                    if let right = node.right { 
                        pair.append(right)
                        sum += right.val
                    }
                    next.append(pair)
                    newNextSum.append(sum)
                    newDepthSum += sum
                }
            }
            cur = next
            next = []
            nextSum = newNextSum
            depthSum = newDepthSum
        }
        return root
    }
}
