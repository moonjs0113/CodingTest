"""
  단속카메라
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42884
  Difficulty: Lv.3
  Topic : Greedy
"""

def solution(routes):
    result = 1
    routes = sorted(routes, key=lambda x: x[0])
    print(routes)
    end = routes[0][1]
    for i in range(1,len(routes)):
        if routes[i][0] <= end:
            if routes[i][1] >= end:
                continue
            else:
                end = routes[i][1]
        else:
            end = routes[i][1]
            result += 1
    return result
