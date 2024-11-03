"""
  모음사전
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/84512
  Difficulty: Lv.2
  Topic : 완전탐색
"""

def solution(word):
    word = word + (" " * (5 - len(word)))
    vowel = ['A', 'E', 'I', 'O', 'U']
    value = 1
    answer = 0
    for v in word[::-1]:
        if v != " ":
            i = vowel.index(v)
            answer += i * value + 1
        value = 5 * value +1
    return answer
