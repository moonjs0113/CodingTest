/*
  Find if Array Can Be Sorted
  URL: https://leetcode.com/problems/find-if-array-can-be-sorted
  Difficulty: Medium
  Topic : Array, Bit Manipulation, Sorting
*/

class Solution {
    func canSortArray(_ nums: [Int]) -> Bool {
        var n = nums
        var setBit: [Int:Int] = [:]
        nums.forEach { num in
            setBit[num] = num.nonzeroBitCount
        }
        
        for _ in 0..<nums.count-1 {
            var flag = true
            for j in 0..<nums.count-1 {
                if n[j] > n[j+1] {
                    if setBit[n[j]]! != setBit[n[j+1]]! {
                        return false
                    }
                    let temp = n[j]
                    n[j] = n[j+1]
                    n[j+1] = temp
                    flag = false
                }
            }
            if flag { break }
        }
        return true
    }
}
