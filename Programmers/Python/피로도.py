"""
  피로도
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/87946
  Difficulty: Lv.2
  Topic : 완전탐색
"""

from itertools import permutations

def solution(k, dungeons):
    result = 0
    p = permutations(dungeons, len(dungeons))
    for dungeonSet in p:
        tempResult = 0
        tempK = k
        for d in dungeonSet:
            if d[0] <= tempK:
                tempK -= d[1]
                tempResult += 1
            else: break
        result = max(result, tempResult)
    return result
