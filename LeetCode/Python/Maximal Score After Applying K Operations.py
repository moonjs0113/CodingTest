"""
  Maximal Score After Applying K Operations
  URL: https://leetcode.com/problems/maximal-score-after-applying-k-operations
  Difficulty: Medium
  Topic: Array, Greedy, Heap (Priority Queue)
"""

import heapq
import math

class Solution:
    def maxKelements(self, nums: List[int], k: int) -> int:
        maxNums = list(map(lambda x: -x, nums))
        heapq.heapify(maxNums)
        result = 0
        for i in range(0,k):
            value = -heapq.heappop(maxNums)
            result += value
            heapq.heappush(maxNums,-int(math.ceil(value / 3)))
        return result
