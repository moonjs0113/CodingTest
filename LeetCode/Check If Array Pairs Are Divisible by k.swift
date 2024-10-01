/*
  Check If Array Pairs Are Divisible by k
  URL: https://leetcode.com/problems/check-if-array-pairs-are-divisible-by-k
  Difficulty: Medium
  Topic : Array, Hash Table, Counting
*/

class Solution {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        var copyArr = arr
        var frequency = Array(repeating: 0, count: k)

        for i in 0..<copyArr.count {
            copyArr[i] = copyArr[i] % k
            if copyArr[i] < 0 {
                copyArr[i] = copyArr[i] + k
            }
            frequency[copyArr[i]] += 1
        }

        if frequency[0] % 2 != 0 { return false  }

        if k/2 == 0 { return true }
        
        for i in 1...k/2 {
            if frequency[i] != frequency[k-i] { return false  }
        }

        return true 
    }
}
