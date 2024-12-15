/*
  이중우선순위큐(Dual Priority Queue)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42628
  Difficulty: Lv.3
  Topic : Heap
*/

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    operations.forEach { operation in
        let operationValue = OperationType.parse(operation)
        switch operationValue {
        case .input(let value):
            queue.append(value)
        case .delete(let isMax):
            if !queue.isEmpty {
                let value = (isMax ? queue.max() : queue.min())!
                queue.remove(at: queue.firstIndex(of: value)!)
            }
        }
    }
    return queue.isEmpty ? [0,0] : [queue.max()!,queue.min()!]
}

enum OperationType {
    case input(Int)
    case delete(Bool)
    
    static func parse(_ operation: String) -> OperationType {
        let value = operation.split(separator: " ")
        let num = Int(value.last!)!
        return value.first! == "I" ? .input(num) : .delete(num == 1)
    } 
}
