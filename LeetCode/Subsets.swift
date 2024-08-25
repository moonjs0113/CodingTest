/*
  Subsets
  URL: https://leetcode.com/problems/subsets
  Difficulty: Medium
  Topic : Array, Backtracking, Bit Manipulation
*/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        typealias Subsets = [[Int]]
        func dfs(_ set: Subsets ,_ num: Int) -> Subsets {
            var tempSet = set
            set.forEach { subset in
                tempSet.append(subset + [num])
            }
            return tempSet
        }
        return nums.reduce([Array<Int>()]) { result, num in
            dfs(result, num)
        }
    }
}
