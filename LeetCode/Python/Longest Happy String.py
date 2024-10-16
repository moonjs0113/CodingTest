"""
  Longest Happy String
  URL: https://leetcode.com/problems/longest-happy-string
  Difficulty: Medium
  Topic: String, Greedy, Heap (Priority Queue)
"""

class Solution:
    def longestDiverseString(self, a: int, b: int, c: int) -> str:
        abc = [a,b,c]
        abcDict = {0:"a", 1:"b", 2:"c"}
        p = abc.index(max(abc))
        result = ""
        while True:
            if abc[p] == 0:
                break
            result += (1 * abcDict[p])
            abc[p] -= 1
            p = abc.index(max((abc[1:3] if p == 0 else (abc[0:3:2] if p == 1 else abc[0:2]))))
        for i in range(3):
            if abc[i] > 0:
                p = min(abc[i],result.count(abcDict[i]))
                subString = result.split(abcDict[i])
                temp = ""
                for s in range(len(subString)-1):
                    temp += subString[s]
                    if p > 0:
                        temp += (abcDict[i] * 2)
                        p -= 1
                    else:
                        temp += abcDict[i]
                result = temp
        return result
