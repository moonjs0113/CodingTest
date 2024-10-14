/*
 DataStructure - DoubleLinkedList
 Time Complexity
    - Insert: O(log n)
    - Remove: O(log n)
 Space Complexity: O(n)
 */

import Foundation

class Heap<T: Comparable> {
    var elements: [T] = []
    let priorityFunction: (T, T) -> Bool

    init(priorityFunction: @escaping (T, T) -> Bool) {
        self.priorityFunction = priorityFunction
    }

    var isEmpty: Bool { elements.isEmpty }

    var count: Int { elements.count }

    var getRootValue: T? { elements.first }

    func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    func remove() -> T? {
        guard !isEmpty else { return nil }
        if count == 1 {
            return elements.removeLast()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            siftDown(from: 0)
            return value
        }
    }

    private func siftUp(from index: Int) {
        var childIndex = index
        let childValue = elements[childIndex]
        var parentIndex = (childIndex - 1) / 2 // parentIndex

        while childIndex > 0 && priorityFunction(childValue, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2 // parentIndex
        }
        
        elements[childIndex] = childValue
    }

    private func siftDown(from index: Int) {
        var parentIndex = index
        let length = count

        while true {
            let leftChildIndex = (2 * parentIndex) + 1 // leftChildIndex
            let rightChildIndex = (2 * parentIndex) + 2 // rightChildIndex
            var optionalParentSwapIndex: Int?

            if leftChildIndex < length && priorityFunction(elements[leftChildIndex], elements[parentIndex]) {
                optionalParentSwapIndex = leftChildIndex
            }

            if rightChildIndex < length && priorityFunction(elements[rightChildIndex], elements[optionalParentSwapIndex ?? parentIndex]) {
                optionalParentSwapIndex = rightChildIndex
            }

            guard let swapIndex = optionalParentSwapIndex else {
                return
            }

            elements.swapAt(parentIndex, swapIndex)
            parentIndex = swapIndex
        }
    }
}

