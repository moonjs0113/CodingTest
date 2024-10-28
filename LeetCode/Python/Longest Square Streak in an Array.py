"""
  Longest Square Streak in an Array
  URL: https://leetcode.com/problems/longest-square-streak-in-an-array
  Difficulty: Medium
  Topic : Array, Hash Table, Binary Search, Dynamic Programming, Sorting
"""

class Solution:
    def longestSquareStreak(self, nums: List[int]) -> int:
        origin = set(nums)
        cache = set([])
        i = 0
        r = -1
        while i < len(nums):
            n = nums[i]
            if not n in cache:
                cache.add(n)
                c = 1
                while n*n in origin:
                    c += 1
                    n *= n
                    cache.add(n)
                if c > 1:
                    r = max(r, c)
            i += 1
        return r
