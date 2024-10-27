"""
  폰켓몬
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/1845
  Difficulty: Lv.1
  Topic : Hash
"""

def solution(nums):
    return min(len(set(nums)),len(nums)//2)
