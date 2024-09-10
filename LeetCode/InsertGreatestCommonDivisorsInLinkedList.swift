/*
  Insert Greatest Common Divisors in Linked List
  URL: https://leetcode.com/problems/insert-greatest-common-divisors-in-linked-list
  Difficulty: Medium
  Topic : Linked List, Math, Number Theory
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
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        var node = head
        while node?.next != nil {
            var gcd = (node?.val, node?.next?.val)
            while gcd.1! != 0 {
                gcd = (gcd.1!, gcd.0! % gcd.1!)
            }
            let newNode = ListNode(gcd.0!, node?.next)
            node?.next = newNode
            node = newNode.next
        }
        return head
    }
}
