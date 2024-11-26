/*
  Flatten Nested List Iterator
  URL: https://leetcode.com/problems/flatten-nested-list-iterator
  Difficulty: Medium
  Topic : Stack, Tree, Depth-First Search, Design, Queue, Iterator
*/

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {
    var list: [Int] = []
    var p: Int = 0
    init(_ nestedList: [NestedInteger]) {
        nestedList.forEach { n in
            if n.isInteger() {
                list.append(n.getInteger())
            } else {
                let iterator = NestedIterator(n.getList())
                list += iterator.list
            }
        }
    }
    
    func next() -> Int {
        let value = list[p]
        p += 1
        return value
    }
    
    func hasNext() -> Bool {
        return p < list.count
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
