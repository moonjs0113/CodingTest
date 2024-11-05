"""
  Minimum Number of Changes to Make Binary String Beautiful
  URL: https://leetcode.com/problems/minimum-number-of-changes-to-make-binary-string-beautiful
  Difficulty: Medium
  Topic : String
"""

class Solution:
    def minChanges(self, s: str) -> int:
        count = 0
        char = "0" if s[0] == "1" else "1"
        subCount = 0
        for c in s:
            if c != char:
                if subCount % 2 == 0:
                    char = c
                    subCount = 1
                else:
                    count += 1
                    char = "0" if c == "1" else "1"
                    subCount = 0
            else:
                subCount += 1
        return count
