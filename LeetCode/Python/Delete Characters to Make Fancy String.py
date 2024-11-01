"""
  Delete Characters to Make Fancy String
  URL: https://leetcode.com/problems/delete-characters-to-make-fancy-string
  Difficulty: Easy
  Topic : String
"""

class Solution:
    def makeFancyString(self, s: str) -> str:
        char = " "
        count = 0
        result = ""
        for c in s:
            if c == char:
                if count < 2:
                    result += c
                count += 1
            else:
                char = c
                count = 1
                result += c
        return result
