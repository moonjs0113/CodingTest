/*
  Minimum Time Difference
  URL: https://leetcode.com/problems/minimum-time-difference
  Difficulty: Medium
  Topic : Array, Math, String, Sorting
*/

class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var result = Int.max
        var sortedTimePoints = timePoints.map {  
            let t = $0.split(separator: ":").map { Int($0)! }
            return t[0] * 60 + t[1] 
        }.sorted(by: <)

        sortedTimePoints.reduce(-1) { prev, next -> Int in
            if prev == -1 { return next }
            result = min(result, next - prev)
            return next
        }
        return min(result, sortedTimePoints.first! + 1440 - sortedTimePoints.last!)
    }
}
