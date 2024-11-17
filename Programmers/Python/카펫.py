"""
  카펫
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42842
  Difficulty: Lv.2
  Topic : 완전탐색
"""

def solution(brown, yellow):
    half = brown // 2
    for i in range(1,half-2):
        if (half-i-2) * i == yellow:
            return [half-i,i+2]
    return []
