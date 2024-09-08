/*
 백준 단계 별로 풀어보기 16단계
 Deque
 */

import Foundation

final class Deque {
    final class DequeNode {
        let val: Int?
        var front: DequeNode?
        var back: DequeNode?
        init(val: Int? = nil, front: DequeNode? = nil, back: DequeNode? = nil) {
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
    
    @inline(__always) public func push(isFront: Bool, value: Int) {
        if isFront {
            let dequeNode = DequeNode(val: value, front: front, back: front?.back)
            front?.back?.front = dequeNode
            front?.back = dequeNode
        } else {
            let dequeNode = DequeNode(val: value, front: back?.front, back: back)
            back?.front?.back = dequeNode
            back?.front = dequeNode
        }
        count += 1
    }
    
    @inline(__always) public func pop(isFront: Bool) -> Int? {
        if count == 0 { return nil }
        var popNode = isFront ? front?.back : back?.front
        if isFront {
            front?.back = popNode?.back
            popNode?.back?.front = front
        } else {
            back?.front = popNode?.front
            popNode?.front?.back = back
        }
        popNode?.front = nil
        popNode?.back = nil
        count -= 1
        return popNode?.val
    }
    
    @inline(__always) public func getValue(isFront: Bool) -> Int? {
        if count == 0 { return nil }
        return (isFront ? front?.back?.val : back?.front?.val)
    }
}
