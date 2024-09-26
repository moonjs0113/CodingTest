/*
  My Calendar I
  URL: https://leetcode.com/problems/my-calendar-i
  Difficulty: Medium
  Topic : Array, Binary Search, Design, Segment Tree, Ordered Set
*/

class MyCalendar {
    init() { }
    var pointers: [(Int,Int)] = []
    func book(_ start: Int, _ end: Int) -> Bool {
        for pointer in pointers {
            if pointer.0 <= start && start < pointer.1 { return false }
            if pointer.0 < end && end <= pointer.1 { return false }
            if start <= pointer.0 && pointer.1 <= end { return false }
        }
        pointers.append((start, end))
        pointers.sort { $0.0 < $1.0 }
        return true
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */

