"""
  Maximum Swap
  URL: https://leetcode.com/problems/maximum-swap
  Difficulty: Medium
  Topic: Math, Greedy
"""

class Solution:
    def maximumSwap(self, num: int) -> int:
        nums = list(map(int,f"{num}"))
        index = 0
        flag = False
        while index < len(nums):
            maxNum = max(nums[index:len(nums)])
            maxNumIndex = len(nums) - 1 - nums[::-1].index(maxNum)
            while index <= maxNumIndex:
                if nums[index] < maxNum:
                    nums[maxNumIndex] = nums[index]
                    nums[index] = maxNum
                    flag = True
                    break
                index += 1
            if flag:
                break
        return int(''.join(map(str,nums)))
