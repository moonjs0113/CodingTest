"""
 입국심사
 URL: https://school.programmers.co.kr/learn/courses/30/lessons/43238
 Difficulty: Lv.3
 Topic : Binary Search
"""

def solution(n, times):
    tRange = [1,0,max(times)*n]
    tRange[1] = tRange[0] + ((tRange[2] - tRange[0]) // 2)
    while tRange[0] < tRange[2]:
        nums = 0
        for t in times:
            nums += tRange[1] // t
        if nums >= n:
            tRange[2] = tRange[1]
        else:
            tRange[0] = tRange[1] + 1
        tRange[1] = tRange[0] + ((tRange[2] - tRange[0]) // 2)
    return tRange[1]
