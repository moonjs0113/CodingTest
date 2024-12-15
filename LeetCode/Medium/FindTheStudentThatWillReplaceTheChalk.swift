/*
  Find the Student that Will Replace the Chalk
  URL: https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk/
  Difficulty: Medium
  Topic : Array, Binary Search, Simulation, Prefix Sum
*/

class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        var i = 0
        var k = k % chalk.reduce(0,+)
        while k >= chalk[i] {
            k -= chalk[i]
            i += 1
        }
        return i
    }
}
