"""
  Rotate String
  URL: https://leetcode.com/problems/rotate-string
  Difficulty: Easy
  Topic : String, String Matching
"""

class Solution:
    def rotateString(self, s: str, goal: str) -> bool:
        if s == goal: return True
        if len(s) != len(goal) or set(s) != set(goal): return False
        temp = s
        for _ in range(len(s)):
            temp = temp[-1] + temp[0:len(s)-1]
            if temp == goal: return True
        return False
            
