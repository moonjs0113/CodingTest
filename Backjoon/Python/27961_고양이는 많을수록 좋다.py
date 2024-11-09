"""
 고양이는 많을수록 좋다
 https://www.acmicpc.net/problem/27961
"""

n = int(input())
cat = 1
magicCount = 1
while cat < n:
  cat *= 2
  magicCount += 1
print(0 if n == 0 else magicCount)
