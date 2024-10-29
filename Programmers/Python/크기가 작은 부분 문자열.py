"""
  크기가 작은 부분 문자열
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/147355
  Difficulty: Lv.1
  Topic : Array
"""

def solution(t, p):
    return len(list(filter(lambda x: int(p) >= int(t[x:x+len(p)]), range(len(t)-len(p)+1))))
