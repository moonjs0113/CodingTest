"""
  Minimum Array End
  URL: https://leetcode.com/problems/minimum-array-end
  Difficulty: Medium
  Topic : Bit Manipulation
"""

class Solution:
    def minEnd(self, n: int, x: int) -> int:
        xBinString = f"0{x:b}"[::-1]
        binaryPow = []
        for i in range(len(xBinString)):
            if xBinString[i] == "0":
                binaryPow.append(i)
        nBinString = f"{n-1:b}"[::-1]
        result = 0
        for i in range(len(nBinString)):
            if nBinString[i] == "1":
                nPow = binaryPow[i] if len(binaryPow) > i else (binaryPow[-1] + i - len(binaryPow) + 1)
                result += 2 ** nPow
        return result + x
