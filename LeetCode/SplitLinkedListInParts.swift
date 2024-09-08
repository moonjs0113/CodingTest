/*
  Split Linked List in Parts
  URL: https://leetcode.com/problems/split-linked-list-in-parts
  Difficulty: Medium
  Topic : Linked List
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
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var count = 0
        var node = head
        var result: [ListNode?] = []
        while node != nil {
            count += 1
            node = node?.next
        }

        node = head
        if k >= count {
            (0..<k).forEach { _ in 
                var temp = node
                node = node?.next
                temp?.next = nil
                result.append(temp)
            }
        } else {
            var group = count / k, rest = count % k
            (0..<k).forEach { i in
                var partNode = node
                var endNode = partNode
                (0..<group-1).forEach { _ in
                    endNode = endNode?.next
                }
                if i < rest { endNode = endNode?.next }
                node = endNode?.next
                endNode?.next = nil
                result.append(partNode)
            }
        }
        return result
    }
}
