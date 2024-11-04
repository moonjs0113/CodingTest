"""
  String Compression III
  URL: https://leetcode.com/problems/string-compression-iii
  Difficulty: Medium
  Topic : String
"""

class Solution:
    def compressedString(self, word: str) -> str:
        charDict = {}
        cur = word[0]
        result = ""
        for c in (word + " "):
            if c != cur or (charDict[c] if c in charDict else 0) == 9:
                if charDict[cur] != 0:
                    result += f"{charDict[cur]}{cur}"
                cur = c
                charDict[cur] = 0
            charDict[c] = (charDict[c] if c in charDict else 0) + 1
        return result
