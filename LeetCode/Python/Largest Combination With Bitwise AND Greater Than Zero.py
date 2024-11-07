"""
  Largest Combination With Bitwise AND Greater Than Zero
  URL: https://leetcode.com/problems/largest-combination-with-bitwise-and-greater-than-zero
  Difficulty: Medium
  Topic : Array, Hash Table, Bit Manipulation, Counting
"""

class Solution:
    def largestCombination(self, candidates: List[int]) -> int:
        maxLength = 0
        binaryString = []
        for c in candidates:
            br = "{0:b}".format(c)[::-1]
            maxLength = max(len(br), maxLength)
            binaryString.append(br)
        result = 0
        for i in range(maxLength):
            count = 0
            for b in binaryString:
                if len(b) > i and b[i] == "1":
                    count += 1
            result = max(result, count)
        return result
