/*
  Count Number of Maximum Bitwise-OR Subsets
  URL: https://leetcode.com/problems/count-number-of-maximum-bitwise-or-subsets
  Difficulty: Medium
  Topic : Array, Backtracking, Bit Manipulation, Enumeration
*/

import Foundation
class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        if Set(nums).count == 1 { return Int(pow(2.0,Double(nums.count))) - 1 }
        
        var dict: [Int:[[Int]]] = [:]
        func subset(a: [Int], i: Int) {
            if i == nums.count { return }
            for j in (i..<nums.count) {
                var temp = a
                temp.append(nums[j])
                let bit = temp.reduce(0) { $0 | $1 }
                if dict[bit] == nil {
                    dict[bit] = [temp]
                } else {
                    dict[bit]?.append(temp)
                }
                subset(a: temp, i: j + 1)
            }
        }
      
        subset(a: [], i: 0)
        return dict.sorted{ $0.key > $1.key }.first!.value.count
    }
}
