"""
  Find if Array Can Be Sorted
  URL: https://leetcode.com/problems/find-if-array-can-be-sorted
  Difficulty: Medium
  Topic : Array, Bit Manipulation, Sorting
"""

class Solution:
    def canSortArray(self, nums: List[int]) -> bool:
        setBit = {}
        for num in nums:
            setBit[num] = num.bit_count()
        for _ in range(len(nums)-1):
            flag = True
            for i in range(len(nums)-1):
                if nums[i] > nums[i+1]:
                    if setBit[nums[i]] != setBit[nums[i+1]]:
                        return False
                    temp = nums[i]
                    nums[i] = nums[i+1]
                    nums[i+1] = temp
                    flag = False
            if flag: break
        return True
