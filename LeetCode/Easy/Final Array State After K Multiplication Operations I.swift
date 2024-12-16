/*
  Final Array State After K Multiplication Operations I
  URL: https://leetcode.com/problems/final-array-state-after-k-multiplication-operations-i
  Difficulty: Easy
  Topic: Array, Math, Heap (Priority Queue), Simulation
*/

import Collections

class Element: Comparable {
    var i: Int
    var v: Int
    static func < (lhs: Element, rhs: Element) -> Bool {
        if lhs.v == rhs.v {
            return lhs.i < rhs.i
        }
        return lhs.v < rhs.v
    }
    static func == (lhs: Element, rhs: Element) -> Bool { 
        lhs.v == rhs.v && lhs.i == rhs.i
    }

    init(i: Int, v: Int) {
        self.i = i
        self.v = v
    }
}

class Solution {
    func getFinalState(_ nums: [Int], _ k: Int, _ multiplier: Int) -> [Int] {
        var result = nums
        var heap = Heap<Element>()
        nums.enumerated().forEach {
            heap.insert(Element(i: $0.offset, v: $0.element))
        }
        for _ in 0..<k {
            guard let e = heap.popMin() else {
                break
            }
            result[e.i] *= multiplier
            heap.insert(Element(i: e.i, v: e.v * multiplier))
        }
        return result
    }
}
