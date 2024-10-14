/*
 DataStructure - DoubleLinkedList
 Time Complexity
    - Push: O(1)
    - Pop: O(1)
    - Search: O(n)
 Space Complexity: O(n)
 */

import Foundation

final class DoubleLinkedList<T> {
    enum Direction {
        case front
        case back
    }
    final class ListNode {
        let val: T?
        let index: Int
        var front: ListNode?
        var back: ListNode?
        init(val: T? = nil, index: Int = 0, front: ListNode? = nil, back: ListNode? = nil) {
            self.val = val; self.index = index; self.front = front; self.back = back
        }
    }
    var count: Int = 0
    var front: ListNode?
    var back: ListNode?
    init() {
        self.front = ListNode()
        self.back = ListNode(front: front)
        self.front?.back = back
    }
    
    @inline(__always) public func push(to direction: Direction, value: T) {
        switch direction {
        case .front:
            let dequeNode = ListNode(val: value, index: count + 1, front: front, back: front?.back)
            front?.back?.front = dequeNode
            front?.back = dequeNode
        case .back:
            let dequeNode = ListNode(val: value, index: count + 1, front: back?.front, back: back)
            back?.front?.back = dequeNode
            back?.front = dequeNode
        }
        count += 1
    }
    
    @inline(__always) public func pop(from direction: Direction) -> T? {
        if count == 0 { return nil }
        let popNode: ListNode?
        switch direction {
        case .front:
            popNode = front?.back
            front?.back = popNode?.back
            popNode?.back?.front = front
        case .back:
            popNode = back?.front
            back?.front = popNode?.front
            popNode?.front?.back = back
        }
        popNode?.front = nil
        popNode?.back = nil
        count -= 1
        return popNode?.val
    }
    
    @inline(__always) public func popNode(_ node: ListNode?) {
        guard let node = node else { return }
        node.front?.back = node.back
        node.back?.front = node.front
        node.back = nil
        node.front = nil
        count -= 1
    }
    
    @inline(__always) public func getValue(from direction: Direction) -> T? {
        if count == 0 { return nil }
        switch direction {
        case .front:
            return front?.back?.val
        case .back:
            return back?.front?.val
        }
    }
}
