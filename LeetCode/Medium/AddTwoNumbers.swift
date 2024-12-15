/*
  Add Two Numbers
  URL: https://leetcode.com/problems/add-two-numbers
  Difficulty: Medium
  Topic : Linked List, Math, Recursion
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0)
        if sum > 9 {
            if let nextNode = l1?.next {
                nextNode.val += 1
            } else {
                l1?.next = ListNode(1)
            }
        }
        return ListNode(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    }
}
