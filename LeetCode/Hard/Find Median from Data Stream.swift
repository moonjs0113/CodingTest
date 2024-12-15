/*
  Find Median from Data Stream
  URL: https://leetcode.com/problems/find-median-from-data-stream
  Difficulty: Hard
  Topic : Two Pointers, Design, Sorting, Heap (Priority Queue), Data Stream
*/

import Collections

class MedianFinder {
    var leftHeap: Heap<Int> = Heap()
    var rightHeap: Heap<Int> = Heap()
    var isEven = true
    
    init() { }
    
    func addNum(_ num: Int) {
        if isEven {
            rightHeap.insert(num)
            leftHeap.insert(rightHeap.removeMin())
        } else {
            leftHeap.insert(num)
            rightHeap.insert(leftHeap.removeMax())
        }
        isEven = !isEven
    }
    
    func findMedian() -> Double {
        isEven ? Double(leftHeap.max! + rightHeap.min!) / 2.0 : Double(leftHeap.max!)
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
