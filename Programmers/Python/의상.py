"""
  의상
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42578
  Difficulty: Lv.2
  Topic : Hash
"""

def solution(clothes):
    clothesDict = {}
    for c in clothes:
        clothesDict[c[1]] = clothesDict[c[1]] + 1 if c[1] in clothesDict else 1
    answer = 1
    for v in clothesDict.values():
        answer *= v+1
    return answer - 1
