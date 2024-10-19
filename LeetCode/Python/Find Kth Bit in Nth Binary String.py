"""
  Find Kth Bit in Nth Binary String
  URL: https://leetcode.com/problems/find-kth-bit-in-nth-binary-string
  Difficulty: Medium
  Topic : String, Recursion, Simulation
"""

class Solution:
    def findKthBit(self, n: int, k: int) -> str:
        if n == 1: return "0"
        i = 1

        while 2 ** i <= k:
            i += 1
        
        count = 0
        while True:
            if (2 ** (i-1)) == k:
                base = "0" if i == 1 else "1"
                invert = "1" if i == 1 else "0"
                return (base if count % 2 == 0 else invert)
            if (2 ** (i - 1)) < k:
                k = (2 ** i) - k
                count += 1
            i -= 1
        
        return "0"
        
