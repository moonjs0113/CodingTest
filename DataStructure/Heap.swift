/*
 DataStructure - DoubleLinkedList
 Time Complexity
    - Insert: O(log n)
    - Remove: O(log n)
 Space Complexity: O(n)
 */

import Foundation

class Heap<T: Comparable> {
    var heap: [T] = []
    let priorityFunction: (T, T) -> Bool

    init(priorityFunction: @escaping (T, T) -> Bool) {
        self.priorityFunction = priorityFunction
    }

    var isEmpty: Bool { heap.isEmpty }

    var count: Int { heap.count }

    var getRootValue: T? { heap.first }

    public func push(_ value: T) {
        heap.append(value)
        siftDown(from: 0, to: count-1)
    }

    public func pop() -> T? {
        guard !isEmpty else { return nil }
        let lastItem = heap.removeLast()
        if !isEmpty {
            let value = heap[0]
            heap[0] = lastItem
            siftUp(from: 0)
            return value
        }
        return lastItem
    }

    private func siftDown(from startIndex: Int, to index: Int) {
        let newValue = heap[index]
        var currentIndex = index
        while currentIndex > startIndex {
            let parentIndex = (currentIndex - 1) >> 1
            let parent = heap[parentIndex]
            if priorityFunction(newValue,parent) {
                heap[currentIndex] = parent
                currentIndex = parentIndex
                continue
            }
            break
        }
        heap[currentIndex] = newValue
    }

    private func siftUp(from index: Int) {
        var currentIndex = index
        let endIndex = self.count
        let startIndex = index
        let newValue = heap[index]
        var childIndex = 2 * index + 1
        
        while childIndex < endIndex {
            let rightIndex = childIndex + 1
            if rightIndex < endIndex && !priorityFunction(heap[childIndex],heap[rightIndex]) {
                childIndex = rightIndex
            }
            heap[currentIndex] = heap[childIndex]
            currentIndex = childIndex
            childIndex = 2 * currentIndex + 1
        }
        heap[currentIndex] = newValue
        siftDown(from: startIndex, to: currentIndex)
    }
}
