import Foundation

final class DoubleLinkedList {
    final class ListNode {
        let val: Int?
        let index: Int
        var front: ListNode?
        var back: ListNode?
        init(val: Int? = nil, index: Int = 0, front: ListNode? = nil, back: ListNode? = nil) {
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
    
    @inline(__always) public func push(isFront: Bool, value: Int) {
        if isFront {
            let dequeNode = ListNode(val: value, index: count + 1, front: front, back: front?.back)
            front?.back?.front = dequeNode
            front?.back = dequeNode
        } else {
            let dequeNode = ListNode(val: value, index: count + 1, front: back?.front, back: back)
            back?.front?.back = dequeNode
            back?.front = dequeNode
        }
        count += 1
    }
    
    @inline(__always) public func pop(isFront: Bool) -> Int? {
        if count == 0 { return nil }
        let popNode = isFront ? front?.back : back?.front
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
    
    @inline(__always) public func popNode(_ node: ListNode?) {
        guard let node = node else { return }
        node.front?.back = node.back
        node.back?.front = node.front
        node.back = nil
        node.front = nil
        count -= 1
    }
    
    @inline(__always) public func getValue(isFront: Bool) -> Int? {
        if count == 0 { return nil }
        return (isFront ? front?.back?.val : back?.front?.val)
    }
}
