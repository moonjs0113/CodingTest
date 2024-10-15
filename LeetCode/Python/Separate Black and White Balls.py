"""
  Separate Black and White Balls
  URL: https://leetcode.com/problems/separate-black-and-white-balls
  Difficulty: Medium
  Topic: Two Pointers, String, Greedy
"""

class Solution:
    def minimumSteps(self, s: str) -> int:
        one = 0
        result = 0
        for i in s:
            if i == '1':
                one += 1
            else:
                result += one
        return result
        
