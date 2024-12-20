/*
  Reverse Odd Levels of Binary Tree
  URL: https://leetcode.com/problems/reverse-odd-levels-of-binary-tree
  Difficulty: Medium
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
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let r = root else {
            return nil
        }
        var q = [r]
        var level = 0
        while !q.isEmpty {
            if q[0].left == nil { break }
            var buffer: [TreeNode] = []
            level += 1
            for n in q {
                if let l = n.left {
                    buffer.append(l)
                }
                if let r = n.right {
                    buffer.append(r)
                }
            }
            if level % 2 == 1 {
                let len = buffer.count
                for i in 0..<len/2 {
                    swap(&buffer[i].val, &buffer[len-1-i].val)
                }
            }
            q = buffer
        }
        return root
    }
}
