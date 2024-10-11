/*
  The Number of the Smallest Unoccupied Chair
  URL: https://leetcode.com/problems/the-number-of-the-smallest-unoccupied-chair
  Difficulty: Medium
  Topic: Array, Hash Table, Heap (Priority Queue)
*/

class Solution {
    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        var queue: [Int] = []
        var queuePointer: Int = -1
        var result = -1
        for time in (times.sorted { $0.first! < $1.first! }) {
            for i in (0..<queue.count) {
                if queue[i] <= time.first! { queue[i] = 0 }
                if queue[i] == 0 && (queuePointer == -1 || queuePointer > i)  {
                    queuePointer = i
                }
            }
            
            if queuePointer == -1 {
                queue.append(time.last!)
                result = queue.count - 1
            } else {
                queue[queuePointer] = time.last!
                result = queuePointer
                queuePointer = queue.firstIndex(of: 0) ?? -1
            }
            if time.first! == times[targetFriend].first! {
                break
            }
        }
        return result
    }
}
