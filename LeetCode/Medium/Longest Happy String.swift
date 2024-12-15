/*
  Longest Happy String
  URL: https://leetcode.com/problems/longest-happy-string
  Difficulty: Medium
  Topic: String, Greedy, Heap (Priority Queue)
*/

class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        let abcDict = [0:"a", 1:"b", 2:"c"]
        var abc = [a,b,c]
        var p = abc.firstIndex(of: abc.max()!)!
        var result = ""
        while abc[p] != 0 {
            result += abcDict[p]!
            abc[p] -= 1
            p = abc.firstIndex(of: p == 0 ? [abc[1],abc[2]].max()! : (p == 1 ? [abc[0],abc[2]].max()! : [abc[0],abc[1]].max()!))!
        }
        for i in (0..<3) {
            if abc[i] > 0 {
                let subString = result.components(separatedBy: abcDict[i]!)
                p = [abc[i],subString.count-1].min()!
                var temp = ""
                for s in (0..<subString.count-1) {
                    temp += subString[s] + (p > 0 ? "\(abcDict[i]!)\(abcDict[i]!)" : "\(abcDict[i]!)") 
                    p -= 1
                result = temp
                }
            }
        }
        return result
    }
}
