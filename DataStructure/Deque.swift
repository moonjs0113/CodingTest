/*
 DataStructure - Deque
 Time Complexity
    - Push: O(1)
    - Pop: O(1)
 Space Complexity: O(n)
 */

import Foundation

final class Deque<T> {
    enum Direction {
        case front
        case back
    }
    final class DequeNode {
        let val: T?
        var front: DequeNode?
        var back: DequeNode?
        init(val: T? = nil, front: DequeNode? = nil, back: DequeNode? = nil) {
            self.val = val; self.front = front; self.back = back
        }
    }
    var count: Int = 0
    var front: DequeNode?
    var back: DequeNode?
    init() {
        self.front = DequeNode()
        self.back = DequeNode(front: front)
        self.front?.back = back
    }
    
    @inline(__always) public func push(direction: Direction, value: T) {
        switch direction {
        case .front:
            let dequeNode = DequeNode(val: value, front: front, back: front?.back)
            front?.back?.front = dequeNode
            front?.back = dequeNode
        case .back:
            let dequeNode = DequeNode(val: value, front: back?.front, back: back)
            back?.front?.back = dequeNode
            back?.front = dequeNode
        }
        count += 1
    }
    
    @inline(__always) public func pop(direction: Direction) -> T? {
        if count == 0 { return nil }
        var popNode: DequeNode?
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
    
    @inline(__always) public func getValue(direction: Direction) -> T? {
        if count == 0 { return nil }
        switch direction {
        case .front:
            return front?.back?.val
        case .back:
            return back?.front?.val
        }
    }
}
