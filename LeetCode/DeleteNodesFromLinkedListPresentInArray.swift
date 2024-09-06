/*
  Delete Nodes From Linked List Present in Array
  URL: https://leetcode.com/problems/delete-nodes-from-linked-list-present-in-array
  Difficulty: Medium
  Topic : Array, Hash Table, Linked List
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
class Solution {
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        let set = Set(nums)
        let resultNode = ListNode(0, head)
        func recursion(_ prev: ListNode?, _ node: ListNode?) {
            if node == nil { return }
            if set.contains(node!.val) {
                prev?.next = node?.next
                recursion(prev, prev?.next)
            } else {
                recursion(node, node?.next)
            }
        }
        recursion(resultNode, head)
        return resultNode.next
    }
}
