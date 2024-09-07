/*
  Linked List in Binary Tree
  URL: https://leetcode.com/problems/linked-list-in-binary-tree
  Difficulty: Medium
  Topic : Linked List, Tree, Depth-First Search, Breadth-First Search, Binary Tree
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
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
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        var result = false
        func checkSubPath(_ list: ListNode?, _ node: TreeNode?) {
            if list == nil { result = true; return }
            if node == nil { return }
            if node!.val == list!.val {
                checkSubPath(list?.next, node?.left)
                checkSubPath(list?.next, node?.right)
            }
        }

        func DFS(_ node: TreeNode?) {            
            if node == nil || result { return }
            if node!.val == head!.val {
                checkSubPath(head, node)
            }
            DFS(node?.left)
            DFS(node?.right)
        }
        DFS(root)
        return result
    }
}
