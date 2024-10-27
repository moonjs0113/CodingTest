"""
  완주하지 못한 선수
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42576
  Difficulty: Lv.1
  Topic : Hash
"""

def solution(participant, completion):
    if len(set(participant)) == len(participant):
        return list(set(participant) - set(completion))[0]
    completion = sorted(completion)
    participant = sorted(participant)
    for i in range(len(completion)):
        if participant[i] != completion[i]:
            return participant[i]
    return participant[-1]
