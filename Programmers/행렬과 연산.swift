/*
  행렬과 연산
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/118670
  Difficulty: Lv.4
  Topic : 2022 KAKAO TECH INTERNSHIP
*/

import Foundation

func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
    var matrix = Matrix()
    for row in rc {
        let deque = Deque<Int>()
        for i in 0..<row.count {
            switch i {
            case 0:
                matrix.front.push(direction: .back, value: row[i])
            case row.count - 1:
                matrix.back.push(direction: .back, value: row[i])
            default:
                deque.push(direction: .back, value: row[i])
            }
        }
        matrix.rowDeque.push(direction: .back, value: deque)
    }
    for o in operations {
        (o.first! == "S") ? shiftRow(&matrix) : rotate(&matrix)
    }
    return matrix.result
}

func shiftRow(_ matrix: inout Matrix) {
    if let frontBack = matrix.front.pop(direction: .back) {
        matrix.front.push(direction: .front, value: frontBack)
    }
    if let backBack = matrix.back.pop(direction: .back) {
        matrix.back.push(direction: .front, value: backBack)
    }
    if let rowBack = matrix.rowDeque.pop(direction: .back) {
        matrix.rowDeque.push(direction: .front, value: rowBack)
    }
}

func rotate(_ matrix: inout Matrix) {
    var temp = 0
    if let frontFront = matrix.front.pop(direction: .front) {
        if let rowFront = matrix.rowDeque.getValue(direction: .front) {
            rowFront.push(direction: .front, value: frontFront)
            if let rowFrontback = rowFront.pop(direction: .back) {
                temp = rowFrontback
            }
        } else {
            temp = frontFront
        }
        matrix.back.push(direction: .front, value: temp)
    }
    if let backBack = matrix.back.pop(direction: .back) {
        if let rowBack = matrix.rowDeque.getValue(direction: .back) {
            rowBack.push(direction: .back, value: backBack)
            if let rowBackfront = rowBack.pop(direction: .front) {
                temp = rowBackfront
            }
        } else {
            temp = backBack
        }
        matrix.front.push(direction: .back, value: temp)
    }
}

class Matrix {
    var rowDeque = Deque<Deque<Int>>()
    var front = Deque<Int>()
    var back =  Deque<Int>()
    
    var result: [[Int]] {
        var rc: [[Int]] = []
        while rowDeque.count > 0 {
            var row: [Int] = []
            if let front = front.pop(direction: .front) {
                row.append(front)
            }
            if let deque = rowDeque.pop(direction: .front) {
                while deque.count > 0 {
                    if let value = deque.pop(direction: .front) {
                        row.append(value)
                    }
                }
            }
            if let back = back.pop(direction: .front) {
                row.append(back)
            }
            rc.append(row)
        }
        return rc
    }
}

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
    
    public func push(direction: Direction, value: T) {
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
    
    
    public func pop(direction: Direction) -> T? {
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
    
    public func getValue(direction: Direction) -> T? {
        if count == 0 { return nil }
        switch direction {
        case .front:
            return front?.back?.val
        case .back:
            return back?.front?.val
        }
    }
}
