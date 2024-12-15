/*
  Check If N and Its Double Exist
  URL: https://leetcode.com/problems/check-if-n-and-its-double-exist
  Difficulty: Easy
  Topic : Array, Hash Table, Two Pointers, Binary Search, Sorting
*/

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var dict: [Int:Int] = [:]
        for i in 0..<arr.count {
            dict[2*arr[i]] = i
        }
    
        for i in 0..<arr.count {
            if let index = dict[arr[i]] {
                if index != i {
                    return true
                }
            }
        }
        return false
    }
}
