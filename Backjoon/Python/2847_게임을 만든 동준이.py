"""
 게임을 만든 동준이
 https://www.acmicpc.net/problem/2847
"""

result = 0
n = int(input())
nums = [int(input()) for _ in range(n)][::-1]
prev = nums[0]
for i in range(1,n):
    if nums[i] >= prev:
        result += nums[i] - prev + 1
        prev -= 1
    else:
        prev = nums[i]
print(result)
