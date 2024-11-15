/*
  Shortest Subarray to be Removed to Make Array Sorted
  URL: https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted
  Difficulty: Medium
  Topic : Array, Two Pointers, Binary Search, Stack, Monotonic Stack
*/

class Solution {
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        var r = arr.count - 1
        while r > 0 && arr[r] >= arr[r-1] {
            r -= 1
        }
        var result = r
        var l = 0
        while l < r && (l == 0 || arr[l-1] <= arr[l]) {
            while r < arr.count && arr[l] > arr[r] {
                r += 1
            }
            result = min(result, r - l - 1)
            l += 1
        }
        return result
    }
}
