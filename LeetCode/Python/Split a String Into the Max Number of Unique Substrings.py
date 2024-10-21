"""
  Split a String Into the Max Number of Unique Substrings
  URL: https://leetcode.com/problems/split-a-string-into-the-max-number-of-unique-substrings
  Difficulty: Medium
  Topic : Hash Table, String, Backtracking
"""

class Solution:
    def maxUniqueSplit(self, s: str) -> int:
        if len(s) == 1: return 1
        if len(set(s)) == len(s): return len(s)
        r = 1
        subList = [[s[0]]]
        for i in range(1,len(s)):
            temp = []
            for sub in subList:
                tempSub = sub.copy()
                tempSub.append(s[i])
                temp.append(tempSub)
                r = max(len(set(tempSub)), r)
                tempSub = sub.copy()
                last = tempSub.pop()
                tempSub.append(f"{last}{s[i]}")
                temp.append(tempSub)
                r = max(len(set(tempSub)), r)
            subList = temp
        return r
