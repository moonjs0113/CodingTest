/*
  Split a String Into the Max Number of Unique Substrings
  URL: https://leetcode.com/problems/split-a-string-into-the-max-number-of-unique-substrings
  Difficulty: Medium
  Topic : Hash Table, String, Backtracking
*/

class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        if s.count == 1 { return 1 }
        if Set(s).count == s.count { return s.count }
        let sArray = Array(s)
        var r = 1
        var subList = [["\(sArray[0])"]]
        for i in 1..<s.count {
            var temp:[[String]] = []
            for sub in subList {
                var tempSub = sub
                tempSub.append("\(sArray[i])")
                temp.append(tempSub)
                r = max(Set(tempSub).count, r)
                tempSub = sub
                let last = tempSub.popLast()!
                tempSub.append("\(last)\(sArray[i])")
                temp.append(tempSub)
                r = max(Set(tempSub).count, r)
            }
            subList = temp
        }
        return r
    }
}
