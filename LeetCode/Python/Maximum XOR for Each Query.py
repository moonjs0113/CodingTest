"""
  Maximum XOR for Each Query
  URL: https://leetcode.com/problems/maximum-xor-for-each-query
  Difficulty: Medium
  Topic : Array, Bit Manipulation, Prefix Sum
"""

class Solution:
    def getMaximumXor(self, nums: List[int], maximumBit: int) -> List[int]:
        sums = [nums[0]]
        xors = [int(f'{nums[0] ^ (2**20 - 1):020b}'[-maximumBit:], 2)]
        for i in range(1,len(nums)):
            xor = sums[-1] ^ nums[i]
            sums.append(xor)
            xors.append(int(f'{xor ^ (2**20 - 1):020b}'[-maximumBit:], 2))
        return xors[::-1]
