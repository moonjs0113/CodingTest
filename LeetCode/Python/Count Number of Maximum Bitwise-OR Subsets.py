"""
  Count Number of Maximum Bitwise-OR Subsets
  URL: https://leetcode.com/problems/count-number-of-maximum-bitwise-or-subsets
  Difficulty: Medium
  Topic : Array, Backtracking, Bit Manipulation, Enumeration
"""

import collections
from functools import reduce

class Solution:
    def countMaxOrSubsets(self, nums: List[int]) -> int:
        if len(set(nums)) == 1:
            return (2 ** len(nums)) - 1
        subSet = collections.defaultdict(int)
        def subset(a: list, i: int):
            if i == len(nums):
                return
            for j in range(i,len(nums)):
                temp = a
                temp.append(nums[j])
                key = reduce(lambda r, x: r | x, temp, 0)
                subSet[key] += 1
                subset(temp, j + 1)
                temp.pop()
        subset([],0)
        return sorted(subSet.items(), reverse=True)[0][1]
