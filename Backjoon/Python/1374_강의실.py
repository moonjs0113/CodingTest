"""
 강의실
 https://www.acmicpc.net/problem/1374
"""

import heapq

n = int(input())
lectures = []
rooms = []
for i in range(n):
    lectures.append(list(map(int,input().split())))
lectures = sorted(lectures, key=lambda x: x[1])
result = 0
for l in lectures:
    if rooms and rooms[0] <= l[1]:
        heapq.heappop(rooms)
    heapq.heappush(rooms, l[2])
    result = max(result, len(rooms))
print(result)
