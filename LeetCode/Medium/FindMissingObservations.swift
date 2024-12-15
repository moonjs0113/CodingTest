/*
  Find Missing Observations
  URL: https://leetcode.com/problems/find-missing-observations
  Difficulty: Medium
  Topic : Array, Math, Simulation
*/

class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let sum = rolls.reduce(0,+)
        let originAvg = sum / rolls.count
        var rest = (rolls.count + n) * mean - sum
        if (rest > (n * 6)) || (rest < n) { return [] }
        rest -= n
        var result = Array(repeating: 6, count: rest/5)
        if result.count < n {
            var tail = Array(repeating: 1, count: n - result.count)
            tail[0] += (rest % 5)
            result += tail
        }
        return result
    }
}
