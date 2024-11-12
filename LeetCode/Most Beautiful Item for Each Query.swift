/*
  Most Beautiful Item for Each Query
  URL: https://leetcode.com/problems/most-beautiful-item-for-each-query
  Difficulty: Medium
  Topic : Array, Binary Search, Sorting
*/

class Solution {
    func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
        var sortedItems: [[Int]] = []
        var temp = 0
        for item in items.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] } {
            if temp != item[0] {
                var i = item
                if i[1] < (sortedItems.last ?? [0,0])[1] {
                    i[1] = sortedItems.last![1]
                }
                sortedItems.append(i)
                temp = i[0]
            }
        }
        var dict: [Int:Int] = [:]
        var result: [Int] = []
        return queries.map { q in
            if q < sortedItems.first![0] { return 0 }
            if q >= sortedItems.last![0] { return sortedItems.last![1] }
            if let cache = dict[q] { return cache }

            var l = 0
            var r = sortedItems.count - 1
            while l < r {
                let mid = (l + r) / 2
                if sortedItems[mid][0] == q {
                    l = mid
                    break
                }
                if l == mid {  break }
                if sortedItems[mid][0] < q {
                    l = mid
                } else {
                    r = mid
                }
            }
            dict[q] = sortedItems[l][1]
            return sortedItems[l][1]
        }
    }
}
