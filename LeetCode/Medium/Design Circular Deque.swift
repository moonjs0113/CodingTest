/*
  Design Circular Deque
  URL: https://leetcode.com/problems/design-circular-deque
  Difficulty: Medium
  Topic: Array, Linked List, Design, Queue
*/

class MyCircularDeque {
    var capability: Int
    var count = 0
    var deque: [Int] = [] // front ---- last

    init(_ k: Int) {
        self.capability = k
    }
    
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        deque = [value] + deque
        count += 1
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        deque.append(value)
        count += 1
        return true
    }

    func deleteFront() -> Bool {
        if isEmpty() { return false }
        _ = deque.removeFirst()
        count -= 1
        return true
    }
    
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        _ = deque.popLast()
        count -= 1
        return true
    }
    
    func getFront() -> Int {
        isEmpty() ? -1 : deque.first!
    }
    
    func getRear() -> Int {
        isEmpty() ? -1 : deque.last!
    }
    
    func isEmpty() -> Bool {
        count == 0
    }
    
    func isFull() -> Bool {
        count == capability
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
