/*
  Minimum Number of Operations to Sort a Binary Tree by Level
  URL: https://leetcode.com/problems/minimum-number-of-operations-to-sort-a-binary-tree-by-level
  Difficulty: Medium
  Topic : Tree, Breadth-First Search, Binary Tree
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
    func minimumOperations(_ root: TreeNode?) -> Int {
        var result = 0
        guard let r = root else {
            return result
        }
        var q = [r]

        func getCount(nums: [Int]) -> Int {
            var swaps = 0
            var nums = nums
            var target = nums.sorted()
            var pos: [Int: Int] = [:]
            
            for (i, n) in nums.enumerated() {
                pos[n] = i
            }

            for i in 0..<nums.count {
                if nums[i] != target[i] {
                    swaps += 1
                    let curPos = pos[target[i]]!
                    pos[nums[i]] = curPos
                    nums[curPos] = nums[i]
                }
            }
            return swaps
        }

        while !q.isEmpty {
            var buffer: [TreeNode] = []
            var arr: [Int] = []
            for n in q {
                arr.append(n.val)
                if let l = n.left {
                    buffer.append(l)
                }
                if let r = n.right {
                    buffer.append(r)
                }
            }
            result += getCount(nums: arr)
            q = buffer
        }
        return result
    }
}
